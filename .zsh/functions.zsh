mkcd() {
  mkdir -p "$1" && cd "$1"
}

pid() {
  lsof -i :"$1"
}
