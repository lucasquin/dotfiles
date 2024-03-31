# command - package
tools=(
	"node nodejs"
	"npm npm"
	"go go"
	"rg ripgrep"
	"unzip unzip"
	"swww swww"
	"zsh zsh"
)

files=(
	.XCompose
	.bash_aliases
	.bashrc
	.gitattributes
	.gitconfig
	.gitignore-global
	.vimrc
	.zshrc
	commit-template.txt

	.config/alacritty
	.config/hypr
	.config/kitty
	.config/nvim
	.config/waybar
	.config/wofi
	.config/dolphinrc
	.config/kdeglobals
)

function InstallDots {
	dest="${HOME}/${1}"
	dot=$(pwd)

	if [ -e "${dest}" ]; then
		if [ -d "${dest}" ]; then
			echo "Removing existing directory ${dest}..."
			rm -rf "${dest}"
		else
			echo "Removing existing file ${dest}..."
			rm "${dest}"
		fi
	fi

	if [ -h "${dest}" ]; then
		echo "Removing existing symlink ${dest}..."
		rm "${dest}"
	fi

	if [ -h "${dest}" ]; then
		echo "Removing symlink ${dest}..."
		rm "${dest}"
	fi

	echo "Creating a new symlink for ${1}"
	ln -s "${dot}/${1}" "${dest}"
}

function InstallTool {
	command=$1
	package=$2

	if ! command -v "git" &>/dev/null; then
		echo "Installing git..."
		sudo pacman -S git
	else
		echo "git already installed."
	fi

	if ! command -v "paru" &>/dev/null; then
		echo "Installing paru..."
		sudo pacman -S --needed base-devel
		cd ~/Repository/
		git clone https://aur.archlinux.org/paru.git
		cd paru
		makepkg -si
	else
		echo "paru already installed."
	fi

	if ! command -v "${command}" &>/dev/null; then
		echo "Installing ${package}..."
		sudo paru -S "${package}"
	else
		echo "${package} already installed."
	fi
}

function InstallFonts {
	fonts=$1
	fontsDir="${HOME}/.local/share/fonts/"

	if [ ! -d "${local_fonts_dir}" ]; then
		echo "Creating fonts directory ${fontsDir}..."
		mkdir -p "${fontsDir}"
	fi

	if [ -d "${fonts}" ]; then
		echo "Installing fonts from ${fonts}..."
		cp -r "${fonts}/"* ${fontsDir}
		fc-cache -f -v
	else
		echo "Fonts directory ${fonts} not found."
	fi
}

for file in "${files[@]}"; do
	InstallDots "${file}"
done

for tool in "${tools[@]}"; do
	InstallTool ${tool}
done

InstallFonts "fonts"

if [ "$(basename "${SHELL}")" != "zsh" ]; then
	echo "Changing shell to Zsh..."
	chsh -s /bin/zsh
fi
