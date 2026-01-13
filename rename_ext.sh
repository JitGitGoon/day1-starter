#!/usr/bin/env bash
# replace spaces with underscores in filenames in the current directory
for f in *\ *; do
  [ -e "$f" ] || continue
  mv "$f" "${f// /_}"
done
