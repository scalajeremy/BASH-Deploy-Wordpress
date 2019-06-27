# Wordpress Installer

Install Wordpress locally

## Requirement

* You'll need "curl" `apt-get install curl`
* You'll need to have at least a working [LAMP](https://doc.ubuntu-fr.org/lamp) environnement
* **IMPORTANT** you'll need to be in the group **www-data**, because that's the group who'll get the permission to edit files or to add them to your wordpress install. To do that, run this command `usermod -a -G www-data yourUsername`

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

