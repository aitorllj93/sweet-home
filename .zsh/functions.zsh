mkcd() {
  mkdir -p "$1" && cd "$1"
}

pid() {
  lsof -i :"$1"
}

goto() {
  local target="$1"
  local base_dirs=(
    "$HOME/Projects/Active"
    "$HOME/Projects/Maintenance"
    "$HOME/Projects/Experiments"
    "$HOME/Services"
    "$HOME/Extensions/vscode"
  )

  for base in "${base_dirs[@]}"; do
    if [[ -d "$base/$target" ]]; then
      cd "$base/$target"
      return 0
    fi
  done

  if [[ -z "$target" ]]; then
    cd "$HOME"
  else
    echo "goto: could not find '$target' in any project directory" >&2
    return 1
  fi
}

hack() {
  local target="$1"
  local base_dirs=(
    "$HOME/Projects/Active"
    "$HOME/Projects/Maintenance"
    "$HOME/Projects/Experiments"
    "$HOME/Services"
    "$HOME/Extensions/vscode"
  )

  local workspace_root="$HOME/Projects"

  if [[ -z "$target" ]]; then
    code "$HOME"
    return 0
  fi

  local workspace_file="$workspace_root/$target.code-workspace"

  if [[ -f "$workspace_file" ]]; then
    code "$workspace_file"
    return 0
  fi

  for base in "${base_dirs[@]}"; do
    if [[ -d "$base/$target" ]]; then
      code "$base/$target"
      return 0
    fi
  done

  echo "hack: could not find '$target' in any project directory or workspace" >&2
  return 1

}

show() {
  local target="$1"
  local base_dirs=(
    "$HOME/Projects/Active"
    "$HOME/Projects/Maintenance"
    "$HOME/Projects/Experiments"
    "$HOME/Services"
    "$HOME/Extensions/vscode"
  )

  for base in "${base_dirs[@]}"; do
    if [[ -d "$base/$target" ]]; then
      open "$base/$target"
      return 0
    fi
  done

  if [[ -z "$target" ]]; then
    open "$HOME"
  else
    echo "show: could not find '$target' in any project directory" >&2
    return 1
  fi

}

# Converts a given image to grayscale using imagemagick
grayscale() {
  local MAGICK=$(which magick)

  for f in "$@"
  do
    local dir=$(dirname "$f")
    local filename=$(basename "$f")
    local name="${filename%.*}"
    local ext="${filename##*.}"

    local output="$dir/${name}_grayscale.$ext"

    "$MAGICK" "$f" -colorspace Gray "$output"
  done
}