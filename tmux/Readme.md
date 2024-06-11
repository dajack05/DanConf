[back](../Readme.md)

# TMUX Configuration

## Setup

1. Install TMUX
    `sudo apt install tmux`
2. Create tmux config file
    `touch ~/.tmux.conf`
3. Copy/Paste this junk:
    ```
    # Sane split panes
    bind | split-window -h
    bind - split-window -v
    unbind '"'
    unbind %

    # Switch panes using alt-arrow without prefix
    bind -n M-left select-pane -L
    bind -n M-Right select-pane -R
    bind -n M-Up select-pane -U
    bind -n M-Down select-pane -D
    
    # Enable Mouse Mode
    set -g mouse on
    ```
