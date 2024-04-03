# Dotfiles
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

for file in "${files[@]}"; do
	InstallDots "${file}"
done

# Fonts
fonts="fonts"
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

# Zsh
if [ "$(basename "${SHELL}")" != "zsh" ]; then
	echo "Changing shell to Zsh..."
	chsh -s /bin/zsh
fi

# Git
if ! command -v "git" &>/dev/null; then
	echo "Installing git..."
	sudo pacman -S git
else
	echo "git already installed."
fi

# Paru
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

# Tools and packages
tools=(
	# Display Manager: Components for managing user logins and themes
	"sddm"                 # Display manager for KDE Plasma
	"qt5-quickcontrols"    # UI elements for SDDM themes using Qt Quick Controls
	"qt5-quickcontrols2"   # UI elements for SDDM themes with Qt Quick Controls 2
	"qt5-graphicaleffects" # Graphical effects for SDDM themes

	# System Services: Core services for audio, video, networking, and bluetooth management
	"pipewire"               # Audio and video server
	"pipewire-alsa"          # ALSA client for PipeWire
	"pipewire-audio"         # General audio client library for PipeWire
	"pipewire-jack"          # JACK client for PipeWire
	"pipewire-pulse"         # PulseAudio client for PipeWire
	"gst-plugin-pipewire"    # GStreamer integration for PipeWire
	"wireplumber"            # Session manager for PipeWire
	"pavucontrol"            # GUI volume control for PulseAudio
	"pamixer"                # CLI volume control for PulseAudio
	"networkmanager"         # Network management
	"network-manager-applet" # System tray utility for network management
	"bluez"                  # Bluetooth protocol stack
	"bluez-utils"            # CLI utilities for Bluetooth
	"blueman"                # GUI manager for Bluetooth
	"brightnessctl"          # Control screen brightness

	# Programming Languages and Tools: Development environments and package managers
	"nodejs" # JavaScript runtime
	"go"     # Go programming language
	"npm"    # Node.js package manager
	"rust"   # Rust programming language

	# Applications: General user applications
	"webcord"     # Discord client
	"thunderbird" # Email client
	"timeshift"   # System backup and restore utility

	# Dependencies and System Utilities: Additional tools and libraries required by other packages
	"polkit-kde-agent"            # KDE authentication agent
	"xdg-desktop-portal-hyprland" # XDG desktop portal for Hyprland
	"pacman-contrib"              # Tools for system update checks and maintenance
	"python-pyamdgpuinfo"         # Utility for AMD GPU information
	"parallel"                    # Parallel processing utility
	"jq"                          # Command-line JSON processor
	"imagemagick"                 # Image processing suite
	"qt5-imageformats"            # Additional image formats support in Qt5
	"ffmpegthumbs"                # Video thumbnail generator for file managers
	"kde-cli-tools"               # CLI tools for KDE desktop
	"kservice5"                   # Service integration for KDE applications

	# Window Manager and Desktop Environment: Tools and utilities for window management and desktop interface
	"hyprland"               # Wayland compositor based on wlroots
	"dunst"                  # Notification daemon
	"rofi-lbonn-wayland-git" # Application launcher for Wayland
	"waybar"                 # Highly customizable Wayland bar for Sway and Wlroots based compositors
	"swww"                   # Simple wallpaper setter
	"swaylock-effects-git"   # Lock screen with effects
	"wlogout"                # Wayland logout menu
	"grimblast-git"          # Screenshot tool for Wayland
	"hyprpicker"             # Color picker tool
	"slurp"                  # Select regions for screenshots or screencasting
	"swappy"                 # Screenshot editing tool
	"cliphist"               # Clipboard manager
	"nemo"                   # GUI File Manager 

	# Theming and Appearance: Tools for customizing the look and feel of the desktop environment
	"nwg-look"    # GTK configuration tool
	"qt5ct"       # Qt5 configuration tool
	"qt6ct"       # Qt6 configuration tool
	"kvantum"     # SVG-based theme engine for Qt
	"qt5-wayland" # Wayland support for Qt5 applications
	"qt6-wayland" # Wayland support for Qt6 applications

	# Utilities: Miscellaneous tools for system maintenance and productivity
	"ripgrep" # Search tool for Neovim
	"unzip"   # Utility for extracting compressed files
	"zsh"     # Z shell, a command line interpreter
	"eza"     # Enhanced 'ls' command with additional features
)

package_list=()
not_installed_packages=()

for pkg in "${tools[@]}"; do
	if ! paru -Qi "$pkg" &>/dev/null; then
		if paru -Si "$pkg" &>/dev/null; then
			package_list+=("$pkg")
		else
			not_installed_packages+=("$pkg")
		fi
	else
		echo "$pkg is already installed."
	fi
done

if [ ${#package_list[@]} -ne 0 ]; then
	echo "Installing packages..."
	sudo paru -S "${package_list[@]}"
else
	echo "All specified packages are already installed or were not found."
fi

if [ ${#not_installed_packages[@]} -ne 0 ]; then
	echo "The following packages were not found in the repositories and could not be installed:"
	printf '%s\n' "${not_installed_packages[@]}"
fi
