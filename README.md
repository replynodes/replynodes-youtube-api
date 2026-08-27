# replynodes-youtube-api

OpenClaw-installable, read-only public YouTube research skill for the ReplyNodes API.

## Outcome-led discovery

Intent clusters: video discovery; video/channel inspection; comment research; playlist inspection; related-video exploration; transcript/caption research; provenance and missing-data audits.

Example prompts:

- Find public videos on a topic and compare the returned metadata.
- Inspect a video and its related results; separate observed data from inference.
- Summarize public comments while preserving unavailable and partial states.
- Compare channels or playlists and report null fields honestly.
- Retrieve a transcript when available and state clearly when it is unavailable.

## Install and test

Git install after publication to GitHub:

```bash
openclaw skills install git:replynodes/replynodes-youtube-api@main --as replynodes-youtube-api
```

Local checkout install:

```bash
openclaw skills install /path/to/replynodes-youtube-api --as replynodes-youtube-api
```

Offline package check:

```bash
bash scripts/validate-package.sh
```

No runtime code, dependencies, secrets, or provider credentials are included.

## API facts

Base URL: `https://api.replynodes.com`

- Discovery: `GET /.well-known/x402.json`
- Capability URL: `GET /v1/youtube/capabilities`
- Data routes: seven read-only GET operations documented in `SKILL.md`.
- Authentication/payment: Bearer prepaid credits or x402 v2. Current production x402 price: 3000 micros ($0.003) per call on Base `eip155:8453`.

The package is a research skill, not a platform-management tool. No write behavior or authenticated provider access is supported.

## Growth metadata

Primary activation: an agent completes a grounded YouTube research answer with endpoint provenance and explicit null/partial/unavailable handling. Discovery copy emphasizes outcomes rather than installation. Suggested funnel events are privacy-safe aggregate counts only: capability-discovery success, route invocation result class, envelope-validation success, and grounded-answer completion. Do not record tokens, raw research content, cookies, sessions, or provider identifiers.

## License

MIT. See `LICENSE`.
