# Welcome to My NixOS and Dotfiles Setup

This repository serves as a beginner-friendly guide to setting up a personalized NixOS environment, complete with configurations for Neovim, Fish shell, and Obsidian. Whether you're new to NixOS or looking to organize your dotfiles, this guide will help you replicate and understand every aspect of the setup.

---

## Table of Contents

- [Prerequisites](#prerequisites)
- [1. NixOS System Configuration](#1-nixos-system-configuration)
- [2. Neovim Configuration](#2-neovim-configuration)
- [3. Fish Shell Configuration](#3-fish-shell-configuration)
- [4. Obsidian Configuration](#4-obsidian-configuration)
- [5. Version Control with Git](#5-version-control-with-git)
- [6. Automating Dotfile Management](#6-automating-dotfile-management)
- [7. Learning Resources](#7-learning-resources)

---

## Prerequisites

- **NixOS Installed**: Ensure that NixOS is installed on your system. Follow the [official installation guide](https://nixos.org/manual/nixos/stable/#ch-installation) if needed.
- **Basic Understanding of NixOS**: Familiarity with NixOS's declarative configuration approach is beneficial but not mandatory.

---

## 1. NixOS System Configuration

The `configuration.nix` file, located in `/etc/nixos/`, defines system-wide settings such as package installations, services, and user options.

### Accessing `configuration.nix`

```bash
sudo nano /etc/nixos/configuration.nix
```

### Key Sections to Configure

#### System Packages
Add essential packages to the `environment.systemPackages` list:

```nix
environment.systemPackages = with pkgs; [
  vim
  git
  wget
  # Add other desired packages here
];
```

#### Services
Enable necessary services. For example, to enable the OpenSSH service:

```nix
services.openssh.enable = true;
```

#### User Configuration
Set user-specific settings, such as the default shell:

```nix
users.users.<your-username> = {
  isNormalUser = true;
  shell = pkgs.fish;
  # Additional user settings
};
```

### Applying Changes

After editing, apply the changes:

```bash
sudo nixos-rebuild switch
```

---

## 2. Neovim Configuration

Neovim's configuration is typically stored in `~/.config/nvim/init.vim` or `~/.config/nvim/init.lua`.

### Setting Up the Configuration Directory

```bash
mkdir -p ~/.config/nvim
```

### Creating the Configuration File

- For `init.vim`:

  ```bash
  nano ~/.config/nvim/init.vim
  ```

- For `init.lua`:

  ```bash
  nano ~/.config/nvim/init.lua
  ```

### Sample Configurations

- **For `init.vim`:**

  ```vim
  set number
  syntax on
  set tabstop=4
  set shiftwidth=4
  set expandtab
  ```

- **For `init.lua`:**

  ```lua
  vim.o.number = true
  vim.o.tabstop = 4
  vim.o.shiftwidth = 4
  vim.o.expandtab = true
  ```

---

## 3. Fish Shell Configuration

Fish configuration files are stored in `~/.config/fish/`.

### Setting Up the Configuration Directory

```bash
mkdir -p ~/.config/fish
```

### Configuring `config.fish`

```bash
nano ~/.config/fish/config.fish
```

### Sample Configuration

```fish
set -g -x EDITOR nvim
set -g -x VISUAL nvim
alias ll='ls -la'
```

---

## 4. Obsidian Configuration

Obsidian's configuration files should be placed in `~/Documents/Obsidian/`.

### Setting Up the Configuration Directory

```bash
mkdir -p ~/Documents/Obsidian
```

### Syncing Configuration

If you have existing configuration files, copy them into this directory.

---

## 5. Version Control with Git

To manage and share your configurations effectively, use Git.

### Initializing a Git Repository

```bash
git init
```

### Adding Configuration Files

```bash
git add /etc/nixos/configuration.nix ~/.config/nvim/ ~/.config/fish/ ~/Documents/Obsidian/
```

### Committing Changes

```bash
git commit -m "Initial commit of NixOS configurations and dotfiles"
```

### Pushing to GitHub

Create a repository on GitHub and follow the instructions to push your local repository.

---

## 6. Automating Dotfile Management

For efficient dotfile management, consider using tools like [Home Manager](https://nix-community.github.io/home-manager/).

### Installing Home Manager

Follow the [official installation guide](https://nix-community.github.io/home-manager/#sec-install-standalone).

### Configuring Home Manager

Create a `home.nix` file to manage user-specific configurations declaratively.

---

## 7. Learning Resources

To deepen your understanding of NixOS and its ecosystem, explore these resources:

- [NixOS Manual](https://nixos.org/manual/nixos/stable/)
- [Nixpkgs Manual](https://nixos.org/manual/nixpkgs/stable/)
- [Nix Package Manager Manual](https://nixos.org/manual/nix/stable/)

### Community Repositories for Inspiration

- [Misterio77's Nix Config](https://github.com/Misterio77/nix-config)
- [notthebee's Nix Config](https://github.com/notthebee/nix-config)

---

## Conclusion

By following this guide, you can set up a personalized NixOS environment tailored to your workflow. Regularly updating and version-controlling your configurations will ensure a consistent and reproducible setup across different systems. Happy hacking! 🚀
