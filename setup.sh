#/bin/bash

echo "Installing tmux config"
cp ./tmux/.tmux.conf ~/.tmux.conf

echo "Installing neovim config"
cp -r ./nvim/.config/ ~/.config/

echo "All Done!"
