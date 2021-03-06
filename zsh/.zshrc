autoload -Uz compinit promptinit; compinit; promptinit

# History
HISTSIZE=1000
SAVEHIST=1000
HISTFILE=~/.history

# Case insensitive matching
zstyle ':completion:*' matcher-list 'm:{a-zA-Z}={A-Za-z}'

# Functions
dotenv () {
    set -a
    [[ -f .env ]] && source .env
    set +a
}

update_zsh_plugins () {
    antibody bundle < ~/.zsh_plugins.txt > ~/.zsh_plugins.sh
    antibody update
}

update_brew () {
    brew update
    brew upgrade
    brew doctor
}


# Automatic rehashing. This solves the problem of new binaries
# in the $PATH not being detected automatically.
zstyle ':completion:*' rehash true

# ~/.zshrc
source ~/.zsh_plugins.sh

# Aliases
if [[ -r ~/.aliasrc ]]; then
    . ~/.aliasrc
fi

# Dinghy
if [ -x "$(command -v dinghy)" ]; then
    eval $(dinghy env)
fi

# Exports
export EDITOR="nano"
export GOPATH="$HOME/go"

# phpStorm settings
export XDEBUG_CONFIG="idekey=PHPSTORM"
export PHP_IDE_CONFIG="serverName=0.0.0.0"

# Longer AWS sessions
export AWS_SESSION_TTL=10h
export AWS_ASSUME_ROLE_TTL=10h

# Turning off functionality
unset AUTO_CD
