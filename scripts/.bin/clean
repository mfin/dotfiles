#!/bin/bash

# This script is designed to help you clean your computer from unneeded
# packages. The script will find all packages that no other installed package
# depends on. It will output this list of packages excluding any you have
# placed in the ignore list. You may browse through the script's output and
# remove any packages you do not need.

# Enter groups and packages here which you know you wish to keep. They will
# not be included in the list of unrequired packages later.
ignoregrp="base base-devel"
ignorepkg=""

comm -23 <(pacman -Qqt | sort) <(echo $ignorepkg | tr ' ' '\n' | cat <(pacman -Sqg $ignoregrp) - | sort -u)
