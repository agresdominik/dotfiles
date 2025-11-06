# Oh my zsh 
export ZSH="$HOME/.oh-my-zsh"
ZSH_THEME="eastwood"
HIST_STAMPS="dd.mm.yyyy"
plugins=(git sudo)
source $ZSH/oh-my-zsh.sh

# -- Linux Specific --

if [[ -z $DISPLAY ]] && [[ $(tty) == /dev/tty1 ]]; then
    startx
fi



# -- Local Setup ---

# Preferred editor for local and remote sessions
if [[ -n $SSH_CONNECTION ]]; then
   export EDITOR='nvim'
 else
   export EDITOR='nvim'
 fi


# -- Env Paths ---

# go
#export PATH=/usr/local/go/bin:$PATH

# pyenv 
#export PYENV_ROOT="$HOME/.pyenv"
#export PATH="$PYENV_ROOT/bin:$PATH"
#eval "$(pyenv init --path)"
#eval "$(pyenv init -)"

# pipx
#export PATH="$PATH:/Users/agres/.local/bin"
#export PATH="$HOME/.local/bin:$PATH"
# pipx Linux
export PATH="$HOME/.local/bin:$PATH"


# bun
#[ -s "/Users/agres/.bun/_bun" ] && source "/Users/agres/.bun/_bun"
#export BUN_INSTALL="$HOME/.bun"
#export PATH="$BUN_INSTALL/bin:$PATH"

# -- Customization --

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

# Alias: wifi to print qr code in terminal from file (device adjustable)
alias wifi='cat /Users/agres/Projects/python_lang/wifi_qr/wifi_password.txt | qr --asci'

# Alias: connect and disconnect bluetooth headphones
alias airpods-connect='echo -e "connect 80:95:3A:DC:8E:41" | bluetoothctl >> /dev/null'
alias airpods-disconnect='echo -e "disconnect 80:95:3A:DC:8E:41" | bluetoothctl >> /dev/null'
alias airpods='echo -e "select 12:34:56:78:9A:BC\ninfo 80:95:3A:DC:8E:41" | bluetoothctl | grep "Connected: "'

# Alias: avoid nano
alias nano=nvim

# Alias quick mount network smdb drive
alias md0='sudo mount --mkdir -t cifs //192.168.0.200/MD0 /mnt/md0 -o username=agres'

