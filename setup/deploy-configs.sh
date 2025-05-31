#!/bin/bash
set -e

CONFIG_DIR="$(dirname "$(realpath "$0")")/../config"

convert_path() {
  local folder_path="$1"
  local system_path=""
  
  system_path="/${folder_path//;/\/}"
  system_path="${system_path//\/home\/user\//\/home\/$NEW_USER\/}"
  
  echo "$system_path"
}

deploy_configs() {
  find "$CONFIG_DIR" -type f | while read -r file; do
    local relative_path="${file#$CONFIG_DIR/}"
    
    local directory_path=$(dirname "$relative_path")
    local filename=$(basename "$file")
    local system_path=$(convert_path "$directory_path")

    mkdir -p "$system_path"
    cp "$file" "$system_path/$filename"
    
    if [[ "$system_path" == /home/$NEW_USER* ]]; then
      chown "$NEW_USER:users" "$system_path/$filename"
      chmod 644 "$system_path/$filename"
    else
      chown root:root "$system_path/$filename"
      chmod 644 "$system_path/$filename"
    fi
  done
}

deploy_configs
