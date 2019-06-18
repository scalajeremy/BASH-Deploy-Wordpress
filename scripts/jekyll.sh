#!/bin/bash
# Installing environnement for Jekyll. 
# V1

# Functions

function connectionIsUp () {
  if ping -q -c 1 -W 1 8.8.8.8 >/dev/null; then
    return 0
  else
    return 1
  fi
}

function installRuby () {
    sudo apt-get install ruby-full build-essential zlib1g-dev
}

function whatShell () {
  echo "Are you using BASH or ZSH?"
select shell in "Bash" "ZSH"; do
    case $shell in
        Bash ) shellSelected; exit;;
        ZSH )  shellSelected; exit;;
    esac
done
}

function shellSelected () {
  echo "Coucou" + $shell
}

###################
# Starting script #
###################

connectionIsUp
if [[ $? != 0 ]]; then
    exit 1
fi
whatShell

# installRuby