if [[ $USER == "apoorvko" ]]; then
  if [ -f ~/.is_cloud ];
    then echo "amz cloud"
    else echo "amz";
  fi
  else echo "home";
fi

#common
if [ $USER == "apoorvko" ] && [ -f ~/.is_cloud ]; then # amz cloud
  ln -si .dotfiles/cloud/commonrc .commonrc;
else # home
  ln -si .dotfiles/commonrc .commonrc;
fi

ln -si .dotfiles/vim .vim;
if [ $USER == "apoorvko" ] && [ -f ~/.is_cloud ]; then # amz cloud
  ln -si .dotfiles/cloud/vimrc .vimrc;
else # home
  ln -si .dotfiles/vim/vimrc .vimrc;
fi

#git
if [[ $USER == "apoorvko" ]]; then
  if [ -f ~/.is_cloud ]; then
    ln -si .dotfiles/cloud/gitconfig_amz .gitconfig;
  else
    ln -si .dotfiles/git/gitconfig_amz .gitconfig;
  fi
else
  ln -si .dotfiles/git/gitconfig .gitconfig;
fi

#gitignore_global
git config --global core.excludesfile ~/.gitignore_global
if [ $USER == "apoorvko" ] && [ -f ~/.is_cloud ]; then # amz cloud
  ln -si .dotfiles/cloud/gitignore_global .gitignore_global;
else # home
  ln -si .dotfiles/git/gitignore_global .gitignore_global;
fi

#bash
ln -si .dotfiles/bash/bashrc .bashrc;
ln -si .dotfiles/bash/bash_profile .bash_profile;
ln -si .dotfiles/inputrc .inputrc;

#zsh
if [ $USER == "apoorvko" ] && [ -f ~/.is_cloud ]; then # amz cloud
  ln -si .dotfiles/cloud/zshrc .zshrc;
else # home
  ln -si .dotfiles/zsh/zshrc .zshrc;
fi

#tmux
if [ $USER == "apoorvko" ] && [ -f ~/.is_cloud ]; then # amz cloud
  ln -si .dotfiles/cloud/tmux.conf .tmux.conf;
else # home
  ln -si .dotfiles/tmux.conf .tmux.conf;
fi

#ctags
ln -si .dotfiles/ctags .ctags;

