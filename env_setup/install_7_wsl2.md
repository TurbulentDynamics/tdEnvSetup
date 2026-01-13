# Installing and Configuring WSL2 for ML Development

Windows Subsystem for Linux 2 (WSL2) provides a full Linux kernel on Windows, making it an excellent platform for ML development and HPC work on Windows machines.

## Prerequisites

- Windows 10 version 2004 or higher (Build 19041 or higher) or Windows 11
- Administrator access to your Windows machine

## Install WSL2

### Option 1: Simple Install (Windows 11 or Windows 10 version 2004+)

Open PowerShell or Windows Command Prompt as Administrator and run:

```powershell
wsl --install
```

This will:
- Enable WSL and Virtual Machine Platform features
- Download and install the latest Linux kernel
- Set WSL2 as the default version
- Install Ubuntu (default distribution)

Restart your computer when prompted.

### Option 2: Manual Install

If the simple install doesn't work, follow these steps:

1. Enable WSL:
```powershell
dism.exe /online /enable-feature /featurename:Microsoft-Windows-Subsystem-Linux /all /norestart
```

2. Enable Virtual Machine Platform:
```powershell
dism.exe /online /enable-feature /featurename:VirtualMachinePlatform /all /norestart
```

3. Restart your computer

4. Download and install the WSL2 Linux kernel update package:
   - [WSL2 Linux kernel update package for x64 machines](https://wslstorestorage.blob.core.windows.net/wslblob/wsl_update_x64.msi)

5. Set WSL2 as default:
```powershell
wsl --set-default-version 2
```

6. Install Ubuntu 22.04 from Microsoft Store or via command line:
```powershell
wsl --install -d Ubuntu-22.04
```

## Install NVIDIA CUDA on WSL2

WSL2 supports NVIDIA GPUs through CUDA on WSL, enabling GPU acceleration for ML workloads.

### 1. Install NVIDIA GPU Driver on Windows

Download and install the latest NVIDIA GPU driver for Windows that supports WSL:
- [NVIDIA Drivers for CUDA on WSL](https://developer.nvidia.com/cuda/wsl)
- Minimum version: 510.06 or higher

**Important:** Only install the Windows driver. Do NOT install any Linux GPU driver inside WSL2.

### 2. Verify GPU Access in WSL2

Open your WSL2 Ubuntu terminal and run:
```bash
nvidia-smi
```

You should see your GPU information displayed.

### 3. Install CUDA Toolkit in WSL2

```bash
# Add NVIDIA package repository
wget https://developer.download.nvidia.com/compute/cuda/repos/wsl-ubuntu/x86_64/cuda-keyring_1.1-1_all.deb
sudo dpkg -i cuda-keyring_1.1-1_all.deb
sudo apt-get update

# Install CUDA Toolkit
sudo apt-get -y install cuda-toolkit-12-0

# Add CUDA to PATH
echo 'export PATH=/usr/local/cuda-12.0/bin${PATH:+:${PATH}}' >> ~/.bashrc
echo 'export LD_LIBRARY_PATH=/usr/local/cuda-12.0/lib64${LD_LIBRARY_PATH:+:${LD_LIBRARY_PATH}}' >> ~/.bashrc
source ~/.bashrc
```

### 4. Verify CUDA Installation

```bash
nvcc --version
```

## Install Docker Desktop with WSL2 Backend

Docker Desktop provides excellent integration with WSL2.

1. Download and install [Docker Desktop for Windows](https://www.docker.com/products/docker-desktop/)

2. During installation, ensure "Use WSL 2 instead of Hyper-V" is selected

3. After installation, go to Docker Desktop Settings:
   - Go to General → Enable "Use the WSL 2 based engine"
   - Go to Resources → WSL Integration → Enable integration with your Ubuntu distribution

4. Verify Docker works in WSL2:
```bash
docker run hello-world
```

## Install nvidia-docker for GPU Support

Since WSL2 integrates with Windows NVIDIA drivers, you can use Docker with GPU support:

```bash
# Install nvidia-docker2
distribution=$(. /etc/os-release;echo $ID$VERSION_ID)
curl -s -L https://nvidia.github.io/nvidia-docker/gpgkey | sudo apt-key add -
curl -s -L https://nvidia.github.io/nvidia-docker/$distribution/nvidia-docker.list | sudo tee /etc/apt/sources.list.d/nvidia-docker.list

sudo apt-get update
sudo apt-get install -y nvidia-docker2

# Restart Docker daemon
sudo systemctl restart docker

# Test GPU access in Docker
docker run --rm --gpus all nvidia/cuda:11.8.0-base-ubuntu22.04 nvidia-smi
```

## Configure WSL2 Resource Limits

By default, WSL2 can use up to 50% of total memory and all CPU cores. To customize:

Create `%UserProfile%\.wslconfig` on Windows (e.g., `C:\Users\YourName\.wslconfig`):

```ini
[wsl2]
# Limit memory to 16GB
memory=16GB

# Limit processors to 8 cores
processors=8

# Swap size (default is 25% of memory)
swap=8GB

# Disable page reporting (can improve performance)
pageReporting=false

# Enable nested virtualization
nestedVirtualization=true
```

After creating/editing this file, restart WSL:
```powershell
wsl --shutdown
```

## Development Environment Setup

Once WSL2 is configured, follow the standard Turbulent Dynamics setup guides:

1. [Install basics and brew](install_0_basics_and_brew.md)
2. [Install spack](install_1_with_spack.md)
3. [Install Python ML packages](install_2_python_modules.md) or use the automated script:
   ```bash
   ./scripts/install_python_ml.sh
   ```

## Tips and Best Practices

### File System Performance
- Store your projects in the Linux file system (`/home/username/`), not Windows mounted drives (`/mnt/c/`)
- Linux file system operations are significantly faster than accessing Windows drives

### VS Code Integration
- Install the "Remote - WSL" extension in VS Code
- Open WSL terminal and run: `code .` to open VS Code in WSL context

### Accessing Windows Files
- Windows drives are mounted at `/mnt/c/`, `/mnt/d/`, etc.
- You can access Linux files from Windows at `\\wsl$\Ubuntu-22.04\home\username\`

### Memory Management
- WSL2 memory is dynamically allocated but may not release back to Windows
- To reclaim memory: `wsl --shutdown` in PowerShell

### Systemd Support (Ubuntu 22.04+)
```bash
# Enable systemd in WSL2
echo -e "[boot]\nsystemd=true" | sudo tee /etc/wsl.conf
```
Restart WSL for this to take effect.

## Troubleshooting

### GPU Not Detected
1. Ensure Windows NVIDIA driver version is 510.06 or higher
2. Verify GPU works in Windows first
3. Do NOT install any Linux GPU drivers in WSL2
4. Try: `wsl --shutdown` and restart

### Docker Issues
1. Ensure Docker Desktop is running
2. Check WSL integration is enabled for your distribution
3. Restart Docker Desktop

### Slow File Performance
1. Ensure you're working in `/home/` not `/mnt/c/`
2. Consider disabling Windows Defender real-time scanning for WSL directories

## References

- [Official WSL Documentation](https://docs.microsoft.com/en-us/windows/wsl/)
- [CUDA on WSL User Guide](https://docs.nvidia.com/cuda/wsl-user-guide/index.html)
- [Docker Desktop WSL 2 Backend](https://docs.docker.com/desktop/windows/wsl/)
