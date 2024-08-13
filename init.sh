#!/bin/bash

################## Installing Dependencies #######################
packages=(zsh fzf git stow zoxide neofetch)
if [ -x "$(command -v apk)" ]; then
    sudo apk add --no-cache "${packages[@]}"
elif [ -x "$(command -v apt)" ]; then
    sudo apt-get install "${packages[@]}"
elif [ -x "$(command -v dnf)" ]; then
    sudo dnf install "${packages[@]}"
elif [ -x "$(command -v zypper)" ]; then
    sudo zypper install "${packages[@]}"
elif [ -x "$(command -v pacman)" ]; then
    pacman -S "${packages[@]}"
else
    echo "FAILED TO INSTALL PACKAGES: Package manager not found. You must manually install: ${packages[*]}" >&2
fi

####################### Changing Shell to zsh ####################
if [ -x "$(command -v zsh)" ]; then
    echo "Changing the default shell to zsh..."
    chsh -s "$(which zsh)"
    echo "Please log out and log back in for the changes to take effect."
else
    echo "zsh is not installed. Unable to change the default shell." >&2
fi

######################### Installing zed #########################
ZED_INSTALLL="https://zed.dev/install.sh"

# Check if the zed binary exists
if ! command which zed &>/dev/null; then
    echo -e "\e[33m\e[220mInstalling \e[33mzed\e[220m editor…\e[0m"

    # Download and execute the installation script
    if command curl -fsSL "$ZED_INSTALLL" | sh; then
        echo -e "\e[33m\e[34mInstallation successful.\e[0m"
    else
        echo -e "\e[160mThe installation has failed.\e[0m"
    fi
else
    echo -e "\e[33m\e[34mZed is already installed.\e[0m"
fi

###################### Installing starship #######################
STARSHIP_INSTALL="https://starship.rs/install.sh"

# Check if the starship binary exists
if ! command which starship &>/dev/null; then
    echo -e "\e[33m\e[220mInstalling \e[33mStarship\e[220m prompt…\e[0m"

    # Download and execute the installation script
    if command curl -sS "$STARSHIP_INSTALL" | sh; then
        echo -e "\e[33m\e[34mInstallation successful.\e[0m"
    else
        echo -e "\e[160mThe installation has failed.\e[0m"
    fi
else
    echo -e "\e[33m\e[34mStarship is already installed.\e[0m"
fi

######################## Stowing Dotfiles ########################
if [ -d "$HOME/dotfiles" ]; then
    echo "Stowing dotfiles..."
    cd "$HOME/dotfiles" && stow .
else
    echo "No dotfiles directory found at $HOME/dotfiles. Clone the repo again." >&2
fi

##################################################################

