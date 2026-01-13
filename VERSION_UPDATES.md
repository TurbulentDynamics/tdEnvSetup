# Version Updates - January 2025

This document details all package and tool version updates made to bring tdEnvSetup to the latest stable releases.

## Summary

All dependencies have been updated to their latest stable versions as of January 13, 2025. This includes major version bumps for PyTorch, CUDA, Swift, compilers, and ML frameworks.

---

## Core Infrastructure

### CUDA Toolkit
- **Before**: CUDA 11.8.0 with cuDNN 8
- **After**: CUDA 12.4.1 with cuDNN 9
- **Impact**: Better GPU performance, support for latest NVIDIA hardware
- **File**: `Dockerfile.td_base`

### Ubuntu Base
- **Version**: Ubuntu 22.04 LTS (no change, already modern)
- **Python**: 3.10+ (system default)
- **Note**: All deprecated Ubuntu 16.04 references updated to 22.04

---

## Machine Learning Stack

### PyTorch Ecosystem

| Package | Old Version | New Version | Notes |
|---------|-------------|-------------|-------|
| **torch** | 2.2.0 | **2.5.1** | Major update, better performance |
| **torchvision** | 0.17.0 | **0.20.1** | Updated vision models |
| **torchaudio** | 2.2.0 | **2.5.1** | Audio processing updates |
| **torchtext** | 0.17.0 | **0.18.0** | NLP improvements |

### Scientific Computing

| Package | Old Version | New Version | Notes |
|---------|-------------|-------------|-------|
| **numpy** | 1.26.3 | **2.1.3** | Major version bump to 2.x |
| **pandas** | 2.2.0 | **2.2.3** | Stability updates |
| **matplotlib** | 3.8.2 | **3.9.2** | Minor version bump |
| **scikit-learn** | 1.4.0 | **1.5.2** | Minor version bump |
| **scipy** | 1.12.0 | **1.14.1** | Minor version bump |
| **h5py** | 3.10.0 | **3.12.1** | HDF5 file handling |
| **pillow** | 10.2.0 | **11.0.0** | Major version bump |
| **jupyterlab** | 4.1.0 | **4.3.3** | Notebook interface |
| **ipython** | 8.20.0 | **8.30.0** | Interactive shell |
| **seaborn** | 0.13.1 | **0.13.2** | Visualization |

### ML/DL Frameworks & Tools

| Package | Old Version | New Version | Notes |
|---------|-------------|-------------|-------|
| **transformers** | 4.37.2 | **4.47.1** | Hugging Face models |
| **timm** | 0.9.12 | **1.0.12** | PyTorch Image Models (1.0!) |
| **lightning** | 2.2.0 | **2.4.0** | PyTorch Lightning |
| **tensorboard** | 2.16.2 | **2.18.0** | Visualization |
| **mlflow** | 2.10.0 | **2.17.2** | Experiment tracking |
| **optuna** | 3.5.0 | **4.1.0** | Hyperparameter tuning |
| **accelerate** | 0.26.1 | **1.2.1** | Distributed training |
| **datasets** | 2.16.1 | **3.2.0** | HuggingFace datasets |
| **einops** | 0.7.0 | **0.8.0** | Tensor operations |
| **tokenizers** | - | **0.21.0** | *NEW* - Fast tokenizers |
| **sentencepiece** | - | **0.2.0** | *NEW* - Tokenization |
| **wandb** | - | **0.18.7** | *NEW* - Weights & Biases |

**Key Changes**:
- Removed TensorFlow entirely (was at 2.0.0 from 2019)
- Added modern tokenization libraries
- Added Weights & Biases for experiment tracking
- Timm reached 1.0 stable release

---

## Programming Languages

### Swift
- **Before**: Swift 5.9.2 (2024)
- **After**: Swift 6.0.3 (January 2025)
- **Impact**: Major language version update, new concurrency features
- **Files**:
  - `env_setup/install_0_basics_and_brew.md`
  - `scripts/install_languages.sh`

### Rust
- **Method**: rustup (always latest stable)
- **Current**: Rust 1.84.0 (via Spack in HPC container)
- **Note**: User installations via rustup get latest automatically

### Haskell
- **Method**: GHCup (always latest stable)
- **Note**: Always installs latest GHC via GHCup

---

## HPC Tools (via Spack)

### Compilers

| Tool | Old Version | New Version | Notes |
|------|-------------|-------------|-------|
| **GCC** | 11.2.0 | **14.2.0** | Major compiler update |
| **CMake** | 3.21.4 | **3.31.2** | Build system updates |

