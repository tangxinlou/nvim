#!/bin/bash
mkdir -p ~/.local/share/fonts
cp ./JetBrainsMonoNerdFont-Regular.ttf ~/.local/share/fonts
ls -la ~/.local/share/fonts
fc-cache -fv
