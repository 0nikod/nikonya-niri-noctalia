#!/bin/bash

sudo -v || exit 1

sudo chown -R root:root ./etc
sudo stow --target="/" --verbose etc

stow --target="$HOME" --verbose fastfetch
stow --target="$HOME" --verbose niri
stow --target="$HOME" --verbose kitty
stow --target="$HOME" --verbose noctalia
