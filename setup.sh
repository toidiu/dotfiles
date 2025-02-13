#common
ln -si .dotfiles/commonrc .commonrc;

ln -si .dotfiles/vim .vim;
ln -si .dotfiles/vim/vimrc .vimrc;

#git
ln -si .dotfiles/git/gitconfig .gitconfig;


#gitignore_global
git config --global core.excludesfile ~/.gitignore_global
ln -si .dotfiles/git/gitignore_global .gitignore_global;

#bash
ln -si .dotfiles/bash/bashrc .bashrc;
ln -si .dotfiles/bash/bash_profile .bash_profile;
ln -si .dotfiles/inputrc .inputrc;

#zsh
ln -si .dotfiles/zsh/zshrc .zshrc;

#tmux
ln -si .dotfiles/tmux.conf .tmux.conf;

#ctags
ln -si .dotfiles/ctags .ctags;

