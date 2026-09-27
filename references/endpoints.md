# MCP endpoint reference

Canonical endpoint: `https://mcp.replynodes.com/mcp`

The endpoint uses MCP Streamable HTTP. Discover the current protocol and tools
with `initialize` followed by `tools/list`; the live schemas are authoritative.

Example request shape (the client must manage the session and authentication):

```bash
curl -N https://mcp.replynodes.com/mcp \
  -H 'Accept: application/json, text/event-stream' \
  -H 'Content-Type: application/json' \
  -H 'Authorization: Bearer <REDACTED>' \
  --data '{"jsonrpc":"2.0","id":1,"method":"tools/list","params":{}}'
```

Use only a host-configured credential. Never print, store, or commit a real API
key, cookie, session, or provider credential. Unauthenticated tool calls are
rejected; a successful `initialize` alone is not proof that a tool call is
authorized.

Current YouTube tools are `youtube_search`, `youtube_video`,
`youtube_channel`, `youtube_comments`, `youtube_playlist`, `youtube_related`,
and `youtube_transcript`. Preserve null, empty, partial, and unavailable fields
and distinguish returned data from inference.
