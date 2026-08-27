#!/usr/bin/env bash
set -euo pipefail
root="$(CDPATH= cd -- "$(dirname -- "$0")/.." && pwd)"
expected='LICENSE PROVENANCE.md README.md RELEASE.md SECURITY.md SKILL.md VERSION references/capabilities.json references/endpoints.md scripts/validate-package.sh'
actual="$(find "$root" -type f -not -path '*/.git/*' -printf '%P\n' | sort | tr '\n' ' ' | sed 's/ $//')"
[[ "$actual" == "$expected" ]] || { printf 'FAIL structure\nexpected: %s\nactual: %s\n' "$expected" "$actual"; exit 1; }
python3 - "$root" <<'PY'
import json, pathlib, re, sys
root = pathlib.Path(sys.argv[1])
skill = (root/'SKILL.md').read_text()
assert skill.startswith('---\n') and '\n---\n' in skill[4:], 'frontmatter'
for term in ('replynodes-youtube-api','https://api.replynodes.com','search','video','channel','comments','playlist','related','transcript','readonly','untrusted','null','partial','unavailable','402','x402'):
    assert term.lower() in skill.lower(), term
cap = json.loads((root/'references/capabilities.json').read_text())
assert cap['name'] == 'replynodes-youtube-api' and len(cap['operations']) == 7
assert {x['name'] for x in cap['operations']} == {'search','video','channel','comments','playlist','related','transcript'}
for path in root.rglob('*'):
    if path.is_file() and '.git' not in path.parts and path.name != 'validate-package.sh':
        text = path.read_text(errors='strict')
        assert not re.search(r'(AKIA[0-9A-Z]{16}|-----BEGIN .*PRIVATE KEY-----|Bearer\\s+[A-Za-z0-9._-]{24,})', text), path
        assert not re.search(r'(?i)(oauth|cookie|session|provider credential)', text) or path.name in {'SKILL.md','SECURITY.md'}, path
print('PASS replynodes-youtube-api package structure, contract, and secret scan')
PY
