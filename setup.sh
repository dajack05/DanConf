#/bin/bash

echo "Installing TPM for tmux"
git clone https://github.com/tmux-plugins/tpm ~/.tmux/plugins/tpm

echo "Installing tmux config"
cp ./tmux/.tmux.conf ~/.tmux.conf

echo "Installing neovim config"
cp -r ./nvim/.config/ ~/.config/

echo "All Done!"
