_project_completions() {
  local include_workspaces="$1"

  local base_dirs=(
    "$HOME/Projects/Active"
    "$HOME/Projects/Maintenance"
    "$HOME/Projects/Experiments"
    "$HOME/Services"
    "$HOME/Extensions/vscode"
  )

  local workspace_root="$HOME/Projects"

  local -a projects descs

  for base in "${base_dirs[@]}"; do
    [[ -d "$base" ]] || continue

    for dir in "$base"/*(N/); do
      local name="${dir:t}"
      local desc=""

      if [[ -f "$dir/package.json" ]]; then
        desc=$(jq -r '.description // empty' "$dir/package.json" 2>/dev/null)
      fi

      if [[ -z "$desc" && -f "$dir/README.md" ]]; then
        desc=$(grep -m1 -v '^\s*#\|^\s*$' "$dir/README.md" 2>/dev/null | head -c 60)
      fi

      projects+=("$name")
      descs+=("$name: ${desc:-$dir}")
    done
  done

  if [[ "$include_workspaces" == "with-workspaces" && -d "$workspace_root" ]]; then
    for ws in "$workspace_root"/*.code-workspace(N); do
      local file="${ws:t}"
      local name="${file:r}"

      projects+=("$name")
      descs+=("$name: VSCode Workspace")
    done
  fi

  compadd -l -d descs -a projects
}

_project_completions_default() {
  _project_completions
}

_project_completions_with_workspaces() {
  _project_completions with-workspaces
}

compdef _project_completions_default goto
compdef _project_completions_with_workspaces hack
compdef _project_completions_default show