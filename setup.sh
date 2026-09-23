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

#alacritty
ln -si ~/.dotfiles/alacritty.toml ~/.config/alacritty/alacritty.toml;

# ai
ln -si ~/.dotfiles/ai/opencode.jsonc ~/.config/opencode/opencode.jsonc;
ln -si ~/.dotfiles/ai/CLAUDE.md ~/.claude/CLAUDE.md;
ln -si ~/.dotfiles/ai/settings.json ~/.claude/settings.json;
ln -si ~/.dotfiles/ai/agents ~/.claude;

# ai skills (linked one by one — ~/.claude/skills also holds non-dotfiles content, so it can't be a single symlink)
mkdir -p ~/.claude/skills;
for skill in ~/.dotfiles/ai/skills/*/; do
  ln -si "$skill" ~/.claude/skills/"$(basename "$skill")";
done
