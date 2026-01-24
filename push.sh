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

echo "\nPrint Diff? (y/N)"
read diff

if [ "$diff" = "y" ]; then
    git diff
fi

echo "\nEnter Commit Message: "
read commit_message

git add -A

git commit -m $commit_message
git push

echo "\nPrint Log? (y/N)"
read confirm

if [ "$confirm" = "y" ]; then
    cat "/home/sudhirk/.backups/log.txt"
fi

rm "/home/sudhirk/.backups/log.txt"
