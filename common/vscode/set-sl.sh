#!/usr/bin/env bash

SCRIPT_DIR="$(cd "$(dirname "$0")" && pwd)"

ln -si "$SCRIPT_DIR/settings.json" ~/.config/Code/User/settings.json
