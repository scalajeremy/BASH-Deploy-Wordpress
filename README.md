# Bash scripts

Here is a collection of some Bash script I did or may do.

## Here is the list

* [Wordpress installer local](wordpress_readme.md)
Install the last version of Wordpress locally and configure some things for you.

## How to execute them globally

### ZSH

If you use ZSH, here is a little procedure to using your script globally

1. Create a new folder for your scripts (ex: scripts) in your home folder.
2. Go to your root (~) in terminal.
3. Execute `nano ~/.zshrc`.
4. Add `export PATH=$PATH:$HOME/<folderWithScripts>` at the end of the file.
5. Save your file and restart your computer.
6. Now you can call these script like this in terminal: `nameOfScript.sh`
