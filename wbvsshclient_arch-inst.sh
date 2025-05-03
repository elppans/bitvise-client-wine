#!/bin/bash

sudo pacman -Syu --needed --noconfirm wine-mono gnutls lib32-gnutls

export DIRGET="$HOME/.wine/bitvise"
export WINEPREFIX="$HOME/.wine/wbvsshclient"
export WINEDEBUG="-all"
mkdir -p $DIRGET
mkdir -p $WINEPREFIX
cd "$DIRGET"
wget -c https://dl.bitvise.com/BvSshClient-Inst.exe
wine "BvSshClient-Inst.exe" -force -acceptEULA  "$@"
