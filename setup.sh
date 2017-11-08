ln -s .dotfiles/inputrc .inputrc;
ln -s .dotfiles/vim/vimrc .vimrc;
ln -s .dotfiles/vim .vim;

#git
ln -s .dotfiles/git/gitconfig .gitconfig;
git config --global core.excludesfile ~/.gitignore_global
ln -s .dotfiles/git/gitignore_global .gitignore_global;
