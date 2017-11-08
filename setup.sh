ln -s .dotfiles/inputrc .inputrc;
ln -s .dotfiles/vim .vim;
ln -s .dotfiles/vim/vimrc .vimrc;

#git
ln -s .dotfiles/git/gitconfig .gitconfig;
git config --global core.excludesfile ~/.gitignore_global
ln -s .dotfiles/git/gitignore_global .gitignore_global;

#bash
ln -s .dotfiles/bash/bashrc .bashrc;
ln -s .dotfiles/bash/bash_profile .bash_profile;

