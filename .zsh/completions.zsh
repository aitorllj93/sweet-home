_project_completions() {
  local base_dirs=(
    "$HOME/Projects/Active"
    "$HOME/Projects/Maintenance"
    "$HOME/Projects/Experiments"
    "$HOME/Services"
    "$HOME/Extensions/vscode"
  )
  local projects=()
  for base in "${base_dirs[@]}"; do
    [[ -d "$base" ]] && projects+=("$base"/*(N:t))
  done
  compadd -U -a projects
}

compdef _project_completions goto
compdef _project_completions hack
compdef _project_completions show