zmodload zsh/complist
autoload -Uz compinit promptinit
compinit
promptinit
setopt autopushd pushdminus pushdsilent pushdtohome
setopt autocd
setopt cdablevars
setopt ignoreeof
setopt interactivecomments
setopt nobanghist
setopt noclobber
setopt HIST_REDUCE_BLANKS
setopt HIST_IGNORE_SPACE
setopt SH_WORD_SPLIT
setopt nohup
zstyle :compinstall filename '${HOME}/.zshrc'

#- buggy
zstyle ':completion:*:descriptions' format '%U%B%d%b%u'
zstyle ':completion:*:warnings' format '%BSorry, no matches for: %d%b'
#-/buggy

zstyle ':completion:*:pacman:*' force-list always
zstyle ':completion:*:*:pacman:*' menu yes select

zstyle ':completion:*:default' list-colors ${(s.:.)LS_COLORS}

zstyle ':completion:*:*:kill:*' menu yes select
zstyle ':completion:*:kill:*' force-list always

zstyle ':completion:*:*:killall:*' menu yes select
zstyle ':completion:*:killall:*' force-list always

export PATH=$PATH:~/.cabal/bin:/usr/local/bin
export EDITOR="nano"
export BROWSER="firefox"

prompt walters

clyde() {
   case $1 in
       -S | -S[^si]* | -R* | -U*)
           /usr/bin/sudo /usr/bin/clyde "$@" ;;
       *)
           /usr/bin/clyde "$@" ;;
   esac
}

alias b=cd $OLDPWD
alias p="cd ~/projects"
alias ..="cd ../"
alias ...="cd ../../"
alias ....="cd ../../../"
alias s="cd ./src"
alias l="cd ./include*"
alias tpt="cd ~/projects/The-Powder-Toy"
alias ls="ls --color=auto"

alias -s html=$BROWSER
alias -s org=$BROWSER
alias -s php=$BROWSER
alias -s com=$BROWSER
alias -s net=$BROWSER
alias -s png=feh
alias -s jpg=feh
alias -s gif=feg
alias -s sxw=soffice
alias -s doc=soffice
alias -s gz=tar -xzvf
alias -s bz2=tar -xjvf
alias -s java=$EDITOR
alias -s txt=$EDITOR
alias -s PKGBUILD=$EDITOR
