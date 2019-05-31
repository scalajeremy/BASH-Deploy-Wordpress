#!/bin/bash
# V2.8
# V3 coming soon. Multiple CMS installer...

function connectionIsUp () {
  if ping -q -c 1 -W 1 8.8.8.8 >/dev/null; then
    return 0
  else
    return 1
  fi
}

function checkUser () {
  username=$USER
  if getent group www-data | grep &>/dev/null "\b${username}\b"; then
      echo "!!! You're in the www-data group. Let's continue."
  else
      echo "!!! You're not in the www-data group."
      read -p "!!! Do you want me to add you? (y/n) " -n 1 -r
      echo
      if [[ $REPLY =~ ^[Yy]$ ]]; then
          sudo usermod -a -G www-data $USER
          echo "!!! It's done, but you'll need to log-off after the end of this script to apply the change."
        else
          echo "!!! You'll have to do it by yourself."
      fi

  fi
}

function createDB () {
  mysql -u $userMySQL -p -e "CREATE DATABASE ${dbName};"
}

function install () {
  cd ${projectname}
  echo "############################################################"
  echo "######            Downloading & Extracting            ######"
  echo "######                   Wordpress                    ######"
  echo "############################################################"
  curl -OL http://wordpress.org/latest.tar.gz
  tar -zxvf latest.tar.gz
  cp -rvf wordpress/* .
  rm -R wordpress
  rm latest.tar.gz
  echo "############################################################"
  echo "######            Changing permission for             ######"
  echo "######                Apache Access                   ######"
  echo "############################################################"
  cd ..
  sudo chown -R 33:33 ${projectname}
  sudo chmod g+w -R ${projectname}
  echo "!!! You need to be in the same group as apache (www-data) for being able to access and edit your file."
  echo "!!! I'm gonna check if you're in it."
  checkUser #Check if user is in www-data group
  echo "############################################################"
  echo "######                Creating database               ######"
  echo "############################################################"
  # Creating a DB with the same name as the project name
  echo "!!!Please enter your desire name for MySQL database (no spec. char. & space):"
  read dbName
  echo "!!!Please enter your username for MySQL:"
  read userMySQL
  echo "!!!Please enter your password for MySQL:"
  count=0
  createDB
  while [[ $? != 0 && count -lt 2 ]]; do
    count=$((count+1))
    echo "!!!Please enter your username for MySQL:"
    read userMySQL
    createDB
  done
  if [[ $? = 0 ]]; then
  echo "!!! Database created"
  fi
}

# Starting scripts

connectionIsUp
if [[ $? != 0 ]]; then
  exit 1
fi
projectname=$1
while [[ ${projectname} = '' ]]; do
  echo "!!! Enter your project name:"
  read projectname
done

#Check if directory exist & empty
if [[ -d ${projectname} ]]; then # Check if already exist
  if [ -z "$(ls -A ${projectname})" ];then # Check if empty
    install
  else
    echo "!!! Directory already exist. Choose another one. Restarting script now... !!!"
    sleep 1.5s
    bash wordpress.sh
  fi
else
  mkdir ${projectname}
  install
fi
