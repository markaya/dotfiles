#!/bin/bash
read -r -n 1 -p "Close this pane? [y/N] " ans
echo
[[ "$ans" =~ ^[Yy]$ ]] && herdr pane close "$HERDR_ACTIVE_PANE_ID"
