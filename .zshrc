# Path to your oh-my-zsh installation.
export ZSH="/home/lialka/.oh-my-zsh"
export PATH=$HOME/bin:/usr/local/bin:$PATH

# Config aliases
alias zshconfig="vim ~/.zshrc"
alias vimconfig="vim ~/.vimrc"

# Custom aliases
alias gs="git status"
alias glog="git log --all --graph --decorate --pretty=oneline"
alias v="vim"
alias mv="mv -i"    # prompt before overwrite

# Aliases for projects
alias dev="cd ~/dev"

# Set theme
ZSH_THEME="robbyrussell"

# Uncomment the following line if you want to disable marking untracked files
# under VCS as dirty. This makes repository status check for large repositories
# much, much faster.
DISABLE_UNTRACKED_FILES_DIRTY="true"

# Load plugins
plugins=(
    git
    sudo
    debian
    web-search
)

source $ZSH/oh-my-zsh.sh

# Preferred editor for local and remote sessions
if [[ -n $SSH_CONNECTION ]]; then
  export EDITOR='vim'
else
  export EDITOR='mvim'
fi

# SSH with GPG
gpgconf --launch gpg-agent
export SSH_AUTH_SOCK=$(gpgconf --list-dirs agent-ssh-socket)

