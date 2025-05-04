#!/bin/bash

cd "$HOME/.wine/bitvise/bitvise_desktop_files"
sed -i "s|/home/manjaro|$HOME|g" *.desktop
cp -a *.desktop "$HOME/.local/share/applications"