### MPI Implementations

| Tool | Old Version | New Version | Notes |
|------|-------------|-------------|-------|
| **OpenMPI** | 4.1.1 | **5.0.6** | Major version bump |
| **MPICH** | 4.0.2 | **4.2.3** | Minor updates |

### Other HPC Tools
- **Rust** (Spack): 1.58.1 → **1.84.0**
- **LIKWID**: Latest via Spack
- **htop**: Latest via Spack

**File**: `Dockerfile.td_base_hpc`

---

## Edge Computing

### Intel OpenVINO
- **Before**: OpenVINO 2023.0.0
- **After**: OpenVINO 2024.6.0 LTS
- **Impact**: Better performance, support for latest Intel hardware
- **File**: `Dockerfile.td_base_myriadx`

---

## CI/CD Pipeline

### GitHub Actions

| Action | Old Version | New Version | Notes |
|--------|-------------|-------------|-------|
| **actions/checkout** | v4 | v4 | Already latest |
| **docker/setup-buildx-action** | v3 | v3 | Already latest |
| **docker/build-push-action** | v5 | **v6** | Latest Docker buildx |
| **ludeeus/action-shellcheck** | master | **v2** | Specific version tag |
| **markdown-lint** | nosborn v3.3.0 | **DavidAnson v18** | Better linter |

**File**: `.github/workflows/docker-build.yml`

---

## Installation Scripts

All three automated installation scripts updated:

### scripts/install_basics.sh
- No version-specific changes (installs latest via apt)
- Interactive prompts for user choices

### scripts/install_languages.sh
- **Swift**: 5.9.2 → 6.0.3
- **Rust/Haskell**: Always latest via rustup/ghcup

### scripts/install_python_ml.sh
- **PyTorch**: 2.2.0 → 2.5.1
- **All packages**: Updated to versions listed above
- **CUDA index**: cu118 → cu121

---

## Documentation Updates

### README.md
- Added version badges for PyTorch, CUDA, Swift
- Updated all version references in text
- Updated Docker container descriptions
- Added "Updated January 2025" timestamps

### Platform Support Table
- Updated ML Framework references (TensorFlow → PyTorch everywhere)
- Added ROCm support for AMD GPUs
- Clarified OpenVINO version requirements

---

## Breaking Changes

### NumPy 2.x
NumPy updated from 1.x to 2.x. This is generally backward compatible, but:
- Some deprecated APIs removed
- Minor behavioral changes in edge cases
- Most ML libraries already compatible

### PyTorch 2.5.x
- New features in torch.compile
- Better dtype handling
- Some deprecated APIs removed from 2.0-2.2

### Swift 6.0
- New concurrency model (async/await refinements)
- Strict concurrency checking by default
- Some Swift 5.x code may need updates

---

## Compatibility Matrix

| Base Image | CUDA | PyTorch | Compatible With |
|------------|------|---------|-----------------|
| td_base | 12.4.1 | - | All NVIDIA GPUs (Compute 5.0+) |
| td_base_nvidia_ml | 12.4.1 | 2.5.1 | NVIDIA GPUs, CUDA 12.1+ drivers |
| td_base_hpc | 12.4.1 | - | HPC clusters, CPU-only workloads |
| td_base_myriadx | - | - | Intel MyriadX, OpenVINO 2024.6+ |

### CUDA Compute Capability Support
CUDA 12.4 supports:
- **Minimum**: Compute Capability 5.0 (Maxwell architecture, 2014)
- **Recommended**: Compute Capability 7.0+ (Volta, 2017)
- **Latest**: Compute Capability 9.0 (Hopper H100, 2022)

### Driver Requirements
- **NVIDIA Driver**: ≥525.60.13 (Linux) or ≥527.41 (Windows)
- **WSL2**: NVIDIA Driver ≥510.06 on Windows host

---

## Migration Guide

### From Previous tdEnvSetup Versions

#### If using TensorFlow
TensorFlow has been completely removed. Options:
1. **Recommended**: Migrate to PyTorch 2.5.1
2. **Alternative**: Install TensorFlow manually: `pip install tensorflow`
3. **Legacy**: Use old Docker images (not recommended)

#### If using older PyTorch
PyTorch 2.2 → 2.5.1 is generally backward compatible:
- Update requirements: `pip install --upgrade torch==2.5.1`
- Test model loading/saving (checkpoint compatibility)
- Check custom CUDA kernels if any

