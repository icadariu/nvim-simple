#!/bin/bash
# Script used to set up the icadariu/nvim repository from scratch
# Author: Ionut
# Date: 02.11.2024

# Check if package is installed
is_installed() {
  local cmd=$1
  command -v "$cmd" >/dev/null 2>&1
}

# Ask user to install package.
prompt_install() {
  local pkg_name=$1

  read -rp "$pkg_name is not installed. Do you want to install it? (y/n): " choice

  if [[ "$choice" =~ ^[Yy]$ ]]; then
    case "$pkg_name" in
      git)
        echo "Installing $pkg_name..."
        sudo apt update
        sudo apt install -y git
        ;;
      nvim)
        echo "Installing $pkg_name..."
        curl -Lso /tmp/nvim-linux64.tar.gz https://github.com/neovim/neovim/releases/latest/download/nvim-linux64.tar.gz
        sudo tar -zxf /tmp/nvim-linux64.tar.gz -C /opt/
        sudo ln -sf /opt/nvim-linux64/bin/nvim /usr/local/bin/
        ;;
      go)
        echo "Installing $pkg_name..."
        sudo snap refresh
        sudo snap install go --classic
        sudo snap install ripgrep --classic
        ;;
      lazygit)
        echo "Installing $pkg_name..."
        LAZYGIT_VERSION=$(curl -s "https://api.github.com/repos/jesseduffield/lazygit/releases/latest" | grep -Po '"tag_name": "v\K[^"]*')
        curl -Lso /tmp/lazygit.tar.gz "https://github.com/jesseduffield/lazygit/releases/download/v${LAZYGIT_VERSION}/lazygit_${LAZYGIT_VERSION}_Linux_x86_64.tar.gz"
        tar -zxf /tmp/lazygit.tar.gz -C /tmp/
        sudo install /tmp/lazygit /usr/local/bin
        ;;
      node)
        # Reference: https://johnpapa.net/node-and-npm-without-sudo/
        echo "Installing $pkg_name..."

        node_version='v22.9.0'
        mkdir -p "$HOME"/tools && cd "$HOME"/tools || exit
        wget https://nodejs.org/dist/${node_version}/node-${node_version}-linux-x64.tar.xz
        tar xvf node-${node_version}-linux-x64.tar.xz --directory="$HOME"/tools

        if [[ ${SHELL} == "/bin/bash" ]]; then
          echo "$SHELL shell identified"
          grep -q "PATH=.*${node_version}" ~/.bashrc || echo "export PATH=\$HOME/tools/node-${node_version}-linux-x64/bin:\$PATH" >> ~/.bashrc
        elif [[ ${SHELL} == "/bin/zsh" ]]; then
          echo "$SHELL shell identified"
          grep -q "PATH=.*${node_version}" ~/.zshrc || echo "export PATH=\$HOME/tools/node-${node_version}-linux-x64/bin:\$PATH" >> ~/.zshrc
        else
          echo "Unsupported shell. Please manually update your PATH for Node.js."
        fi

        export PATH=${HOME}/tools/node-${node_version}-linux-x64/bin:${PATH}
        mkdir -p "$HOME"/.npm-packages
        npm config set prefix "$HOME"/.npm-packages
        npm install -g neovim
        ;;
      additional-tools)
        echo "Installing $pkg_name..."

        sudo apt update
        sudo apt install -y python3-pip python3-venv python3-yaml cargo luarocks fd-find xclip shellcheck
        ;;
      *)
        echo "No installation instructions for $pkg_name."
        ;;
    esac
    echo "$pkg_name has been installed."
  else
    echo "Skipping installation of $pkg_name."
  fi
}

# Ensure ~/.config exists
mkdir -p "$HOME/.config"

echo "Backing up old nvim configuration, if present"
[ -d "$HOME/.config/nvim" ] && mv "$HOME/.config/nvim" "$HOME/.config/nvim.bk_$RANDOM"

# Check and install git
if ! is_installed "git"; then
  prompt_install "git"
fi

# Clone the nvim configuration repository
echo "Cloning icadariu/nvim to $HOME/.config/nvim"
git clone https://github.com/icadariu/nvim.git "$HOME/.config/nvim"

# Check and install nvim
if ! is_installed "nvim"; then
  prompt_install "nvim"
fi

# Check and install go
if ! is_installed "go"; then
  prompt_install "go"
fi

# Install other tools used by nvim setup
echo "Checking and installing other tools used by nvim setup"
prompt_install "additional-tools"

# Check and install lazygit
if ! is_installed "lazygit"; then
  prompt_install "lazygit"
fi

# Check and install Node.js
if ! is_installed "node"; then
  prompt_install "node"
fi

echo "Don't forget to run :checkhealth to make sure things are working fine!"
