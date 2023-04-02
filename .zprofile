
export STARSHIP_CONFIG=/Users/thoreg/.config/starship.toml
export PYENV_ROOT="$HOME/.pyenv"
export PATH="$PYENV_ROOT/bin:$PATH"

eval "$(pyenv init --path)"

eval "$(/opt/homebrew/bin/brew shellenv)"
