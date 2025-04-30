#!/bin/bash

DGET="$HOME/build/bitvise"
mkdir -p $DGET
export WINEARCH="win32"
export WINEPREFIX="$HOME/.wine/wbvsshclient"
mkdir -p $WINEPREFIX
export WINEDEBUG="-all"
#winepath
winetricks arch=32
winetricks forcemono
winetricks win81
cd "$DGET"

#wget -c https://dl.winehq.org/wine/wine-gecko/2.47/wine_gecko-2.47-x86.msi
#wine wine_gecko-2.47-x86.msi

wget -c https://dl.bitvise.com/BvSshClient-Inst.exe
wine "BvSshClient-Inst.exe" -force -acceptEULA


