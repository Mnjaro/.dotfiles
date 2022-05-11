# Aliases
alias v="nvim $1"
alias xrandr-left="xrandr --output DP-1-2 --mode 1920x1080 --left-of eDP-1"
alias xrandr-right="xrandr --output DP-1-2 --mode 1920x1080 --right-of eDP-1"
alias bluet="bluetoothctl"
alias gst="git status"
alias glo="git log --graph --decorate --oneline"
alias config='/usr/bin/git --git-dir=/home/jaro/.cfg/ --work-tree=/home/jaro'
alias fcopy='fzf | xclip -selection clipboard'
alias vfind='nvim $(fzf)'
alias l='ls -l'
alias la='ls -la'
alias colorpicker='grim -g "$(slurp -p)" -t ppm - | convert - -format "%[pixel:p{0,0}]" txt:-'

###############################################################################
#####                                                                     #####
#####                          	  CONFIGURATION                           #####
#####                                                                     #####
###############################################################################

# Antibody
source <(antibody init)
antibody bundle < ~/.zsh_plugins.txt

# Zsh
zstyle ':completion:*' menu select
export LC_CTYPE=en_US.UTF-8
export SPACESHIP_GCLOUD_SHOW=false

# NVM
export NVM_DIR="$([ -z "/home/jaro" ] && printf %s "/home/jaro/.nvm" || printf %s "/home/jaro/.nvm")"
[ -s "$NVM_DIR/nvm.sh" ] && \. "$NVM_DIR/nvm.sh" # This loads nvm

export PROMPT_COMMAND=enter_directory

# ANDROID STUDIO
export ANDROID_HOME=$HOME/Android/Sdk
export PATH=$PATH:$ANDROID_HOME/emulator
export PATH=$PATH:$ANDROID_HOME/tools
export PATH=$PATH:$ANDROID_HOME/tools/bin
export PATH=$PATH:$ANDROID_HOME/platform-tools
##


# FZF
# Setting fd as the default source for fzf
export FZF_DEFAULT_COMMAND='fd --type f'
# To apply the command to CTRL-T as well
export FZF_CTRL_T_COMMAND="$FZF_DEFAULT_COMMAND"
# Customize default fzf command
export FZF_DEFAULT_COMMAND='fd --type f --hidden --follow --exclude .git'

# Google cloud sdk
# The next line enables shell command completion for gcloud.
if [ -f '/home/jaro/dev/google-cloud-sdk/completion.zsh.inc' ]; then . '/home/jaro/dev/google-cloud-sdk/completion.zsh.inc'; fi

# Uncommited variables
source ~/.zshrc_not_commited

# SSH Agent related
# Necessary for the systemd service to work
export SSH_AUTH_SOCK="$XDG_RUNTIME_DIR/ssh-agent.socket"
