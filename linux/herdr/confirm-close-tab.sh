#!/bin/bash
read -r -n 1 -p "Close this tab? [y/N] " ans
echo
[[ "$ans" =~ ^[Yy]$ ]] && herdr tab close "$HERDR_ACTIVE_TAB_ID"
