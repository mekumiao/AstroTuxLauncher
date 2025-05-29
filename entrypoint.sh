#!/bin/bash
if [ ! -d "./AstroneerServer" ]; then
  python3 AstroTuxLauncher.py install
fi
python3 AstroTuxLauncher.py start