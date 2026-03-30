#!/bin/bash
# ============================================================
# Script 4: Log File Analyzer
# Author: Tatikonda Aditya | Reg No: 24BCE11182
# Course: Open Source Software | OSS NGMC Capstone Project
# Description: Reads a log file line by line, counts how many
#              lines contain a keyword, prints last 5 matches.
# Usage: ./script4_log_analyzer.sh /path/to/logfile [KEYWORD]
# ============================================================

# --- Command line arguments ---
# $1 = first thing typed after script name
# $2 = second thing typed (optional, defaults to "error")
LOGFILE=$1
KEYWORD=${2:-"error"}

# --- Counter starts at zero ---
COUNT=0

# --- Array to store matching lines ---
MATCH_LINES=()

echo "================================================================"
echo "        Log File Analyzer                                       "
echo "================================================================"
echo ""

# ============================================================
# Validate: did the user give us a file path?
# -z means "is this variable empty?"
# ============================================================
if [ -z "$LOGFILE" ]; then
    echo "  ERROR: No log file specified."
    echo "  Usage: $0 /path/to/logfile [keyword]"
    echo ""
    echo "  Try: $0 /var/log/syslog error"
    exit 1
fi

# ============================================================
# Validate: does the file actually exist?
# -f means "is this a file?"
# If not, try fallback locations (do-while simulation)
# ============================================================
if [ ! -f "$LOGFILE" ]; then
    echo "  File '$LOGFILE' not found. Trying fallback locations..."
    echo ""

    # Bash has no do-while, so we simulate it with a flag
    RETRY=true
    ATTEMPT=0

    while $RETRY; do
        ATTEMPT=$((ATTEMPT + 1))

        # Try different log file locations based on attempt number
        case $ATTEMPT in
            1) FALLBACK="/var/log/syslog" ;;
            2) FALLBACK="/var/log/messages" ;;
            3) FALLBACK="/var/log/kern.log" ;;
        esac

        if [ -f "$FALLBACK" ]; then
            echo "  Found fallback: $FALLBACK"
            LOGFILE="$FALLBACK"
            RETRY=false
        elif [ $ATTEMPT -ge 3 ]; then
            echo "  No log files found. Please provide a valid path."
            exit 1
        fi
    done
fi

echo "  Log File : $LOGFILE"
echo "  Keyword  : '$KEYWORD' (case-insensitive)"
echo ""
echo "  Scanning..."
echo ""

# ============================================================
# while read loop: reads file ONE LINE AT A TIME
# IFS= preserves spaces at start/end of each line
# -r stops bash from mangling backslashes
# ============================================================
while IFS= read -r LINE; do
    # grep -iq = search case-insensitively, quietly (no output)
    # if the line contains our keyword, count it
    if echo "$LINE" | grep -iq "$KEYWORD"; then
        COUNT=$((COUNT + 1))
        MATCH_LINES+=("$LINE")    # add line to our array
    fi
done < "$LOGFILE"

# ============================================================
# Display results
# ============================================================
echo "  ----------------------------------------------------------------"
echo "  RESULTS"
echo "  ----------------------------------------------------------------"
echo "  Keyword '$KEYWORD' found: $COUNT time(s)"
echo ""

if [ $COUNT -gt 0 ]; then
    echo "  Last 5 matching lines:"
    echo "  ----------------------------------------------------------------"

    # Array slicing: show only the last 5 matches
    TOTAL=${#MATCH_LINES[@]}
    START=$(( TOTAL > 5 ? TOTAL - 5 : 0 ))

    for (( i=START; i<TOTAL; i++ )); do
        # Show max 100 characters per line so it fits on screen
        DISPLAY="${MATCH_LINES[$i]:0:100}"
        echo "  [$(( i - START + 1 ))] $DISPLAY"
    done
else
    echo "  No matches found for '$KEYWORD'."
    echo "  Try: $0 $LOGFILE warning"
fi

echo ""
echo "================================================================"
