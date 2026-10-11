---
name: gemini-image
description: Generate or edit images with gemini-3.1-flash-image through the internal Unity LiteLLM server. Use when asked to create an image, edit an existing image, or compose a new image from reference images.
---

# Gemini image generation / editing

Uses `gemini-3.1-flash-image` via `https://uai-litellm.internal.unity.com/v1/chat/completions`.
The API key is read from the macOS Keychain (`litellm-auth-token`, same as the Codex config).

## Usage

```bash
python3 -I .claude/skills/gemini-image/scripts/gemini_image.py -o OUT.png "PROMPT" [INPUT_IMAGE ...]
```

- **Generate**: prompt only.
- **Edit**: pass one input image and describe the change. Say "keep everything else the same" to preserve the rest.
- **Reference images**: pass multiple images and refer to them as "the first image", "the second image", etc.
- Aspect ratio / size cannot be set by parameter; describe it in the prompt (e.g. "wide 16:9 composition").
- `-m` switches the model (e.g. `gemini-3-pro-image` for higher quality).

After generating, view the output with the Read tool to check the result.

## Notes

- `gpt-image-2` edits do not work on this server (Azure api-version / `drop_params` issue), so use this skill for editing.
