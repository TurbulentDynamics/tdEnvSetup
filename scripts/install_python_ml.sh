#!/bin/bash
set -euo pipefail

# Automated installation script for Python ML packages
# Focus on PyTorch ecosystem

echo "=== Installing Python ML Environment with PyTorch ==="

# Create virtual environment
VENV_PATH="${HOME}/mlenv"
read -p "Create Python virtual environment at ${VENV_PATH}? (y/n) " -n 1 -r
echo
if [[ $REPLY =~ ^[Yy]$ ]]; then
    echo "Creating virtual environment..."
    python3 -m venv "${VENV_PATH}"
    source "${VENV_PATH}/bin/activate"
    echo "Virtual environment created and activated"
else
    echo "Skipping virtual environment creation"
fi

# Detect if CUDA is available
if command -v nvidia-smi &> /dev/null; then
    echo "NVIDIA GPU detected"
    CUDA_AVAILABLE=true
else
    echo "No NVIDIA GPU detected, will install CPU-only version"
    CUDA_AVAILABLE=false
fi

# Upgrade pip
echo "Upgrading pip..."
pip install --upgrade pip setuptools wheel

# Install PyTorch (latest as of January 2025)
echo "Installing PyTorch 2.5.1 and related packages..."
if [ "$CUDA_AVAILABLE" = true ]; then
    # Install CUDA-enabled PyTorch (CUDA 12.1+)
    pip install torch==2.5.1 torchvision==0.20.1 torchaudio==2.5.1 torchtext==0.18.0 --index-url https://download.pytorch.org/whl/cu121
else
    # Install CPU-only PyTorch
    pip install torch==2.5.1 torchvision==0.20.1 torchaudio==2.5.1 torchtext==0.18.0 --index-url https://download.pytorch.org/whl/cpu
fi

# Install core scientific computing packages (latest versions)
echo "Installing scientific computing packages..."
pip install \
    numpy==2.1.3 \
    pandas==2.2.3 \
    matplotlib==3.9.2 \
    scikit-learn==1.5.2 \
    scipy==1.14.1 \
    h5py==3.12.1 \
    pillow==11.0.0 \
    jupyterlab==4.3.3 \
    ipython==8.30.0 \
    seaborn==0.13.2

# Install ML/DL tools (latest versions)
echo "Installing ML/DL tools..."
pip install \
    tensorboard==2.18.0 \
    mlflow==2.17.2 \
    optuna==4.1.0 \
    transformers==4.47.1 \
    timm==1.0.12 \
    einops==0.8.0 \
    lightning==2.4.0 \
    accelerate==1.2.1 \
    datasets==3.2.0 \
    tokenizers==0.21.0 \
    sentencepiece==0.2.0 \
    wandb==0.18.7

echo "=== Python ML environment installation complete! ==="
echo ""
echo "To activate the virtual environment in the future, run:"
echo "  source ${VENV_PATH}/bin/activate"
echo ""
echo "Installed packages:"
pip list | grep -E 'torch|numpy|pandas|scikit|jupyter'
