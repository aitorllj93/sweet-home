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

  for base in "${base_dirs[@]}"; do
    if [[ -d "$base/$target" ]]; then
      code "$base/$target"
      return 0
    fi
  done

  if [[ -z "$target" ]]; then
    code "$HOME"
  else
    echo "hack: could not find '$target' in any project directory" >&2
    return 1
  fi

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