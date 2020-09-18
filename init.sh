#!/bin/sh

#################################################################################
# (Tmux使用手册)[https://juejin.im/post/59cf8ab26fb9a00a4c273352]
#
#################################################################################

echo What is your platform
echo 1.Linux	2.MAC
read platform

# symbol link to ~/.tmux.conf
tmuxConfLn=~/.tmux.conf

if [ -L $tmuxConfLn]; then
  echo "removing old shortcut..."
  rm $tmuxConfLn
fi

if [ $platform -eq 1 ]
then
    tmuxConf=$PWD/tmux-linux.conf
    echo install xsel
    sudo pacman -S xsel
else
    tmuxConf=$PWD/tmux-mac.conf
fi

if [ -L $tmuxConfLn ]; then
  rm $tmuxConfLn
fi
echo "creating symbol link..."
ln -s $tmuxConf $tmuxConfLn

# install plugins
echo "installing plugins..."
tmuxPlugin=$PWD/plugins
if [ -d $tmuxPlugin ]; then
  rm -rf $tmuxPlugin
fi
git clone https://github.com/tmux-plugins/tpm $tmuxPlugin/tpm
git clone https://github.com/tmux-plugins/tmux-sensible.git $tmuxPlugin/tmux-sensible
git clone https://github.com/tmux-plugins/tmux-yank $tmuxPlugin/tmux-yank


# reload config
echo "applying new configuration..."
tmux source $tmuxConfLn

echo "finished!"
