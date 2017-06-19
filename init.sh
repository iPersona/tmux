#!/bin/sh

# symbol link to ~/.tmux.conf
tmuxConfLn=~/.tmux.conf
if [ -L $tmuxConfLn ]; then
  rm $tmuxConfLn
fi
ln -s ~/.tmux/tmux.conf $tmuxConfLn

# install plugins
tmuxPlugin=~/.tmux/plugins
if [ -d $tmuxPlugin ]; then
  rm -rf $tmuxPlugin
fi
git clone https://github.com/tmux-plugins/tpm $tmuxPlugin/tpm
git clone https://github.com/tmux-plugins/tmux-sensible.git $tmuxPlugin/tmux-sensible
git clone https://github.com/tmux-plugins/tmux-yank $tmuxPlugin/tmux-yank


# reload config
tmux source $tmuxConfLn
