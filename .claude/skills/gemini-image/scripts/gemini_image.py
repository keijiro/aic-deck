#!/usr/bin/env python3
"""Generate or edit images with gemini-3.1-flash-image via the Unity LiteLLM server.

Usage: gemini_image.py -o OUT.png "PROMPT" [INPUT_IMAGE ...]
"""
import argparse, base64, json, mimetypes, subprocess, sys, urllib.request, urllib.error

ENDPOINT = "https://uai-litellm.internal.unity.com/v1/chat/completions"

ap = argparse.ArgumentParser()
ap.add_argument("-o", "--output", required=True)
ap.add_argument("-m", "--model", default="gemini-3.1-flash-image")
ap.add_argument("prompt")
ap.add_argument("images", nargs="*")
args = ap.parse_args()

key = subprocess.check_output(
    ["security", "find-generic-password", "-s", "litellm-auth-token", "-w"]).decode().strip()

content = [{"type": "text", "text": args.prompt}]
for path in args.images:
    mime = mimetypes.guess_type(path)[0] or "image/png"
    data = base64.b64encode(open(path, "rb").read()).decode()
    content.append({"type": "image_url", "image_url": {"url": f"data:{mime};base64,{data}"}})

body = {"model": args.model, "messages": [{"role": "user", "content": content}]}
req = urllib.request.Request(ENDPOINT, data=json.dumps(body).encode(),
    headers={"Authorization": f"Bearer {key}", "Content-Type": "application/json"})
try:
    res = json.load(urllib.request.urlopen(req, timeout=600))
except urllib.error.HTTPError as e:
    sys.exit(f"HTTP {e.code}: {e.read().decode()[:1000]}")

msg = res["choices"][0]["message"]
images = msg.get("images") or []
if not images:
    sys.exit(f"No image returned. Text response: {msg.get('content')}")
url = images[0]["image_url"]["url"]
open(args.output, "wb").write(base64.b64decode(url.split(",", 1)[1]))
print(args.output)
if msg.get("content"):
    print(msg["content"])
