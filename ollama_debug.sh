#!/bin/sh

# known issues:
# https://github.com/ollama/ollama/issues/4126

export OLLAMA_DEBUG=true

# maybe set at 1/1 to start
export OLLAMA_NUM_PARALLEL=4
export OLLAMA_MAX_LOADED_MODELS=4

# just force it to be safe?
export CUDA_USE_TENSOR_CORES=true

# tested this per some recommended troubleshooting - don't believe it's necessary
# 43GB - https://www.gbmb.org/gigabytes
# export OLLAMA_MAX_VRAM=50465865728

# can't hurt? Ollama still only using 1 of my GPUs so far
# if you only have 1 GPU either omit or set to `0`
export CUDA_VISIBLE_DEVICES=0,1

# I've tested w/ both GPU and CPU; for e.g. command-r, CPU works; GPU seems to hang
# https://github.com/ollama/ollama/blob/main/docs/troubleshooting.md
export OLLAMA_LLM_LIBRARY=cuda_v11
# CPU - for command-r / large models
# export OLLAMA_LLM_LIBRARY=cpu_avx2

# ?? Not 100% sure what this is yet; have only tested it troubleshooting GPU issues
// define this if you want to always fallback to MMQ kernels and not use cuBLAS for matrix multiplication
// on modern hardware, using cuBLAS is recommended as it utilizes F16 tensor cores which are very performant
// for large computational tasks. the drawback is that this requires some extra amount of VRAM:
// -  7B quantum model: +100-200 MB
// - 13B quantum model: +200-400 MB
export GGML_CUDA_FORCE_MMQ=false

/usr/local/bin/ollama serve
