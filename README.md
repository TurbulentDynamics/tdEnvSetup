# Turbulent Dynamics Environment Setup

[![License: GPL v3](https://img.shields.io/badge/License-GPLv3-blue.svg)](https://www.gnu.org/licenses/gpl-3.0)
[![Docker Build](https://github.com/TurbulentDynamics/tdEnvSetup/workflows/Docker%20Build%20and%20Validation/badge.svg)](https://github.com/TurbulentDynamics/tdEnvSetup/actions)
[![Ubuntu](https://img.shields.io/badge/Ubuntu-22.04-orange.svg)](https://ubuntu.com/)
[![Python](https://img.shields.io/badge/Python-3.10+-blue.svg)](https://www.python.org/)
[![PyTorch](https://img.shields.io/badge/PyTorch-2.5.1-red.svg)](https://pytorch.org/)
[![CUDA](https://img.shields.io/badge/CUDA-12.4-green.svg)](https://developer.nvidia.com/cuda-toolkit)
[![Swift](https://img.shields.io/badge/Swift-6.0.3-orange.svg)](https://swift.org/)

> **Comprehensive environment setup guide for Machine Learning, MPI, and HPC development across multiple platforms**

Turbulent Dynamics develops Machine Learning, MPI and iOS applications for High Performance Computing (Supercomputing), edge devices (Xavier, Raspberry PI, MyriadX), MacOS, and Windows (WSL2). This repository provides standardized setup procedures to minimize system administration workload across all platforms.

## 🚀 Quick Start

Choose your platform and follow the automated setup:

```bash
# Clone this repository
git clone https://github.com/TurbulentDynamics/tdEnvSetup.git
cd tdEnvSetup

# Run automated installation scripts
./scripts/install_basics.sh       # Install basic tools
./scripts/install_languages.sh    # Install Swift, Rust, Haskell (optional)
./scripts/install_python_ml.sh    # Install PyTorch ML environment
```

Or use Docker containers for quick setup:
```bash
docker pull turbulentdynamics/td_base_nvidia_ml
docker run --gpus all -it turbulentdynamics/td_base_nvidia_ml
```

## 📋 Table of Contents

1. [Environment Setup](#environment-setup)
2. [Platform Support](#platform-support)
3. [Installation Guides](#installation-guides)
4. [Docker Containers](#docker-containers)
5. [Automated Scripts](#automated-scripts)
6. [Diagnostics](#diagnostics)
7. [Coding Guidelines](#coding-guidelines)

---


## Environment Setup

### Philosophy

Our multi-platform approach addresses the challenges of maintaining consistent development environments across diverse hardware:

1. **Avoid sudo** - Use Brew/Linuxbrew for basic tools (user-level installs)
2. **Version flexibility** - Use Spack to manage multiple software versions (compiled for performance)
3. **Containerization** - Use Docker/Singularity where possible (limited on some edge devices)
4. **Python isolation** - Use virtual environments for ML packages (PyTorch ecosystem)

### Why This Matters

Different platforms require different approaches:
- **HPC systems**: No sudo access, need Spack for version management
- **Workstations**: Full control, can use Docker with GPU support
- **Edge devices**: Limited resources, specific SDK constraints
- **MacOS**: Different package managers, Metal for visualization

## Platform Support

| Platform | Primary Use Case | ML Framework | Notes |
|----------|-----------------|--------------|-------|
| **HPC Clusters** | Large-scale ML training, MPI apps (100+ nodes) | PyTorch | No sudo access, use Spack |
| **Workstations (NVIDIA GPU)** | ML training, development, testing | PyTorch (CUDA) | Full Docker support |
| **Workstations (AMD GPU)** | ML training | PyTorch (ROCm) | ROCm support available |
| **Windows (WSL2)** | Development, ML training | PyTorch (CUDA) | Native GPU support via WSL2 |
| **MacOS (Apple Silicon)** | iOS development, Metal visualizations | PyTorch (MPS) | Swift development |
| **NVIDIA Xavier/Nano** | Edge ML inference | PyTorch/ONNX | Jetpack SDK constraints |
| **Intel MyriadX** | Edge ML inference | OpenVINO | OpenVINO 2023+ |
| **Raspberry Pi** | IoT ML inference | PyTorch Lite | CPU-only |



## Installation Guides

### Core Setup (All Platforms)

| Guide | Description | Platforms |
|-------|-------------|-----------|
| [**0. Basics & Brew**](env_setup/install_0_basics_and_brew.md) | Install essential tools, Swift, Rust, Haskell | Linux, MacOS |
| [**1. Spack Setup**](env_setup/install_1_with_spack.md) | Multi-version package manager for HPC | Linux, MacOS |
| [**2. Python Modules**](env_setup/install_2_python_modules.md) | Python virtual environments and packages | All |

### Platform-Specific Setup

| Guide | Description | Platform |
|-------|-------------|----------|
| [**3. NVIDIA CUDA (Ubuntu 22.04)**](env_setup/install_3_nvidia_for_Ubuntu_22_04.md) | CUDA 12.0+ setup | Ubuntu 22.04 |
| [**3. NVIDIA Jetson**](env_setup/install_3_nvidia_for_Jetson_L4T_20_04.md) | Jetpack SDK for Xavier/Nano | Jetson L4T |
| [**3. OpenVINO (Legacy)**](env_setup/install_3_OpenVINO_on_Ubuntu_16_04.md) | Intel OpenVINO toolkit | Ubuntu 16.04 (legacy) |

### Container Setup

| Guide | Description | Use Case |
|-------|-------------|----------|
| [**4. Docker & nvidia-docker2**](env_setup/install_4_nvidia_docker2_base_ml_container.md) | GPU-accelerated containers | Workstations |
| [**5. Singularity**](env_setup/install_5_singularity.md) | HPC-friendly containers | HPC clusters |

### Additional Resources

| Resource | Description |
|----------|-------------|
| [**6. Optional Apps**](env_setup/install_6_optional_apps.md) | Additional development tools |
| [**7. WSL2 Setup**](env_setup/install_7_wsl2.md) | Windows Subsystem for Linux 2 with GPU |
| [**Test Rust MPI**](env_setup/install_test_rust_mpi.md) | Validate MPI with Rust |

## Docker Containers

Pre-built containers available on Docker Hub (Updated January 2025):

```bash
# Base container (Ubuntu 22.04 + CUDA 12.4.1 + cuDNN 9)
docker pull turbulentdynamics/td_base

# ML container (PyTorch 2.5.1 + latest ML ecosystem)
docker pull turbulentdynamics/td_base_nvidia_ml

# HPC container (Spack + GCC 14.2 + OpenMPI 5.0 + CMake 3.31)
docker pull turbulentdynamics/td_base_hpc

# Run with GPU support
docker run --gpus all -it turbulentdynamics/td_base_nvidia_ml
```

### Available Dockerfiles

- `Dockerfile.td_base` - Base CUDA 12.4 environment
- `Dockerfile.td_base_nvidia_ml` - PyTorch 2.5.1 ML environment (includes transformers, timm, lightning)
- `Dockerfile.td_base_hpc` - HPC tools with latest compilers and MPI
- `Dockerfile.td_base_myriadx` - Intel OpenVINO 2024.6 for MyriadX

## Automated Scripts

New automated installation scripts for faster setup (Updated January 2025):

```bash
./scripts/install_basics.sh       # Basic tools (git, curl, vim, etc.)
./scripts/install_languages.sh    # Swift 6.0.3, Rust (latest), Haskell (latest)
./scripts/install_python_ml.sh    # PyTorch 2.5.1 ML environment with full ecosystem
```

All scripts support interactive prompts and error handling.

## Diagnostics

### Cluster Diagnostics Tool

Simple utility to verify OpenMP, MPI, and CUDA are working correctly:

- [Diagnostics: OpenMP, MPI, GPU](diagnostics_hello_world_mpi_openmp_gpu/README.md)

Use this to validate your environment setup across cluster nodes.

## Coding Guidelines

Development standards and visualizations for Turbulent Dynamics projects:

- [**Coding Guidelines**](dev_info/index.md) - Coordinate systems, variable naming
- [**Vector Identifiers**](https://turbulentdynamics.github.io/tdEnvSetup/graphics/arrows.html) - Custom LBM vector numbering
- [**Cell Identifiers**](https://turbulentdynamics.github.io/tdEnvSetup/graphics/cube.html) - Lattice grid identification scheme
- [**Visualization Demo**](https://turbulentdynamics.github.io/tdEnvSetup/graphics/1000.html) - Interactive 1000 cube visualization

## Contributing

Contributions are welcome! Please:

1. Test your changes on the target platform
2. Update documentation to reflect changes
3. Ensure Docker builds pass CI checks
4. Follow existing code style

## License

This project is licensed under the GNU General Public License v3.0 - see the [LICENSE](LICENSE) file for details.

## Support

- **Issues**: [GitHub Issues](https://github.com/TurbulentDynamics/tdEnvSetup/issues)
- **Documentation**: See individual guide files in `env_setup/`
- **CI Status**: Check GitHub Actions for build status


