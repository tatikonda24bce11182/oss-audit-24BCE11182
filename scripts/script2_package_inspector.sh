#!/bin/bash
# ============================================================
# Script 2: FOSS Package Inspector
# Author: Tatikonda Aditya | Reg No: 24BCE11182
# Course: Open Source Software | OSS NGMC Capstone Project
# Description: Checks if VLC is installed, shows its details,
#              and prints philosophy notes using a case statement.
# ============================================================

# --- Package we're inspecting ---
PACKAGE="vlc"

echo "================================================================"
echo "        FOSS Package Inspector                                  "
echo "================================================================"
echo ""
echo "  Checking package: $PACKAGE"
echo ""

# ============================================================
# if-then-else: Check if VLC is installed
# Supports both RPM-based and Debian-based Linux systems
# command -v checks if a tool exists on the system
# ============================================================
if command -v dpkg &>/dev/null && dpkg -l "$PACKAGE" 2>/dev/null | grep -q "^ii"; then
    # Debian/Ubuntu system
    echo "  STATUS: $PACKAGE is INSTALLED (Debian-based system)"
    echo ""
    echo "  Package Details:"
    echo "  ----------------------------------------------------------------"
    dpkg -l "$PACKAGE" | grep "^ii" | awk '{printf "  Package : %s\n  Version : %s\n", $2, $3}'
    dpkg-query -W -f='  License : See /usr/share/doc/${Package}/copyright\n  Summary : ${Description}\n' "$PACKAGE" 2>/dev/null

elif command -v rpm &>/dev/null && rpm -q "$PACKAGE" &>/dev/null; then
    # Fedora/CentOS/RHEL system
    echo "  STATUS: $PACKAGE is INSTALLED (RPM-based system)"
    echo ""
    echo "  Package Details:"
    echo "  ----------------------------------------------------------------"
    rpm -qi "$PACKAGE" | grep -E "Version|License|Summary|URL" | \
        while IFS=: read -r KEY VAL; do
            printf "  %-12s: %s\n" "$KEY" "$VAL"
        done

elif command -v vlc &>/dev/null; then
    # VLC found in PATH (compiled from source)
    VLC_VERSION=$(vlc --version 2>/dev/null | head -1)
    echo "  STATUS: $PACKAGE is INSTALLED (found in PATH)"
    echo ""
    echo "  Package Details:"
    echo "  ----------------------------------------------------------------"
    echo "  Version  : $VLC_VERSION"
    echo "  License  : LGPL v2.1 (core) / GPL v2 (player)"
    echo "  Summary  : Free and open source multimedia player"

else
    # Not installed
    echo "  STATUS: $PACKAGE is NOT INSTALLED"
    echo ""
    echo "  To install VLC, run:"
    echo "    Ubuntu/Debian : sudo apt install vlc"
    echo "    Fedora/RHEL   : sudo dnf install vlc"
fi

echo ""
echo "================================================================"
echo "  OPEN SOURCE PHILOSOPHY NOTES"
echo "================================================================"
echo ""

# ============================================================
# case statement: prints a philosophy note per package name
# case is like switch in other languages
# ;; means end of each case block
# *) is the default case (catches anything not listed)
# ============================================================
case $PACKAGE in
    vlc)
        echo "  VLC: Born in a French university dorm room — students who"
        echo "  just wanted to stream campus TV built what became the most"
        echo "  downloaded media player on Earth. 4 billion downloads."
        echo "  No ads. No premium version. Just freedom."
        ;;
    git)
        echo "  Git: Built in 10 days by Linus Torvalds out of pure rage"
        echo "  when a proprietary tool revoked its free license."
        echo "  Now used by 90% of developers worldwide."
        ;;
    httpd | apache2)
        echo "  Apache: The web server that built the open internet."
        echo "  Powers roughly 30% of all websites globally."
        ;;
    mysql | mariadb)
        echo "  MySQL: Open source at the heart of millions of apps."
        echo "  Its dual-license story is a textbook example of"
        echo "  how businesses can monetise open-source projects."
        ;;
    firefox)
        echo "  Firefox: A nonprofit fighting for an open web."
        echo "  Proof that market dominance doesn't have to be the goal."
        ;;
    python3 | python)
        echo "  Python: Shaped entirely by community consensus."
        echo "  PEPs show that governance matters as much as code."
        ;;
    *)
        echo "  $PACKAGE: Every open-source tool carries a story of"
        echo "  someone deciding to share rather than hoard their work."
        ;;
esac

echo ""
echo "================================================================"
