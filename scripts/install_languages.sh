#!/bin/bash
set -euo pipefail

# Automated installation script for programming languages
# Based on env_setup/install_0_basics_and_brew.md

echo "=== Installing Programming Languages ==="

# Install Swift
read -p "Do you want to install Swift? (y/n) " -n 1 -r
echo
if [[ $REPLY =~ ^[Yy]$ ]]; then
    echo "Installing Swift 6.0.3..."
    sudo apt-get install -y libc6-dev libcurl4-openssl-dev libedit2 libgcc-11-dev \
        libpython3.10 libsqlite3-0 libstdc++-11-dev libxml2-dev libz3-dev pkg-config zlib1g-dev

    SWIFT_VERSION="6.0.3"
    SWIFT_PLATFORM="ubuntu22.04"
    SWIFT_BRANCH="swift-${SWIFT_VERSION}-release"
    SWIFT_PACKAGE="swift-${SWIFT_VERSION}-RELEASE-${SWIFT_PLATFORM}"

    wget "https://download.swift.org/${SWIFT_BRANCH}/${SWIFT_PLATFORM}/${SWIFT_PACKAGE}/${SWIFT_PACKAGE}.tar.gz"
    tar xzf "${SWIFT_PACKAGE}.tar.gz"

    # Add to PATH for fish shell if using
    if command -v fish &> /dev/null; then
        echo "fish_add_path $(pwd)/${SWIFT_PACKAGE}/usr/bin" >> ~/.config/fish/config.fish
        echo "Added Swift to fish PATH"
    fi

    # Add to PATH for bash/zsh
    echo "export PATH=\"$(pwd)/${SWIFT_PACKAGE}/usr/bin:\$PATH\"" >> ~/.bashrc
    echo "Added Swift to bash PATH"

    echo "Swift ${SWIFT_VERSION} installed successfully!"
fi

# Install Rust
read -p "Do you want to install Rust? (y/n) " -n 1 -r
echo
if [[ $REPLY =~ ^[Yy]$ ]]; then
    echo "Installing Rust..."
    curl --proto '=https' --tlsv1.2 -sSf https://sh.rustup.rs | sh -s -- -y
    source "$HOME/.cargo/env"
    echo "Rust installed successfully!"
    rustc --version
fi

# Install Haskell
read -p "Do you want to install Haskell? (y/n) " -n 1 -r
echo
if [[ $REPLY =~ ^[Yy]$ ]]; then
    echo "Installing Haskell via GHCup..."
    curl --proto '=https' --tlsv1.2 -sSf https://get-ghcup.haskell.org | sh
    echo "Haskell installed successfully!"
fi

echo "=== Programming languages installation complete! ==="
