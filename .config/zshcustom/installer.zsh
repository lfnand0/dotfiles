######################### Installing zed #########################
ZED_BINARY="$HOME/.local/bin/zed"
INSTALL_URL="https://zed.dev/install.sh"

# Check if the zed binary exists
if [[ ! -f $ZED_BINARY ]]; then
    print -P "%F{33} %F{220}Installing %F{33}zed%F{220} editor…%f"

    # Download and execute the installation script
    if command curl -fsSL "$INSTALL_URL" | sh; then
        print -P "%F{33} %F{34}Installation successful.%f%b"
    else
        print -P "%F{160} The installation has failed.%f%b"
    fi
fi

###################### Installing starship #######################
# Define the path to the starship binary and the URL for the installation script
STARSHIP_BINARY="/usr/local/bin/starship"
INSTALL_URL="https://starship.rs/install.sh"

# Check if the starship binary exists
if [[ ! -f $STARSHIP_BINARY ]]; then
    print -P "%F{33} %F{220}Installing %F{33}Starship%F{220} prompt…%f"

    # Download and execute the installation script
    if command curl -sS "$INSTALL_URL" | sh; then
        print -P "%F{33} %F{34}Installation successful.%f%b"
    else
        print -P "%F{160} The installation has failed.%f%b"
    fi
fi
##################################################################
