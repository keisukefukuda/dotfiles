# Install emacs-related dot files into a new environment
if [ -d "~/.cask" ]; then
	echo "~/.cask already exists. Remove it."
	exit -1
fi

if [ -f "~/.emacs" ]; then
	echo "~/.emacs already exists. Remove it."
fi

curl -fsSkL https://raw.github.com/cask/cask/master/go | python
rm ~/.cask/Cask
ln -s ~/dotfiles/emacs/Cask ~/.cask/Cask
ln -s ~/dotfiles/emacs/dot_emacs ~/.emacs

cd ~/.cask
./bin/cask --verbose install

