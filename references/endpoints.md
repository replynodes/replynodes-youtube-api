# Endpoint reference

Base: `https://api.replynodes.com`

Before a paid data request, read the live discovery documents:

```bash
curl -fsSL https://api.replynodes.com/.well-known/x402.json
curl -fsSL https://api.replynodes.com/v1/youtube/capabilities
```

Use a host-configured token only; the placeholder below is intentionally not a credential:

```bash
curl -fsSL \
  -H 'Authorization: Bearer <configured-token>' \
  'https://api.replynodes.com/v1/youtube/search?term=robotics&limit=10'
```

Python example:

```python
import os
import requests

base = "https://api.replynodes.com"
token = os.environ["REPLYNODES_BEARER_TOKEN"]
response = requests.get(
    f"{base}/v1/youtube/video/VIDEO_ID",
    headers={"Authorization": f"Bearer {token}"},
    timeout=30,
)
if response.status_code == 402:
    raise RuntimeError("Payment required: follow the host x402 v2 flow")
response.raise_for_status()
envelope = response.json()
if not isinstance(envelope, dict) or "data" not in envelope:
    raise ValueError("unexpected response envelope")
print(envelope)
```

The service may return null, empty, partial, or unavailable fields. Preserve those states and the returned metadata. A successful response is not proof that content is live or complete.
