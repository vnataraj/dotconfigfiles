dotconfigfiles
==============

The following is a collection of scripts and configuration files created by Vipul Nataraj for his own use.  However, the use of this repo by others is encouraged and allowed, provided that they find it useful, and if they so choose, are able to contribute to its development.  Below are descriptions of the different scripts and what they do.  

Script Installer(scriptinstaller.sh)
-------------------------------------
This is a script that installs all the other scripts in the directory.  It points to ~/bin as the destination for all of the symbolic links(which is added to the $PATH variable thanks to the respective bashrc).

Dotfiles Installer(dotfilesinstaller.sh)
-----------------------------------------
This is a script that installs all of the configuration files, or dot files, to their respective location in the ~/ directory.  The script allows you to skip through and install the ones you would like if you have an existing version of the file you would not like to overwrite.

Vim Plugin Installer(plugin\_installer.sh)
-------------------------------------------
This is a script that installs pathogen.vim if it isn't already installed, and all of the other packages specified in the script headers. Good for first-time configuration of a Unix machine.

Vim Plugin Updater(plugin\_updater.sh)
---------------------------------------
This is a script that updates every vim plugin installed on the system through pathogen.  Useful to run every login.

Vim Theme Installer(themesinstaller.sh)
----------------------------------------
This is a script to install vim colorschemes specified in the header definitions.  
Dark themes generally better/preferred.

Project Updater(project\_updater.sh)
-------------------------------------
This is a script to update all of the projects specified in a directory supplied through a command line argument.

Git Configuror(gitconfiguror.sh)
---------------------------------
This is a script to clone a git url and also copy over the gitignore into the directory of the project.


-----------------------------------

More may come, this is just a running total.  Below is a list of the possible config files and their intended OS

- bashrcmac [Mac OS]
- bashrcsuse [Linux/Gnu-Linux]
- bash\_profile(requires bashrc) [All Unix]
- vimrc [All Unix]
- gitignore [All Unix]
- tmux.conf [All Unix]
- profile [Mac OS]

The list keeps growing.  If you have any suggestions or feature ideas feel free to send a pull request.  You are encouraged to fork the repository and experiment with the contents!

