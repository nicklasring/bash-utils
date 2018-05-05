# If not running interactively, don't do anything
case $- in
  *i*) ;;
  *) return;;
esac

shopt -s checkwinsize

function SET_HISTORY
{
  shopt -s histappend
  HISTCONTROL=ignoreboth
  HISTSIZE=1000000
  HISTFILESIZE=2000000
}

function COLORS_AND_PROMPT
{
  PS1="\[\033[0;33m\][\!]\`if [[ \$? = "0" ]]; then echo "\\[\\033[32m\\]"; else echo "\\[\\033[31m\\]"; fi\`[\u: \`if [[ `pwd|wc -c|tr -d " "` > 18 ]]; then echo "\\W"; else echo "\\w"; fi\`]\$\[\033[0m\] "; echo -ne "\033]0;`hostname -s`:`pwd`\007"

  case "$TERM" in
    xterm*|rxvt*)
      PS1="\[\e]0;${debian_chroot:+($debian_chroot)}\u@\h: \w\a\]$PS1"
      ;;
    *)
      ;;
  esac

  if [ -x /usr/bin/dircolors ]; then
    test -r ~/.dircolors && eval "$(dircolors -b ~/.dircolors)" || eval "$(dircolors -b)"
    alias ls='ls --color=auto'
  fi

  export GCC_COLORS='error=01;31:warning=01;35:note=01;36:caret=01;32:locus=01:quote=01'
}

function ALIAS_AND_COMPLETION
{

  if [ -f ~/.bash_aliases ]; then
    . ~/.bash_aliases
  fi

  if ! shopt -oq posix; then
    if [ -f /usr/share/bash-completion/bash_completion ]; then
      . /usr/share/bash-completion/bash_completion
    elif [ -f /etc/bash_completion ]; then
      . /etc/bash_completion
    fi
  fi
}


SET_HISTORY
COLORS_AND_PROMPT
ALIAS_AND_COMPLETION
