#!/bin/bash
# Installing environnement for Jekyll. 
# V1

# Styling

bold=$(tput bold)
normal=$(tput sgr0)
red=$(tput setaf 1)
green=$(tput setaf 2)
yellow=$(tput setaf 3)

# Functions

function connectionIsUp () {
  if ping -q -c 1 -W 1 8.8.8.8 >/dev/null; then
    return 0
  else
    return 1
  fi
}

function whatOs () {
  echo "Can you tell me which OS you're working on?"
  echo "Linux or MacOSX?"
select os in "Linux" "MacOSX"; do
    case $os in
        Linux ) break;;
        MacOSX )  break;;
    esac
done
}

function whatShell () {
  echo "In order to link to your gems properly, I need to know which shell you're using"
  echo "Are you using BASH or ZSH?"
select shell in "Bash" "ZSH"; do
    case $shell in
        Bash ) break;;
        ZSH )  break;;
    esac
done
}

function isOsShellOk () {
  echo "Ok so, you're working on" ${bold}${red}$os ${normal}"and you're using" ${bold}${red}$shell
  read -p ${normal}"Is that correct? (Y/n)" -n 1 -r
  REPLY=${REPLY:-Y}
  if [[ $REPLY =~ ^[Yy]$ ]]; then
      clear
      installRuby
    else
        echo "nope"
  fi
}

function installRuby () {
    # sudo apt-get install ruby-full build-essential zlib1g-dev
    if [[ $os == MacOSX ]]; then
      installRubyMacOSX
    else
      installRubyLinux
    fi
}

function installRubyMacOSX () {
    echo "Ok i'm installing Ruby for your Mac"

}

function installRubyLinux () {
    echo "Ok i'm installing Ruby for your Linux"

}
###################
# Starting script #
###################
clear
connectionIsUp
if [[ $? != 0 ]]; then
    exit 1
  fi
whatOs
clear
whatShell
clear
isOsShellOk