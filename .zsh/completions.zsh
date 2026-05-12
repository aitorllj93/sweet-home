_project_completions() {
  local base_dirs=(
    "$HOME/Projects/Active"
    "$HOME/Projects/Maintenance"
    "$HOME/Projects/Experiments"
    "$HOME/Services"
    "$HOME/Extensions/vscode"
  )

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

  compadd -l -d descs -a projects
}

compdef _project_completions goto
compdef _project_completions hack
compdef _project_completions show