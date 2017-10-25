#!/bin/bash

BACKUP_RUNNING=$(systemctl status borg-backup.service | grep 'active (running)')

if [ "$BACKUP_RUNNING" != "" ]; then
    echo "backup running!"
fi