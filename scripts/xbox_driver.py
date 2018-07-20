#!/usr/bin/env python3
"""

Runs the xbox driver, autorestarting

"""

import subprocess
import time

driver_command = "sudo xboxdrv > /tmp/controller.log"

def runcmd(cmd):
    return subprocess.run(['/bin/bash', '-c', cmd]).returncode

time_wait = 1.0

while True:
    print("Running another driver...")
    runcmd(driver_command)
    time.sleep(time_wait)
