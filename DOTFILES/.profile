BIN_PATH="/usr/local/bin:/usr/bin:/bin"

if [ -d "$HOME/Binaries" ] ; then
  BIN_PATH="$BIN_PATH:$HOME/Binaries"
fi

if [ -f "$HOME/.bashrc" ]; then
    . "$HOME/.bashrc"
fi

export GOROOT="/usr/local/go"
export GOPATH="$HOME/Development/go"
export PATH="$BIN_PATH:$GOROOT/bin/:$GOPATH/bin"
