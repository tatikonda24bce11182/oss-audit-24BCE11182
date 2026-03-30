#!/bin/bash
# ============================================================
# Script 5: Open Source Manifesto Generator
# Author: Tatikonda Aditya | Reg No: 24BCE11182
# Course: Open Source Software | OSS NGMC Capstone Project
# Description: Asks 3 questions, writes a personalised open
#              source philosophy statement to a .txt file.
# ============================================================

# ============================================================
# ALIAS CONCEPT — shown via helper functions
# In a real terminal: alias cls='clear' creates a shortcut
# Here we define functions that work the same way
# ============================================================
print_divider() {
    echo "================================================================"
}

print_section() {
    echo ""
    echo "  --- $1 ---"
    echo ""
}

# ============================================================
# Welcome screen
# ============================================================
clear
print_divider
echo "        Open Source Manifesto Generator                        "
print_divider
echo ""
echo "  Answer 3 questions to generate your open source manifesto."
echo ""
print_divider
echo ""

# ============================================================
# read -p : asks the user a question and stores their answer
# -p means show this text as the prompt
# ============================================================
read -p "  1. Name one open-source tool you use every day: " TOOL
echo ""
read -p "  2. In one word, what does 'freedom' mean to you? " FREEDOM
echo ""
read -p "  3. Name one thing you would build and share freely: " BUILD
echo ""

# ============================================================
# Input validation: make sure user didn't leave anything blank
# -z checks if a variable is empty (zero length)
# ============================================================
if [ -z "$TOOL" ] || [ -z "$FREEDOM" ] || [ -z "$BUILD" ]; then
    echo "  ERROR: Please answer all three questions."
    exit 1
fi

# ============================================================
# Setup output file
# whoami gets current username for the filename
# ============================================================
DATE=$(date '+%d %B %Y')
TIME=$(date '+%H:%M')
USERNAME=$(whoami)
OUTPUT="manifesto_${USERNAME}.txt"

# ============================================================
# Write manifesto to file
# > creates/overwrites the file
# >> appends (adds to end without deleting what's there)
# ============================================================
echo "OPEN SOURCE MANIFESTO" > "$OUTPUT"
echo "Generated on $DATE at $TIME by $USERNAME" >> "$OUTPUT"
echo "================================================================" >> "$OUTPUT"
echo "" >> "$OUTPUT"
echo "I am a student of open source — not just of its code, but of" >> "$OUTPUT"
echo "its values. Every day I use $TOOL, built by people I have never" >> "$OUTPUT"
echo "met, who chose to share their work freely with the world." >> "$OUTPUT"
echo "" >> "$OUTPUT"
echo "To me, freedom means $FREEDOM. Open source is exactly that —" >> "$OUTPUT"
echo "not just software you can download for free, but software you" >> "$OUTPUT"
echo "can read, question, improve, and pass on. VLC taught me this." >> "$OUTPUT"
echo "Students in Paris built a media player for their campus network" >> "$OUTPUT"
echo "and gave it to the world. Four billion downloads later, it still" >> "$OUTPUT"
echo "has no ads, no premium plan, no corporate owner pulling the strings." >> "$OUTPUT"
echo "" >> "$OUTPUT"
echo "One day I want to build $BUILD and release it freely. Not because" >> "$OUTPUT"
echo "I have to, but because I understand now what it means to inherit" >> "$OUTPUT"
echo "a world built by people who shared. The least I can do is add" >> "$OUTPUT"
echo "my small piece to that foundation." >> "$OUTPUT"
echo "" >> "$OUTPUT"
echo "                              — $USERNAME, $DATE" >> "$OUTPUT"
echo "================================================================" >> "$OUTPUT"

# ============================================================
# Show result on screen
# cat prints file contents to terminal
# ============================================================
print_divider
echo "  Manifesto saved to: $OUTPUT"
print_divider
echo ""
cat "$OUTPUT"
echo ""
print_divider
