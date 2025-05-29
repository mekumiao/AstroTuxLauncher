#!/bin/bash
if [ ! -f "AstroneerServer" ]; then
  python3 AstroTuxLauncher.py install
fi
python3 AstroTuxLauncher.py start