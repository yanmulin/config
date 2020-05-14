#!/bin/sh

function install () {
  case `uname -s` in
    Darwin) brew install $1;;
    Linux)
      source /etc/os-release
      case $ID in
        ubuntu)apt-get install $1;;
        *) echo Unknown OS: $ID; exit -1;;
      esac;;
    *) echo Unknown OS: `uname -s`; exit -1;;
  esac
}

shell=`basename $SHELL`
case $shell in
  bash) 
    echo >> ~/.bash_profile
    echo '# config pyenv' >> ~/.bash_profile
    echo 'export PYENV_ROOT="$HOME/.pyenv"' >> ~/.bash_profile
    echo 'export PATH="$PYENV_ROOT/bin:$PATH"' >> ~/.bash_profile
    echo -e 'if command -v pyenv 1>/dev/null 2>&1; then\n  eval "$(pyenv init -)"\nfi' >> ~/.bash_profile
    ;;
  zsh)
    echo 'export PYENV_ROOT="$HOME/.pyenv"' >> ~/.zshrc
    echo 'export PATH="$PYENV_ROOT/bin:$PATH"' >> ~/.zshrc
    echo -e 'if command -v pyenv 1>/dev/null 2>&1; then\n  eval "$(pyenv init -)"\nfi' >> ~/.zshrc
    ;;
  fish)
    fish -c "set -Ux PYENV_ROOT $HOME/.pyenv"
    fish -c "set -Ux fish_user_paths $PYENV_ROOT/bin $fish_user_paths"
    fish -c 'echo -e "if command -v pyenv 1>/dev/null 2>&1; then\n\tpyenv init - | source\nfi" >> $__fish_config_dir/config.fish'
    ;;
  *) echo 'Unknown shell: ' $shell; exit -1;;
esac

curl https://pyenv.run | bash
