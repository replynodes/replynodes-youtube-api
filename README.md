# replynodes-youtube-api

OpenClaw-installable, public YouTube research skill for the ReplyNodes MCP.

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

## Current MCP contract

Canonical endpoint: `https://mcp.replynodes.com/mcp`

The live MCP exposes these YouTube tools:

- `youtube_search`
- `youtube_video`
- `youtube_channel`
- `youtube_comments`
- `youtube_playlist`
- `youtube_related`
- `youtube_transcript`

Connect with a supported ReplyNodes MCP authentication flow. Headless clients
may use a ReplyNodes Bearer API key through their secret/environment support.
Unauthenticated tool use is rejected; discover the live schemas with
`tools/list` after connecting. This repository documents only the canonical MCP
endpoint and current tool contract.

The package is a research skill, not a platform-management tool. It does not
support upload, liking, subscribing, posting comments, account actions, OAuth,
cookies, sessions, platform credentials, or private data.

## Growth metadata

Primary activation: an agent completes a grounded YouTube research answer with endpoint provenance and explicit null/partial/unavailable handling. Discovery copy emphasizes outcomes rather than installation. Suggested funnel events are privacy-safe aggregate counts only: capability-discovery success, route invocation result class, envelope-validation success, and grounded-answer completion. Do not record tokens, raw research content, cookies, sessions, or provider identifiers.

## License

MIT. See `LICENSE`.
