#!/bin/bash

sudo pacman -Syu --needed --noconfirm wine-mono winetricks gnutls lib32-gnutls util-linux samba sed grep

export DIRGET="$HOME/.wine/bitvise"
export WINEPREFIX="$HOME/.wine/wbvsshclient"
export WINEDEBUG="-all"
mkdir -p $DIRGET
mkdir -p $WINEPREFIX
cd "$DIRGET"
winetricks riched20
winetricks win10
wget -c https://dl.bitvise.com/BvSshClient-Inst.exe
wine "BvSshClient-Inst.exe" -force -acceptEULA  "$@"
