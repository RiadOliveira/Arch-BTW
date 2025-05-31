#!/bin/bash

CONFIG_DIR="./config"

copy_to_target() {
  local source_path="$1"
  local target_base="$2"

  mkdir -p "$target_base"
  cp -r "$source_path/"* "$target_base/"
}

for encoded_path in "$CONFIG_DIR"/*; do
  [ -d "$encoded_path" ] || continue

  folder_name=$(basename "$encoded_path")
  decoded_path=$(echo "$folder_name" | sed 's/;/\//g')

  # ~/ (home) path handling
  if [[ "$decoded_path" == home/* ]]; then
    for user_dir in /home/*; do
      [ -d "$user_dir" ] || continue

      user_name=$(basename "$user_dir")
      user_subpath=$(echo "$decoded_path" | sed "s|home/[^/]*/||")
      user_path="$user_dir/$user_subpath"

      copy_to_target "$encoded_path" "$user_path"
    done
  else
    target_path="/$decoded_path"
    copy_to_target "$encoded_path" "$target_path"
  fi
done
