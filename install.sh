#! /bin/bash

# This beauty came from https://stackoverflow.com/questions/59895/how-to-get-the-source-directory-of-a-bash-script-from-within-the-script-itself
script_dir="$( cd "$( dirname "${BASH_SOURCE[0]}" )" >/dev/null 2>&1 && pwd )"

ln -s "${script_dir}/tmux.conf" ~/.tmux.conf
ln -s "${script_dir}/zshrc" ~/.zshrc

if [ ! -d "$HOME/.config" ]; then
	mkdir ~/.config
fi

ln -s "${script_dir}/nvim" ~/.config/nvim
