#!/bin/bash

# Khởi chạy VNC server
/usr/bin/tightvncserver :1 -geometry $VNC_RESOLUTION -depth $VNC_COL_DEPTH -localhost no

# Start desktop environment
/usr/bin/startxfce4 --replace
