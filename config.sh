#!/bin/bash
set -e

# Install required packages
echo "Installing packages..."
sudo apt-get update
sudo apt-get install -y neovim xclip

# Create config directories if they don't exist
echo "Creating config directories..."
mkdir -p ~/.config/nvim/colors

# Set up Neovim configuration
echo "Setting up Neovim configuration..."
ln -sf $(pwd)/nvim/init.lua ~/.config/nvim/init.lua
ln -sf $(pwd)/nvim/colors/solarized.vim ~/.config/nvim/colors/solarized.vim

echo "Neovim configuration completed!"
