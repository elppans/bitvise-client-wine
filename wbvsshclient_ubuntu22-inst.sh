#!/bin/bash

# winetricks crypt32 = O algoritmo de ECDH não pôde ser inicializado.

# Wine 32 bits só é instalado se o repositório updates estiver ativado.
echo -e 'deb http://cz.archive.ubuntu.com/ubuntu jammy-updates main' | sudo tee -a /etc/apt/sources.list.d/cz.archive.ubuntu.list
sudo apt update
sudo apt install wine winetricks wine32
sudo sed -i 's/^/# /' /etc/apt/sources.list.d/cz.archive.ubuntu.list

export DIRGET="$HOME/.wine/bitvise"
export WINEPREFIX="$HOME/.wine/wbvsshclient"
export WINEDEBUG="-all"
# export WINEARCH=win32
mkdir -p $DIRGET
mkdir -p $WINEPREFIX
cd "$DIRGET"
winetricks -f -q riched20
winetricks -q msasn1
winetricks -f -q vcrun2019
winetricks -f -q dotnet48
winetricks crypt32
#winetricks crypt32_winxp
winetricks winhttp
winetricks wininet
winetricks win7
#wget -c https://dl.bitvise.com/BvSshClient-Inst.exe
wine "BvSshClient-Inst.exe" -force -acceptEULA  -winFsp=y -interactive "$@"

#wget -c https://slproweb.com/download/Win64OpenSSL_Light-3_5_0.exe
#wine Win64OpenSSL_Light-3_5_0.exe /SILENT /NORESTART

# Configurar o PATH manualmente
# Verificar o PATH e fazer o reg acrescentando "C:\Program Files\OpenSSL-Win64\bin" no final
# wine cmd /c echo %PATH%
# wine reg add "HKLM\SYSTEM\CurrentControlSet\Control\Session Manager\Environment" /v PATH /t REG_EXPAND_SZ /d "C:\windows\system32;C:\windows;C:\windows\system32\wbem;C:\windows\system32\WindowsPowershell\v1.0;C:\Program Files\OpenSSL-Win64;C:\Program Files\OpenSSL-Win64\bin" /f

# Depois testar com:
# wine cmd /c  openssl version -a
