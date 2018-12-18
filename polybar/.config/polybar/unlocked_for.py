#!/usr/bin/env python3

# import ntfy
import subprocess
from datetime import datetime


def unlocked_minutes():
    p = subprocess.run(['xscreensaver-command', '-time'], stdout=subprocess.PIPE)
    words = p.stdout.decode().split()
    unlock = ' '.join(words[6:10])
    current = datetime.now()

    FMT = '%b %d %H:%M:%S %Y'
    tdelta = current - datetime.strptime(unlock, FMT)
    duration = int(tdelta.seconds / 60)

    # if duration % 30 == 0:
    #     ntfy.backends.default.notify(
    #         title='STAND UP!',
    #         message='You\'ve been sitting in front of a screen for 30 minutes! Stand up, walk around!'
    #     )

    return duration


print('{} min'.format(unlocked_minutes()))
