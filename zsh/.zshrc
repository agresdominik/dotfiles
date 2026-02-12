# Oh my zsh 
export ZSH="$HOME/.oh-my-zsh"
ZSH_THEME="eastwood"
HIST_STAMPS="dd.mm.yyyy"
plugins=(git sudo)

# Load sources
source $ZSH/oh-my-zsh.sh

case "$HOST" in 
    arch) source ~/.zshrc_arch ;;
    fedora-mac) source ~/.zshrc_fedora ;;
esac

source /usr/share/fzf/key-bindings.zsh
source /usr/share/fzf/completion.zsh

# Preferred editor for local and remote sessions
if [[ -n $SSH_CONNECTION ]]; then
   export EDITOR='nvim'
 else
   export EDITOR='nvim'
 fi

# Alais: ls to run tree (without any flags)
unalias ls 2>/dev/null 
ls() {
  if [[ $# -eq 0 ]]; then
    tree -L 1
  else
    command ls -G "$@"
  fi
}

# Alias: list all modified and new files in current directory 
alias lsgit='git status --porcelain | cut -c 4- | xargs ls -l'

# Bluetooth headphones
alias airpods-connect='echo -e "connect 80:95:3A:DC:8E:41" | bluetoothctl >> /dev/null'
alias airpods-disconnect='echo -e "disconnect 80:95:3A:DC:8E:41" | bluetoothctl >> /dev/null'
alias airpods='echo -e "info 80:95:3A:DC:8E:41" | bluetoothctl | grep "Connected: "'

# Alias: avoid nano
alias nano=nvim

# Alias quick mount network smdb drive
alias md0='sudo mount --mkdir -t cifs //192.168.0.200/MD0 /mnt/md0 -o username=agres,uid=$(id -u),gid=$(id -g)'

# Load ssh keys in terminal
alias loadssh='eval "$(ssh-agent -s)" && ssh-add ~/.ssh/id_ed25519'

# Tmux aliases
alias ta='tmux attach -t'
alias tn='tmux new -s'
alias tl='tmux ls'
alias tk='tmux kill-session -t'

export GPG_TTY=$(tty)

# Fix unreadable color pallete for ExFat File systems
LS_COLORS="$LS_COLORS:ow=01;36:"
export LS_COLORS
