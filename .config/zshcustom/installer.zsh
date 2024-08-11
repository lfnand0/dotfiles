######################### Installing zed #########################
ZED_INSTALLL="https://zed.dev/install.sh"

# Check if the zed binary exists
if ! command which zed &> /dev/null; then
    print -P "%F{33} %F{220}Installing %F{33}zed%F{220} editor…%f"

    # Download and execute the installation script
    if command curl -fsSL "$ZED_INSTALLL" | sh; then
        print -P "%F{33} %F{34}Installation successful.%f%b"
    else
        print -P "%F{160} The installation has failed.%f%b"
    fi
fi

###################### Installing starship #######################
STARSHIP_INSTALL="https://starship.rs/install.sh"

# Check if the starship binary exists
if ! command which starship &> /dev/null; then
    print -P "%F{33} %F{220}Installing %F{33}Starship%F{220} prompt…%f"

    # Download and execute the installation script
    if command curl -sS "$STARSHIP_INSTALL" | sh; then
        print -P "%F{33} %F{34}Installation successful.%f%b"
    else
        print -P "%F{160} The installation has failed.%f%b"
    fi
fi
##################################################################
