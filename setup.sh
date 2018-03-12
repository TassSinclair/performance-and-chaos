#!/usr/bin/env bash
# Installs Brew (with Cask) first if it's not present.
command -v brew >/dev/null 2>&1 \
  || /usr/bin/ruby -e "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/master/install)"
command -v VirtualBox  >/dev/null 2>&1 \
  || brew cask install VirtualBox
command -v kubectl  >/dev/null 2>&1 \
  || brew install kubectl
command -v minikube  >/dev/null 2>&1 \
  || brew cask install minikube
