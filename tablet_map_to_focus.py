#!/bin/env python3

import os
import subprocess
import sys

if len(sys.argv) != 2:
    print("Supply the tablet name as first argument! (Eg. wacom-intuos-s-pen)")
    exit(1)

tablet = sys.argv[1]
hypr_instance = os.environ["HYPRLAND_INSTANCE_SIGNATURE"]
p = subprocess.Popen(
    ["socat", "-U", "-", f"UNIX-CONNECT:/tmp/hypr/{hypr_instance}/.socket2.sock"],
    text=True,
    stdout=subprocess.PIPE,
)
try:
    assert p.stdout
    while s := p.stdout.readline():
        command, args = s.split(">>")
        if command == "focusedmon":
            mon = args.split(",")[0]
            subprocess.check_call(
                f"hyprctl keyword device:{tablet}:output {mon}".split(),
                stdout=subprocess.DEVNULL
            )
finally:
    p.kill()
    p.wait()
