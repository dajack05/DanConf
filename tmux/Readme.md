[back](../Readme.md)

# TMUX Configuration

## Setup

1. Install TMUX
    `sudo apt install tmux`
2. Install [TPM](https://github.com/tmux-plugins/tpm#installation)
3. Create tmux config file
    `touch ~/.tmux.conf`
4. Copy/Paste this junk into `~/.tmux.config`:
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
    
    set -g @catppuccin_window_left_separator "█"
    set -g @catppuccin_window_right_separator "█ "
    set -g @catppuccin_window_number_position "right"
    set -g @catppuccin_window_middle_separator "  █"
    
    set -g @catppuccin_window_default_fill "number"
    
    set -g @catppuccin_window_current_fill "number"
    set -g @catppuccin_window_current_text "#{pane_current_path}"
    
    set -g @catppuccin_status_modules_right "application session date_time"
    set -g @catppuccin_status_left_separator  ""
    set -g @catppuccin_status_right_separator " "
    set -g @catppuccin_status_fill "all"
    set -g @catppuccin_status_connect_separator "yes"
    
    # Set catppuchin theme
    set -g @plugin 'tmux-plugins/tpm'
    set -g @plugin 'catppuccin/tmux'
    
    run '~/.tmux/plugins/tpm/tpm'
    ```
5. Update TPM plugins by pressing <leader> + I (Ctrl+B, I) while in TMUX.
