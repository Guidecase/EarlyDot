EarlyDot
========

OSX/*nix bash dotfiles for Earlydoc developers

A system's dotfiles configure and control its environment, and the EarlyDot project provides a consistent set of commands and conventions for working in linux-style environments (with a bias for OS X).

### Installation

    git clone git@github.com:Guidecase/EarlyDot.git ~/Dev/earlydot
    sh ~/Dev/earlydot/install.sh

After the installation completes, the $HOME directory will include the following files:

    .bash_aliases -> ~/Dev/earlydot/bash/bash_aliases.symlink
    .bash_commands -> ~/Dev/earlydot/bash/bash_commands.symlink
    .bash_env -> ~/Dev/earlydot/bash/bash_env.symlink
    .bash_profile -> ~/Dev/earlydot/bash/bash_profile.symlink
    .bashrc -> ~/Dev/earlydot/bash/bashrc.symlink
    .developer
    .gitignore_global -> ~/Dev/earlydot/git/gitignore_global.symlink

### Administration

Several helper functions exist to ease the administration of dotfile changes, as well as general developer workflows.

**Reload**

The reload command re-sources the various dotfiles (including `.developer`):

    earlydot-reload

**Sync**

The sync command attempts to update the dotfile repository with the latest remote git commits, as well any other additional developer-defined repositories, and then push all local changes to the remote git host. Note: if any of the repositories in question contain local changes then the script will exit and none of the repositories will be updated until the changes are committed:

    earlydot-sync

### Environment

There are several environmental variables which are set and used through the dotfiles, and which may also be useful in customizing the `.developer` file. These are:

    $EARLYDOT_PROJECT_DIR => "$HOME/Dev"
    $EARLYDOT_DOTFILES_DIR => "$EARLYDOT_PROJECT_DIR/earlydot"
    $EARLYDOT_REPOSITORIES => ($EARLYDOT_DOTFILES_DIR)

### Developer Customization 

Custom aliases, private keys, emails and identifying information, machine preferences, and all other local setup can be placed into at following location: 

    ~/.developer

If this file exists, it will be automatically sourced from `.bashrc`. If it does not exist, then an empty developer file will be created in anticipation of future use.

Earlydot exposes an environment variable in the form of an array of repositories that can be automatically updated, synced, and otherwise managed automatically. By default this array only contains the `$EARLYDOT_DOTFILES_DIR` repository, but additional repositories can be added if it's desirable to keep them all in sync together. 

For example, the following lines could be added to the `.developer` file (note the index starts at 1, since earlydot itself occupies element 0):

    EARLYDOT_REPOSITORIES[1]=$EARLYDOT_PROJECT_DIR/project1
    EARLYDOT_REPOSITORIES[2]=$EARLYDOT_PROJECT_DIR/project2
