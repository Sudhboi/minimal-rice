export DOTFILES="/home/sudhirk/.backups/dotfiles"

function copydir() {
    cp -r ~/.config/$1 $DOTFILES/.config 2>>"/home/sudhirk/.backups/log.txt"
}

copydir niri
copydir hypr
copydir kitty
copydir nvim
copydir waybar

cp ~/.zshrc $DOTFILES/.config

cd $DOTFILES

echo "\nPull? (Y/n)"
read pull

if [ "$pull" != "n" ]; then
    git pull
fi

lazygit
