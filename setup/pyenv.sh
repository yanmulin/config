#!/bin/sh

if [ ! -e $HOME/.pyenv ]; then
  curl https://pyenv.run | bash || exit
fi

case `basename $SHELL` in
  bash) 
    echo >> ~/.bash_profile
    echo '# config pyenv' >> ~/.bash_profile
    echo 'export PYENV_ROOT="$HOME/.pyenv"' >> ~/.bash_profile
    echo 'export PATH="$PYENV_ROOT/bin:$PATH"' >> ~/.bash_profile
    echo -e 'if command -v pyenv 1>/dev/null 2>&1; then\n  eval "$(pyenv init -)"\nfi' >> ~/.bash_profile
    ;;
  zsh)
    echo >> ~/.zshrc
    echo '# config pyenv' >> ~/.zshrc
    echo 'export PYENV_ROOT="$HOME/.pyenv"' >> ~/.zshrc
    echo 'export PATH="$PYENV_ROOT/bin:$PATH"' >> ~/.zshrc
    echo 'if command -v pyenv 1>/dev/null 2>&1; then\n  eval "$(pyenv init -)"\nfi' >> ~/.zshrc
    ;;
  fish)
    fish -c 'echo >> $__fish_config_dir/config.fish'
    fish -c 'echo "# config pyenv" >> $__fish_config_dir/config.fish'
    fish -c 'set -Ux PYENV_ROOT $HOME/.pyenv'
    fish -c 'echo $fish_user_paths | grep -v $PYENV_ROOT && set -Ux fish_user_paths $PYENV_ROOT/bin $fish_user_paths'
    fish -c 'echo -e "if command -v pyenv 1>/dev/null 2>&1\n\tpyenv init - | source\nend" >> $__fish_config_dir/config.fish'
    ;;
  *) echo 'Unknown shell: ' $shell; exit -1;;
esac

