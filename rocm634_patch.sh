#!/bin/sh
patch -p1 <<'EOF'
--- pyproject.toml	2025-03-27 17:28:59.078796195 +0530
+++ pyproject.toml_rocm634	2025-03-27 17:28:45.361889786 +0530
@@ -12,29 +12,26 @@
     #Validation
     "pydantic==2.10.6",
     "lazy-loader==0.4.0",
-
     # CLI
     "typer==0.15.2",
-    
     # Networking
     "requests==2.32.3",
     "yt_dlp>=2025.1.26",
     "nodejs-wheel-binaries==22.14.0",
     "wget==3.2",
-
     # Data science
     "numpy==1.26.4",
     "scipy==1.15.2",
     "matplotlib==3.10.1",
     "tqdm==4.67.1",
     "gradio==5.22.0",
-    
     # Machine learning
-    "torch==2.6.0+cu124",
-    "torchaudio==2.6.0+cu124",
+    "torch @ https://repo.radeon.com/rocm/manylinux/rocm-rel-6.3.4/torch-2.4.0%2Brocm6.3.4.git7cecbf6d-cp312-cp312-linux_x86_64.whl",
+    "torchaudio @ https://repo.radeon.com/rocm/manylinux/rocm-rel-6.3.4/torchaudio-2.4.0%2Brocm6.3.4.git69d40773-cp312-cp312-linux_x86_64.whl",
+    "pytorch-triton-rocm @ https://repo.radeon.com/rocm/manylinux/rocm-rel-6.3.4/pytorch_triton_rocm-3.0.0%2Brocm6.3.4.git75cc27c2-cp312-cp312-linux_x86_64.whl",
     "torchcrepe==0.0.23",
     "faiss-cpu==1.10.0",
-    # Version of onnxruntime-gpu needs to align with what 
+    # Version of onnxruntime-gpu needs to align with what
     # version audio-separator package uses.
     "onnxruntime-gpu==1.20.1",
     "local-attention==1.11.1",
@@ -43,7 +40,6 @@
     "tensorboardX==2.6.2.2",
     "tensorboard==2.19.0",
     "torch-tb-profiler==0.4.3",
-    
     # Audio
     "static-ffmpeg==2.8",
     "static-sox==1.0.1",
@@ -61,7 +57,7 @@
     # TODO potentially add these later
     # below package outcommented until we use dio,pm and harvest
     #"pyworld-fixed==0.3.8",
-    # below package outcommented until we use praat 
+    # below package outcommented until we use praat
     # (for example for formant shifting with "change gender command")
     #"praat-parselmouth==0.4.5",
 ]
@@ -71,18 +67,10 @@
 urvc-web = "ultimate_rvc.web.main:app_wrapper"
 
 [tool.uv]
-#environments = ["sys_platform == 'win32'", "sys_platform == 'linux'"]
+environments = ["sys_platform == 'linux'"]
 cache-dir = "./uv/cache"
 compile-bytecode = true
 
-[tool.uv.sources]
-torch = { index = "torch-cu124"}
-torchaudio = { index = "torch-cu124"}
-[[tool.uv.index]]
-name = "torch-cu124"
-url = "https://download.pytorch.org/whl/cu124"
-explicit = true
-
 [tool.pyright]
 stubPath = "src/ultimate_rvc/stubs"
 pythonVersion = "3.12"
EOF

