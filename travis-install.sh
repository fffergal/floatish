#!/usr/bin/env bash
set -euo pipefail
IFS=$'\n\t'

if [ ! -d "$HOME/.pyenv" ]; then
  curl -L https://raw.githubusercontent.com/pyenv/pyenv-installer/master/bin/pyenv-installer | bash
  echo 'export PATH="$HOME/.pyenv/bin:$PATH"
  eval "$(pyenv init -)"
  eval "$(pyenv virtualenv-init -)"' >> "$HOME/.bash_profile"
  . "$HOME/.bash_profile"
  pyenv install 2.7.13
  pyenv install 3.0.1
  pyenv install 3.1.5
  pyenv install 3.2.6
  pyenv install 3.3.6
  pyenv install 3.4.6
  pyenv install 3.5.3
  pyenv install 3.6.1
else
  ls "$HOME/.pyenv"
fi

. "$HOME/.bash_profile"
pyenv global 3.6.1 2.7.13 3.0.1 3.1.5 3.2.6 3.3.6 3.4.3 3.5.2
# Have to pin coverage to the same version used by tox, otherwise the
# file format changes.
pip install coverage==4.4.1 python-coveralls==2.9.1 tox==2.7.0 virtualenv==13.1.2
