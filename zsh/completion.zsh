# matches case insensitive for lowercase
zstyle ':completion:*' matcher-list 'm:{a-z}={A-Z}'

# pasting with tabs doesn't perform completion
zstyle ':completion:*' insert-tab pending

# don't expand aliases *before* completion has finished
#   like: git comm-[tab]
setopt complete_aliases
