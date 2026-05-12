for file (~/.zsh/*.zsh(N)); do
  [[ "$file" == "$HOME/.zsh/autoload.zsh" ]] && continue
  source "$file"
done