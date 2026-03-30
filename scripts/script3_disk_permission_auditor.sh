#!/bin/bash
# ============================================================
# Script 3: Disk and Permission Auditor
# Author: Tatikonda Aditya | Reg No: 24BCE11182
# Course: Open Source Software | OSS NGMC Capstone Project
# Description: Loops through system directories, reports
#              permissions, owner, group and disk usage.
#              Also checks VLC's config directory.
# ============================================================

# --- Array of directories to audit ---
# Arrays in bash: NAME=("item1" "item2" "item3")
DIRS=("/etc" "/var/log" "/home" "/usr/bin" "/tmp" "/var" "/opt")

# --- VLC specific config paths ---
VLC_USER_CONFIG="$HOME/.config/vlc"
VLC_LIB_DIR="/usr/lib/vlc"

echo "================================================================"
echo "        Disk and Permission Auditor                             "
echo "================================================================"
echo ""
echo "  Auditing system directories..."
echo ""
printf "  %-20s %-12s %-10s %-10s %-10s\n" "Directory" "Permissions" "Owner" "Group" "Size"
echo "  ------------------------------------------------------------------------"

# ============================================================
# for loop: goes through each item in the DIRS array
# "${DIRS[@]}" means "all elements of the array"
# ============================================================
for DIR in "${DIRS[@]}"; do
    # [ -d "$DIR" ] checks if this directory actually exists
    if [ -d "$DIR" ]; then
        # ls -ld gives info about the directory itself
        # awk extracts specific columns from that output
        PERMS=$(ls -ld "$DIR" | awk '{print $1}')
        OWNER=$(ls -ld "$DIR" | awk '{print $3}')
        GROUP=$(ls -ld "$DIR" | awk '{print $4}')

        # du -sh gives human readable size, cut grabs just the number
        # 2>/dev/null hides "permission denied" errors silently
        SIZE=$(du -sh "$DIR" 2>/dev/null | cut -f1)

        printf "  %-20s %-12s %-10s %-10s %-10s\n" \
            "$DIR" "$PERMS" "$OWNER" "$GROUP" "${SIZE:-N/A}"
    else
        printf "  %-20s %-12s\n" "$DIR" "NOT FOUND"
    fi
done

echo ""
echo "================================================================"
echo "  VLC-SPECIFIC CONFIGURATION AUDIT"
echo "  (Chosen software: VLC Media Player)"
echo "================================================================"
echo ""

# Check VLC user config directory
if [ -d "$VLC_USER_CONFIG" ]; then
    PERMS=$(ls -ld "$VLC_USER_CONFIG" | awk '{print $1, $3, $4}')
    SIZE=$(du -sh "$VLC_USER_CONFIG" 2>/dev/null | cut -f1)
    echo "  VLC user config : $VLC_USER_CONFIG"
    echo "  Permissions     : $PERMS"
    echo "  Size            : ${SIZE:-tiny}"
else
    echo "  VLC user config ($VLC_USER_CONFIG) : NOT FOUND"
    echo "  (VLC creates this folder on first launch)"
fi

echo ""

# Check VLC library directory
if [ -d "$VLC_LIB_DIR" ]; then
    PERMS=$(ls -ld "$VLC_LIB_DIR" | awk '{print $1, $3, $4}')
    echo "  VLC lib dir     : $VLC_LIB_DIR"
    echo "  Permissions     : $PERMS"
else
    echo "  VLC lib dir ($VLC_LIB_DIR) : NOT FOUND"
    echo "  (Install VLC first: sudo apt install vlc)"
fi

echo ""
echo "================================================================"
echo "  WHY PERMISSIONS MATTER IN OPEN SOURCE"
echo "================================================================"
echo ""
echo "  /etc   (755) : Config readable by all — transparency"
echo "  /home  (755) : Each user owns their space — personal freedom"
echo "  /tmp  (1777) : Sticky bit — shared space but protected"
echo "  VLC config   : Owned by you — your preferences, your control"
echo "================================================================"
