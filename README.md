EarlyDot
========

OSX/*nix bash dotfiles for Earlydoc developers

A system's dotfiles configure and control its environment, and the EarlyDot project provides a consistent set of commands and conventions for working in linux-style environments (with a bias for OS X).

### Installation

    git clone git@github.com:Guidecase/EarlyDot.git ~/Dev/earlydot
    sh ~/Dev/earlydot/install.sh

After the installation completes, the $HOME directory will include the following files:

    .bash_aliases -> ~/Dev/earlydot/bash/bash_aliases.symlink
    .bash_env -> ~/Dev/earlydot/bash/bash_env.symlink
    .bash_profile -> ~/Dev/earlydot/bash/bash_profile.symlink
    .bashrc -> ~/Dev/earlydot/bash/bashrc.symlink
    .developer
    .gitignore_global -> ~/Dev/earlydot/git/gitignore_global.symlink

### Developer Customization 

Custom aliases, private keys, emails and identifying information, machine preferences, and all other local setup can be placed into at following location: 

    ~/.developer

If this file exists, it will be automatically sourced from `.bashrc`. If it does not exist, then an empty developer file will be created in anticipation of future use.