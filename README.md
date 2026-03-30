# OSS Audit — VLC Media Player
### Open Source Software Capstone Project | VITyarthi

---

## Student Information

| Field | Details |
|---|---|
| **Student Name** | Tatikonda Aditya |
| **Registration Number** | 24BCE11182 |
| **Chosen Software** | VLC Media Player |
| **Licence of Software** | LGPL v2.1 (core libraries) / GPL v2 (player) |
| **Course** | Open Source Software (OSS NGMC) |

---

## About This Project

This repository is the complete submission for the Open Source Audit
capstone project. The chosen open-source software is **VLC Media Player**
— the free and open source multimedia player built by students at
École Centrale Paris in 2001 and maintained by the nonprofit
VideoLAN organization.

VLC was chosen because its origin story is a perfect example of
open source philosophy in action — students who simply wanted to
stream campus TV built something that has now been downloaded over
4 billion times, with no ads, no premium version, and no corporate
owner. It is governed entirely by a nonprofit and the global
open-source community.

The repository contains five shell scripts and a written project
report covering Units 1–5 of the course.

---

## Repository Structure
```
oss-audit-24BCE11182/
│
├── README.md                              ← This file
│
├── scripts/
│   ├── script1_system_identity.sh         ← System Identity Report
│   ├── script2_package_inspector.sh       ← FOSS Package Inspector
│   ├── script3_disk_permission_auditor.sh ← Disk & Permission Auditor
│   ├── script4_log_analyzer.sh            ← Log File Analyzer
│   └── script5_manifesto_generator.sh     ← Open Source Manifesto Generator
│
└── OSS_Audit_VLC_Report.pdf               ← Project report
```

---

## Script Descriptions

### Script 1 — System Identity Report
**File:** `script1_system_identity.sh`

Displays a formatted welcome screen showing the current Linux
system's identity including distribution name, kernel version,
logged-in user, home directory, system uptime, current date/time,
and the open-source licenses covering both the OS and VLC.

**Shell concepts:** Variables, command substitution `$()`,
`echo` formatting, `cat /etc/os-release`, `grep`, `cut`, `date`,
`uname`, `whoami`

---

### Script 2 — FOSS Package Inspector
**File:** `script2_package_inspector.sh`

Checks whether the `vlc` package is installed on the system.
Supports both RPM-based (Fedora, CentOS) and Debian-based
(Ubuntu, Debian) distributions. Displays version, license, and
package summary. Uses a `case` statement to print philosophy notes
about VLC and other well-known open-source packages.

**Shell concepts:** `if-then-else`, `case` statement, `dpkg -l`,
`rpm -qi`, `grep -E`, `command -v`, pipe chaining, `&>/dev/null`

---

### Script 3 — Disk and Permission Auditor
**File:** `script3_disk_permission_auditor.sh`

Loops through an array of important system directories (`/etc`,
`/var/log`, `/home`, `/usr/bin`, `/tmp`, `/var`, `/opt`) and
reports permissions, owner, group, and disk usage for each. Also
specifically audits VLC's user config directory and library
directory.

**Shell concepts:** Array declaration, `for` loop over array,
`[ -d ]` directory test, `ls -ld`, `awk`, `du -sh`, `cut`,
`printf` for formatted output, `2>/dev/null`

---

### Script 4 — Log File Analyzer
**File:** `script4_log_analyzer.sh`

Reads a log file line by line and counts how many lines contain
a given keyword (default: `error`, case-insensitive). Prints the
last 5 matching lines. Implements a do-while style retry mechanism
to automatically try fallback log file locations if the specified
file is not found.

**Shell concepts:** Command-line arguments (`$1`, `$2`), default
value assignment (`${2:-"error"}`), `while IFS= read -r` loop,
`if-then` inside loop, counter variable `$(( ))`, bash array
with `+=`, array slicing, do-while simulation with flag variable,
`exit` codes

---

### Script 5 — Open Source Manifesto Generator
**File:** `script5_manifesto_generator.sh`

Interactively asks the user three questions and composes a
personalised open-source philosophy statement using their answers.
Saves the manifesto to a `.txt` file named after the current user
and displays it on screen.

**Shell concepts:** `read -p` for interactive input, string
interpolation in `echo`, file writing with `>` and `>>`, `date`
command, `whoami`, input validation with `[ -z ]`, function
definition as alias pattern, `cat` for output display

---

## How to Run the Scripts

### Prerequisites
- A Linux system (physical, VM, WSL2, or browser-based like KillerCoda)
- Bash shell version 4.0 or later
- For Script 2: `dpkg` (Debian/Ubuntu) or `rpm` (Fedora/RHEL)
- For Script 4: a readable log file

### Step 1 — Clone the repository
```bash
git clone https://github.com/tatikonda24bce11182/oss-audit-24BCE11182.git
cd oss-audit-24BCE11182
```

### Step 2 — Make scripts executable
```bash
chmod +x scripts/*.sh
```

### Step 3 — Run each script

**Script 1 — System Identity Report**
```bash
./scripts/script1_system_identity.sh
```

---

**Script 2 — FOSS Package Inspector**

Install VLC first, then run:
```bash
# Ubuntu/Debian
sudo apt install vlc -y

./scripts/script2_package_inspector.sh
```

---

**Script 3 — Disk and Permission Auditor**
```bash
./scripts/script3_disk_permission_auditor.sh

# Some directories may need sudo for size reporting:
sudo ./scripts/script3_disk_permission_auditor.sh
```

---

**Script 4 — Log File Analyzer**
```bash
# Default keyword 'error'
./scripts/script4_log_analyzer.sh /var/log/syslog

# Custom keyword
./scripts/script4_log_analyzer.sh /var/log/syslog warning

# On Fedora/CentOS
./scripts/script4_log_analyzer.sh /var/log/messages error
```

---

**Script 5 — Manifesto Generator**
```bash
./scripts/script5_manifesto_generator.sh
```
Interactive — the script will prompt you for three answers.
Your manifesto is saved as `manifesto_tatikonda24bce11182.txt`.

---

## Dependencies

| Dependency | Used In | How to Install |
|---|---|---|
| `bash` (v4+) | All scripts | Pre-installed on all Linux distros |
| `vlc` | Script 2, 3 | `sudo apt install vlc` |
| `dpkg` or `rpm` | Script 2 | Pre-installed on respective distros |
| `awk`, `grep`, `cut`, `du`, `ls` | Scripts 1–4 | GNU coreutils — pre-installed |
| `uname`, `whoami`, `uptime`, `date` | Script 1 | Pre-installed on all POSIX systems |

---

## Tested On

- Ubuntu 24.04 LTS (KillerCoda playground)

---

## Academic Integrity

All written content in the project report is the original work
of the student. Shell scripts were written and tested by the
student on Ubuntu 24.04 LTS via KillerCoda.

---

## Licence

The shell scripts in this repository are released under the
**MIT Licence** — in the spirit of the open-source values
explored in this project.
```
MIT License — Copyright (c) 2026 Tatikonda Aditya
Permission is granted to use, copy, modify, and distribute
this software for any purpose, with or without modification.
```
