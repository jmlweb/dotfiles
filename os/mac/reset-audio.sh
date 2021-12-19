#!/usr/bin/env bash

# Ask for the administrator password upfront
sudo -v

# Delete all files (not directories)
sudo find /Library/Preferences/Audio -type f -delete

rm ~/Library/Preferences/com.apple.audio.AudioMIDISetup.plist