#!/bin/bash
set -euo pipefail

# Automated installation script for basic tools
# Based on env_setup/install_0_basics_and_brew.md

echo "=== Installing Basic Tools for Ubuntu 22.04 ==="

# Install basic packages
echo "Installing basic packages..."
sudo apt update
sudo apt install -y git fish curl wget tree vim openssh-server python3-venv unzip
sudo apt install -y binutils build-essential ca-certificates gnupg gnupg2 lsb-release tzdata

echo "Basic packages installed successfully!"

# Optionally install fish shell
read -p "Do you want to switch to fish shell? (y/n) " -n 1 -r
echo
if [[ $REPLY =~ ^[Yy]$ ]]; then
    sudo apt install -y fish
    echo "To change your default shell to fish, run:"
    echo "  sudo chsh -s /bin/fish $USER"
    echo "Then log out and log back in."
fi

# Install Bazel
read -p "Do you want to install Bazel? (y/n) " -n 1 -r
echo
if [[ $REPLY =~ ^[Yy]$ ]]; then
    echo "Installing Bazel..."
    sudo apt install apt-transport-https curl gnupg -y
    curl -fsSL https://bazel.build/bazel-release.pub.gpg | gpg --dearmor >bazel-archive-keyring.gpg
    sudo mv bazel-archive-keyring.gpg /usr/share/keyrings
    echo "deb [arch=amd64 signed-by=/usr/share/keyrings/bazel-archive-keyring.gpg] https://storage.googleapis.com/bazel-apt stable jdk1.8" | sudo tee /etc/apt/sources.list.d/bazel.list
    sudo apt update
    sudo apt install -y bazel
    echo "Bazel installed successfully!"
fi

echo "=== Basic tools installation complete! ==="
