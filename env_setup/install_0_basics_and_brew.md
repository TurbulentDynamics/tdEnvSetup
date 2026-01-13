# Ubuntu 22 Basics
```
sudo apt install -y git fish curl wget tree vim openssh-server python3-venv unzip
sudo apt install -y binutils build-essential ca-certificates gnupg gnupg2 lsb-release tzdata
```

# Switch to fish
```
sudo apt install -y fish

#To change shell to fish
sudo chsh -s /bin/fish <username> 

#Log out and log back in, and check if using fish
echo $0
```

# Install Bazel
```
sudo apt install apt-transport-https curl gnupg -y
curl -fsSL https://bazel.build/bazel-release.pub.gpg | gpg --dearmor >bazel-archive-keyring.gpg
sudo mv bazel-archive-keyring.gpg /usr/share/keyrings
echo "deb [arch=amd64 signed-by=/usr/share/keyrings/bazel-archive-keyring.gpg] https://storage.googleapis.com/bazel-apt stable jdk1.8" | sudo tee /etc/apt/sources.list.d/bazel.list

sudo apt install bazel
```

# Install extra languages
```
#Install Swift on Linux (Updated to Swift 6.0.3 - latest stable as of January 2025)
sudo apt-get install libc6-dev libcurl4-openssl-dev libedit2 libgcc-11-dev libpython3.10 libsqlite3-0 libstdc++-11-dev libxml2-dev libz3-dev pkg-config zlib1g-dev
wget https://download.swift.org/swift-6.0.3-release/ubuntu2204/swift-6.0.3-RELEASE/swift-6.0.3-RELEASE-ubuntu22.04.tar.gz
tar xzf swift-6.0.3-RELEASE-ubuntu22.04.tar.gz
fish_add_path swift-6.0.3-RELEASE-ubuntu22.04/usr/bin
echo fish_add_path swift-6.0.3-RELEASE-ubuntu22.04/usr/bin>>~/.config/fish/config.fish

#Install Rust
curl --proto '=https' --tlsv1.2 -sSf https://sh.rustup.rs | sh

#Install Haskell
curl --proto '=https' --tlsv1.2 -sSf https://get-ghcup.haskell.org | sh
```


# Brew is used to install simple utilities without sudo to home directory
## Get Brew on MacOS
```
/bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/master/install.sh)"
```

## Get Brew on Linux
```bash
sh -c "$(curl -fsSL https://raw.githubusercontent.com/Linuxbrew/install/master/install.sh)"
echo 'eval $(/home/linuxbrew/.linuxbrew/bin/brew shellenv)' >>~/.zshrc
echo 'PATH="/home/linuxbrew/.linuxbrew/bin:$PATH"'>>~/.zshrc
sudo apt install -y linuxbrew-wrapper
brew update --force
```

