# clean base image containing only comfyui, comfy-cli and comfyui-manager
FROM runpod/worker-comfyui:5.5.1-base

# install custom nodes into comfyui (first node with --mode remote to fetch updated cache)
# The workflow contains only unknown_registry custom nodes and none include an aux_id (GitHub repo).
# Because these nodes are not registry-verified and have no aux_id, they cannot be automatically installed.
# Skipping automatic installation for the following custom nodes (no aux_id provided):
# - UpscaleModelLoader
# - EmptyLatentImage
# - Reroute
# - Reroute
# - Reroute
# - Reroute
# - VAEDecode
# - PreviewImage
# - SaveImage
# - Reroute
# - Reroute
# - CLIPTextEncodeSDXL
# - DF_Text_Box
# - CheckpointLoaderSimple
# - CLIPTextEncodeSDXL
# - easy loraStackApply
# - UltimateSDUpscale
# - KSampler
# - LoRA Stacker
# - DF_Text_Box

# download models into comfyui
RUN comfy model download --url https://huggingface.co/Kim2091/UltraSharp/resolve/main/4x-UltraSharp.pth --relative-path models/upscale_models --filename 4x-UltraSharp.pth
RUN comfy model download --url https://huggingface.co/Hishambarakat/checkpoint/blob/090ddf43aaa8decefaa77233ec64148c47cfe1fb/pony/ponyRealism_V22MainVAE.safetensors --relative-path models/vae --filename ponyRealism_V22MainVAE.safetensors
# RUN # Could not find URL for SDXL_lora/pony-realism-22-photo-lora_mk3/pony-realism-22-nsfw-photo.safetensors

# copy all input data (like images or videos) into comfyui (uncomment and adjust if needed)
# COPY input/ /comfyui/input/
