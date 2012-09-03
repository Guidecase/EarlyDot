#!/bin/bash

. $(dirname "$0")/bash/bash_env.symlink

########## Variable Declaration

DOTFILE_DIR=${1:-"$EARLYDOT_DOTFILES_DIR"}

########## Check dependencies

if [ ! -d "$DOTFILE_DIR" ]; then
  echo "ERROR: Could not find dotfile directory at expected location:"
  echo "  $DOTFILE_DIR"
  echo "Install the EarlyDot project from git and try again. e.g."
  echo "    git clone git@github.com:Guidecase/EarlyDot.git $DOTFILE_DIR && sh $DOTFILE_DIR/install.sh"
  echo "Or if you have installed the dotfiles in a different location, supply it as an argument to the script. e.g."
  echo "    sh /PATH/TO/LOCAL/PROJECT/install.sh /PATH/TO/LOCAL/PROJECT"
  exit
fi

########## Create symlinks

LINKED_FILES=$(ls $DOTFILE_DIR/**/*.symlink)

for LINK_FILE in $LINKED_FILES; do
  # echo $LINK_FILE
  FILE_NAME=$(basename "$LINK_FILE")
  SYM_FILE=${FILE_NAME//\.symlink/}
  SYM_FILE=~/.$SYM_FILE
  
  if [ -e $SYM_FILE -o -L $SYM_FILE ]; then	
    mv $SYM_FILE $SYM_FILE.old
    echo "LINKED FILE: $SYM_FILE (renamed existing file to $(basename "$SYM_FILE").old )"
  else
	ln -s $LINK_FILE $SYM_FILE
    echo "LINKED FILE: $SYM_FILE"
  fi
done

########## Create developer customizations file

DEVELOPER_FILE=~/.developer
if [ -e $DEVELOPER_FILE ]; then
  echo "Found developer file at $DEVELOPER_FILE (not creating)"
else
  cat > $DEVELOPER_FILE << EOF
#!/bin/bash
# Developer file for private or identifying data, aliases and working environment customizations
EOF
  echo "CREATED CUSTOM DEVELOPER FILE: $DEVELOPER_FILE"
fi

########## Reload bash

source ~/.bashrc