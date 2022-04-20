# Aliases
alias v="nvim $1"
alias xrandr-left="xrandr --output DP-1-2 --mode 1920x1080 --left-of eDP-1"
alias xrandr-right="xrandr --output DP-1-2 --mode 1920x1080 --right-of eDP-1"
alias bluet="bluetoothctl"
alias gst="git status"
alias glo="git log --graph --decorate --oneline"
alias config='/usr/bin/git --git-dir=/home/jaro/.dotfiles/ --work-tree=/home/jaro'
alias fcopy='fzf | xclip -selection clipboard'
alias vfind='nvim $(fzf)'
alias l='ls -l'
alias la='ls -la'

###############################################################################
#####                                                                     #####
#####                          	  CONFIGURATION                           #####
#####                                                                     #####
###############################################################################

# Antibody
source <(antibody init)
antibody bundle < ~/.zsh_plugins.txt

# Spaceship configuration
zstyle :compinstall filename '/home/jaro/.zshrc'
autoload -Uz compinit
compinit
fpath=($fpath "/home/jaro/.zfunctions")
export SPACESHIP_GCLOUD_SHOW=false

# Zsh
zstyle ':completion:*' menu select

# NVM
export NVM_DIR="$([ -z "/home/jaro" ] && printf %s "/home/jaro/.nvm" || printf %s "/home/jaro/.nvm")"
[ -s "$NVM_DIR/nvm.sh" ] && \. "$NVM_DIR/nvm.sh" # This loads nvm

# place this after nvm initialization!
autoload -U add-zsh-hook
load-nvmrc() {
  local node_version="$(nvm version)"
  local nvmrc_path="$(nvm_find_nvmrc)"

  if [ -n "$nvmrc_path" ]; then
    local nvmrc_node_version=$(nvm version "$(cat "${nvmrc_path}")")

    if [ "$nvmrc_node_version" = "N/A" ]; then
      nvm install
    elif [ "$nvmrc_node_version" != "$node_version" ]; then
      nvm use
    fi
  elif [ "$node_version" != "$(nvm version default)" ]; then
    echo "Reverting to nvm default version"
    nvm use default
  fi
}
add-zsh-hook chpwd load-nvmrc
load-nvmrc

export PROMPT_COMMAND=enter_directory

# ANDROID STUDIO
export ANDROID_HOME=$HOME/Android/Sdk
export PATH=$PATH:$ANDROID_HOME/emulator
export PATH=$PATH:$ANDROID_HOME/tools
export PATH=$PATH:$ANDROID_HOME/tools/bin
export PATH=$PATH:$ANDROID_HOME/platform-tools
##

# The next line updates PATH for the Google Cloud SDK.
if [ -f '/home/ariagroult/google-cloud-sdk/path.zsh.inc' ]; then . '/home/ariagroult/google-cloud-sdk/path.zsh.inc'; fi


# The next line enables shell command completion for gcloud.
if [ -f '/home/ariagroult/google-cloud-sdk/completion.zsh.inc' ]; then . '/home/ariagroult/google-cloud-sdk/completion.zsh.inc'; fi

export GOOGLE_APPLICATION_CREDENTIALS=/home/jaro/.config/gcloud/legacy_credentials/ariagroult@luckycart.com/adc.json

# Set Spaceship ZSH as a prompt
autoload -U promptinit; promptinit
prompt spaceship

# FZF
# Setting fd as the default source for fzf
export FZF_DEFAULT_COMMAND='fd --type f'
# To apply the command to CTRL-T as well
export FZF_CTRL_T_COMMAND="$FZF_DEFAULT_COMMAND"
# Customize default fzf command
export FZF_DEFAULT_COMMAND='fd --type f --hidden --follow --exclude .git'
