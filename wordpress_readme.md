# Wordpress Installer

Install Wordpress locally

## Requirement

* You'll need "curl" `apt-get install curl`
* You'll need to have at least a working [LAMP](https://doc.ubuntu-fr.org/lamp) environnement
* **IMPORTANT** you'll need to be in the group **www-data**, because that's the group who'll get the permission to edit files or to add them to your wordpress install. To do that, run this command `usermod -a -G www-data yourUsername`

## Working in var/www/html

1. Allow Apache access to the folders and the files.
```bash
sudo chgrp -R www-data /var/www/html
sudo find /var/www/html -type d -exec chmod g+rx {} +
sudo find /var/www/html -type f -exec chmod g+r {} +
```
2. Give your owner read/write privileges to the folders and the files, and permit folder access to traverse the directory structure.
Don't forget to change `USER`
```bash
sudo chown -R USER /var/www/html/
sudo find /var/www/html -type d -exec chmod u+rwx {} +
sudo find /var/www/html -type f -exec chmod u+rw {} +
```
3. (Optional) Make sure every new file after this is created with www-data as the 'access' user.
```bash
sudo find /var/www/html -type d -exec chmod g+s {} +
```

## What it does?

This bash script let you:
* Choose a **project name**.
* **Create a folder** with that name.
* Download **latest Wordpress** version.
* Extract it to the right place.
* **Change your permission** for letting Apache write in your folder.
* Create a **MySQL Database** with the same name.

## How to

1. Download the script "wordpress.sh".
2. Put it in your global folder or anywhere you want to use it.
3. Open your terminal.
4. Go to the folder you want to install Wordpress (ex: var/www/html).
5. Execute `wordpress.sh`.
6. Answer to the question ask in the terminal.

