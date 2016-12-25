#Path to your oh-my-zsh configuration.
ZSH=$HOME/.oh-my-zsh
 
# Set name of the theme to load.
# # Look in ~/.oh-my-zsh/themes/
# # Optionally, if you set this to "random", it'll load a random theme each
# # time that oh-my-zsh is loaded.
ZSH_THEME="random"

#sample aliases
 # alias zshconfig="mate ~/.zshrc"
 # # alias ohmyzsh="mate ~/.oh-my-zsh"
 #  
 #  # Set to this to use case-sensitive completion
 #  # CASE_SENSITIVE="true"
 #   
 #   # Comment this out to disable weekly auto-update checks
 #   # DISABLE_AUTO_UPDATE="true"
 #    
 #    # Uncomment following line if you want to disable colors in ls
 #    # DISABLE_LS_COLORS="true"
 #     
 #     # Uncomment following line if you want to disable autosetting terminal title.
 #     # DISABLE_AUTO_TITLE="true"
 #      
 #      # Uncomment following line if you want red dots to be displayed while waiting for completion
COMPLETION_WAITING_DOTS="true" 




#want your terminal to support 256 color schemes? I do ...
export TERM="xterm-256color"
#
# # if you do a 'rm *', Zsh will give you a sanity check!
 setopt RM_STAR_WAIT
#
# # allows you to type Bash style comments on your command line
# # good 'ol Bash
setopt interactivecomments
#
# # Zsh has a spelling corrector
setopt CORRECT

plugins=(git zsh-autosuggestions zsh-syntax-highlighting z)
 
source $ZSH/oh-my-zsh.sh
 
# Customize to your needs...
export PATH=/usr/bin:/bin:/usr/sbin:/sbin:/usr/local/bin:/usr/X11/bin:/usr/local/git/bin:/opt/local/bin
ZSH_THEME_GIT_PROMPT_PREFIX=" on %{$fg[magenta]%}"
ZSH_THEME_GIT_PROMPT_SUFFIX="%{$reset_color%}"
ZSH_THEME_GIT_PROMPT_DIRTY="%{$fg[green]%}!"
ZSH_THEME_GIT_PROMPT_UNTRACKED="%{$fg[green]%}?"
ZSH_THEME_GIT_PROMPT_CLEAN=""


# -------------------------------------------------------------------
# Git aliases
# -------------------------------------------------------------------
 
alias ga='git add -A'
alias gp='git push'
alias gl='git log'
alias gs='git status'
alias gd='git diff'
alias gm='git commit -m'
alias gma='git commit -am'
alias gb='git branch'
alias gc='git checkout'
alias gra='git remote add'
alias grr='git remote rm'
alias gpu='git pull'
alias gcl='git clone'
alias gta='git tag -a -m'
alias gf='git reflog'
 
# leverage an alias from the ~/.gitconfig
alias gh='git hist'
alias glg1='git lg1'
alias glg2='git lg2'
alias glg='git lg'
 
# -------------------------------------------------------------------
# Capistrano aliases
# -------------------------------------------------------------------
 
alias capd='cap deploy'
 
 
# -------------------------------------------------------------------
# Symfony aliases
# -------------------------------------------------------------------
 
#alias symcl='php app/console cache:clear --no-debug'
#alias symcla='php app/console assetic:dump --no-debug'
#alias symaiaw = 'php app/console assets:install --symlink && php app/console assetic:watch'
 
# -------------------------------------------------------------------
# OTHER aliases
# -------------------------------------------------------------------
 
alias cl='clear'
 
 
# -------------------------------------------------------------------
# FUNCTIONS
# -------------------------------------------------------------------
 
# return my IP address
function myip() {
    ifconfig lo0 | grep 'inet ' | sed -e 's/:/ /' | awk '{print "lo0       : " $2}'
     ifconfig en0 | grep 'inet ' | sed -e 's/:/ /' | awk '{print "en0 (IPv4): " $2 " " $3 " " $4 " " $5 " " $6}'
     ifconfig en0 | grep 'inet6 ' | sed -e 's/ / /' | awk '{print "en0 (IPv6): " $2 " " $3 " " $4 " " $5 " " $6}'
     ifconfig en1 | grep 'inet ' | sed -e 's/:/ /' | awk '{print "en1 (IPv4): " $2 " " $3 " " $4 " " $5 " " $6}'
     ifconfig en1 | grep 'inet6 ' | sed -e 's/ / /' | awk '{print "en1 (IPv6): " $2 " " $3 " " $4 " " $5 " " $6}'
}
 
# Change directory to the current Finder directory
cdf() {
    target=`osascript -e 'tell application "Finder" to if (count of Finder windows) > 0 then get POSIX path of (target of front Finder window as text)'`
    if [ "$target" != "" ]; then
        cd "$target"; pwd
    else
        echo 'No Finder window found' >&2
    fi
}
