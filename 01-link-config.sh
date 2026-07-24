#!/bin/bash

# sudo chown -R root:root ./etc

stow --target="$HOME" --verbose fastfetch
stow --target="$HOME" --verbose niri
stow --target="$HOME" --verbose kitty
stow --target="$HOME" --verbose noctalia
stow --target="$HOME" --verbose xdg-desktop-portal

