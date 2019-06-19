# Bash scripts

Here is a collection of some Bash script I did or may do.

## Here is the list

* [Wordpress installer local](wordpress_readme.md)
Install the last version of Wordpress locally and configure some things for you.

* [Jekyll installer](jekyll_readme.md)
Check your os and shell, then install a Ruby development environment and Jekyll. Works only for Linux Ubuntu & MacOSX.

## How to execute them globally

1. Create a new folder for your scripts (ex: scripts) in your home folder.
2. Go to your root (~) in terminal.
3. If you're using **ZSH** execute `nano ~/.zshrc`  or `nano ~/.bashrc` if you're using **BASH**.
4. Add `export PATH=$PATH:$HOME/<folderWithScripts>` at the end of the file.
5. Save your file and restart your computer.
6. Execute `sudo chmod u+x nameOfScript.sh`
7. Now you can call these script like this in terminal: `nameOfScript.sh`

### Credits

People that helped me: [Sam](https://github.com/sdegueldre), [Vincent](https://github.com/Raigyo)