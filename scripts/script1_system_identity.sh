#!/bin/bash
# ============================================================
# Script 1: System Identity Report
# Author: Tatikonda Aditya | Reg No: 24BCE11182
# Course: Open Source Software | OSS NGMC Capstone Project
# Description: Displays system info like a welcome screen
#              showing OS, kernel, user, uptime and license.
# ============================================================

# --- Student & Software Variables ---
# Variables in bash: just NAME="value", no spaces around =
STUDENT_NAME="Tatikonda Aditya"
REG_NO="24BCE11182"
SOFTWARE_CHOICE="VLC Media Player"

# --- Collect system info using command substitution ---
# $() means: run this command and store its output as a value
KERNEL=$(uname -r)
DISTRO=$(cat /etc/os-release | grep "^PRETTY_NAME" | cut -d= -f2 | tr -d '"')
USER_NAME=$(whoami)
HOME_DIR=$HOME
UPTIME=$(uptime -p)
CURRENT_DATE=$(date '+%A, %d %B %Y')
CURRENT_TIME=$(date '+%H:%M:%S %Z')

# --- License info ---
# VLC uses LGPL v2.1 for its core libraries
OS_LICENSE="GNU General Public License v2 (GPL v2) — Linux Kernel"
VLC_LICENSE="GNU Lesser General Public License v2.1 (LGPL v2.1)"

# ============================================================
# Display the welcome screen using echo
# ============================================================
echo "================================================================"
echo "        OPEN SOURCE AUDIT — System Identity Report             "
echo "================================================================"
echo ""
echo "  Student  : $STUDENT_NAME"
echo "  Reg No   : $REG_NO"
echo "  Software : $SOFTWARE_CHOICE"
echo ""
echo "----------------------------------------------------------------"
echo "  SYSTEM INFORMATION"
echo "----------------------------------------------------------------"
echo "  Distribution : $DISTRO"
echo "  Kernel       : $KERNEL"
echo "  Logged User  : $USER_NAME"
echo "  Home Dir     : $HOME_DIR"
echo "  Uptime       : $UPTIME"
echo "  Date         : $CURRENT_DATE"
echo "  Time         : $CURRENT_TIME"
echo ""
echo "----------------------------------------------------------------"
echo "  LICENSE INFORMATION"
echo "----------------------------------------------------------------"
echo "  OS License  : $OS_LICENSE"
echo "  VLC License : $VLC_LICENSE"
echo ""
echo "  LGPL v2.1 allows companies to use VLC's core library (libVLC)"
echo "  in proprietary software, while the full VLC player stays GPL."
echo "  This dual approach maximises both freedom and adoption."
echo "================================================================"
