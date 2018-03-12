#!/usr/bin/env bash
# Installs Brew first if it's not present.
command -v brew >/dev/null 2>&1 || /usr/bin/ruby -e "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/master/install)"
brew install kubectl
brew cask install minikube