#### If using NumPy 1.x
NumPy 2.x changes:
- Most code works unchanged
- Some deprecated functions removed (e.g., `np.asscalar`)
- Check warnings: `python -W default your_script.py`

#### If using Swift 5.x
Swift 6.0 changes:
- Enable backward compatibility mode if needed
- Update async/await code for strict concurrency
- Check package dependencies

---

## Testing Recommendations

Before deploying to production:

### Docker Images
```bash
# Test base image
docker build -f Dockerfile.td_base -t td_base:test .
docker run --gpus all td_base:test nvidia-smi

# Test ML image
docker build -f Dockerfile.td_base_nvidia_ml -t td_ml:test .
docker run --gpus all td_ml:test python -c "import torch; print(torch.__version__); print(torch.cuda.is_available())"

# Test HPC image
docker build -f Dockerfile.td_base_hpc -t td_hpc:test .
docker run td_hpc:test spack find
```

### Installation Scripts
```bash
# In a fresh Ubuntu 22.04 environment
./scripts/install_basics.sh
./scripts/install_languages.sh
./scripts/install_python_ml.sh

# Verify installations
python -c "import torch; print(torch.__version__)"
swift --version
rustc --version
```

### Model Compatibility
```python
import torch
import numpy as np
from transformers import AutoModel

# Test PyTorch
print(f"PyTorch: {torch.__version__}")
print(f"CUDA available: {torch.cuda.is_available()}")

# Test NumPy 2.x
print(f"NumPy: {np.__version__}")
arr = np.array([1, 2, 3])
print(f"NumPy test: {arr.sum()}")

# Test Transformers
model = AutoModel.from_pretrained("bert-base-uncased")
print(f"Transformers loaded successfully")
```

---

## Performance Improvements

### Expected Performance Gains

#### CUDA 12.4 vs 11.8
- ~5-10% faster kernel launches
- Better memory management
- Support for newer GPU architectures

#### PyTorch 2.5 vs 2.2
- ~10-15% faster training with torch.compile
- Better memory efficiency
- Faster dataloader operations

#### GCC 14 vs 11
- ~5-10% faster compiled code
- Better optimization flags
- Improved vectorization

#### OpenMPI 5.0 vs 4.1
- Lower latency collective operations
- Better RDMA support
- Improved multi-threaded performance

---

## Rollback Procedure

If issues occur, rollback options:

### Docker Images
```bash
# Use specific old versions
docker pull turbulentdynamics/td_base:cuda11.8
docker pull turbulentdynamics/td_base_nvidia_ml:pytorch2.2
```

### Git
```bash
# Revert to previous commit
git log --oneline  # Find commit hash before updates
git checkout <commit-hash>
```

### Manual Downgrades
```bash
# Downgrade PyTorch
pip install torch==2.2.0 torchvision==0.17.0 --index-url https://download.pytorch.org/whl/cu118

# Downgrade NumPy
pip install numpy==1.26.3
```

---

## Known Issues

### NumPy 2.x
- Some older packages may have compatibility issues
- Solution: Pin to numpy<2 if needed: `pip install "numpy<2"`

### CUDA 12.4
- Requires recent NVIDIA drivers (≥525.60)
- Older GPUs (pre-Maxwell) not supported
- Solution: Use CUDA 11.8 images for older hardware

### Swift 6.0
- Strict concurrency checking may break existing code
- Solution: Use compatibility mode or update code

---

## Future Updates

### Planned for Next Release
- Ubuntu 24.04 LTS support (when more mature)
- ROCm containers for AMD GPUs
- Apple Silicon (M1/M2/M3) native Docker images
- Python 3.12 support

### Monitoring for Updates
- PyTorch: Watch for 2.6 release (expected Q2 2025)
- CUDA: CUDA 12.5+ when available
- Swift: Swift 6.1+ minor updates
- OpenVINO: 2024.7+ updates

---

## References

- [PyTorch 2.5 Release Notes](https://pytorch.org/blog/pytorch-2.5-release/)
- [CUDA 12.4 Documentation](https://docs.nvidia.com/cuda/cuda-toolkit-release-notes/)
- [Swift 6.0 Release Notes](https://www.swift.org/blog/announcing-swift-6/)
- [NumPy 2.0 Migration Guide](https://numpy.org/devdocs/numpy_2_0_migration_guide.html)
- [OpenVINO 2024.6 Release Notes](https://docs.openvino.ai/2024/about-openvino/release-notes-openvino.html)

---

**Document Version**: 1.0
**Last Updated**: January 13, 2025
**Maintainer**: Turbulent Dynamics Team
