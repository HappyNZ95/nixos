#!/usr/bin/env bash

file=$(find ~/sync-vault -type f -print | xargs -d '\n' -I{} basename "{}" | fuzzel -d)
[ -z "$file" ] && exit
fullpath=$(find ~/sync-vault -type f -name "$file" -print -quit)
[ -z "$fullpath" ] && exit
ghostty nvim "$fullpath"

