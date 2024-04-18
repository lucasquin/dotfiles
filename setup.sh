# Define colors for output
RED='\033[0;31m'
GREEN='\033[0;32m'
YELLOW='\033[0;33m'
NC='\033[0m' # No Color

sucess="${GREEN}==>${NC}"
warning="${YELLOW}==>${NC}"
fail="${RED}==>${NC}"

dotfiles=(
	.XCompose
	.bash_aliases
	.bashrc
	.gitattributes
	.gitconfig
	.gitignore-global
	.vimrc
	commit-template.txt
)

if [ ! -d ~/Clone/oh-my-hyprland ]; then
	echo -e "${warning} Cloning oh-my-hyprland..."
	git clone git@github.com:lucasquin/oh-my-hyprland.git ~/Clone/oh-my-hyprland
fi

if [ ! -d ~/Clone/oh-my-neovim ]; then
	echo -e "${warning} Cloning oh-my-neovim..."
	git clone git@github.com:lucasquin/oh-my-neovim.git ~/Clone/oh-my-neovim
fi

function InstallNeovim {
	rm -rf ~/.config/nvim || return 1

	read -p "Remove cache of Neovim? (y/n): " remove_cache
	if [ "$remove_cache" = "y" ]; then
		rm -rf ~/.local/share/nvim || return 1
	fi

	ln -s ~/Clone/oh-my-neovim ~/.config/nvim || return 1
	echo -e "${sucess} Neovim configuration installed successfully."
}

function InstallHyprland {
  cd ~/Clone/oh-my-hyprland/scripts/
  ./installer.sh
	echo -e "${sucess} Hyprland configuration installed successfully."
}

function InstallDots {
	dest="${HOME}/${1}"
	dot=$(pwd)

	if [ -e "${dest}" ]; then
		if [ -d "${dest}" ]; then
			echo -e "${warning} Removing existing directory ${dest}..."
			rm -rf "${dest}"
		else
			echo -e "${warning} Removing existing file ${dest}..."
			rm "${dest}"
		fi
	fi

	if [ -h "${dest}" ]; then
		echo -e "${warning} Removing existing symlink ${dest}..."
		rm "${dest}"
	fi

	if [ -h "${dest}" ]; then
		echo -e "${warning} Removing symlink ${dest}..."
		rm "${dest}"
	fi

	echo -e "${sucess} Creating a new symlink for ${1}"
	ln -s "${dot}/${1}" "${dest}"
}

InstallNeovim

for file in "${dotfiles[@]}"; do
	InstallDots "${file}"
done

InstallHyprland
