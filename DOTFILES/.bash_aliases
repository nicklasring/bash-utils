## Colorize grep
alias grep='grep --color=auto'

# Vi = Vim
alias vi=vim

# Netstat
alias openports='netstat -tulanp'

# Apt Upgrade
alias upgrade='sudo apt-get update && sudo apt-get upgrade'

# Applications
alias chrome='/usr/bin/google-chrome'

# SSH Config
alias vh="awk '/^Host/ {print $2;}' ~/.ssh/config"
