sudo pacman -Syu
sudo pacman -S hyprland
sudo pacman -S btop cava discord fastfetch firefox gtk3 gtk4 hyprcursor hyprgraphics hypridle hyprland-qt-support hyprlang hyprlock hyprpaper hyprpicker hyprsunset kitty nautilus nvidia nvidia-utils obsidian qt5 qt6 spotify-launcher steam wofi zsh

git clone https://aur.archlinux.org/yay.git && cd yay && makepkg -si

cd ..
sudo rm -rf yay

yay -S matugen-bin steam-link visual-studio-code-bin xwaylandvideobridge ags-hyprpanel-git

echo INSTALLING OMZ AND VENCORD

sh -c "$(curl -fsSL https://raw.githubusercontent.com/ohmyzsh/ohmyzsh/master/tools/install.sh)"
sh -c "$(curl -sS https://raw.githubusercontent.com/Vendicated/VencordInstaller/main/install.sh)"
sh -c "$(curl -fsSL https://raw.githubusercontent.com/spicetify/cli/main/install.sh)"
sh -c "$(curl -fsSL https://raw.githubusercontent.com/spicetify/marketplace/main/resources/install.sh)"

echo COPYING DOTFILES

cd dotFiles
cp hyprland.conf hyprlock.conf hyprpaper.conf hyprsunset.conf ~/.config/hypr
cp settings.json ~/.config/hyprpanel
cp btop.conf ~/.config/btop
cd ..
echo SUCCESS

echo COPYING MATUGEN FILES
cd matugen
cp bColors.theme colors.txt config.toml dColors.css fColors.jsonc gColors.css hColors.conf kColors.conf wColors.css zColors.json ~/.config/matugen
cd ..
echo SUCCESS

echo CREATE ASSET FOLDERS
mkdir ~/ffLogo
mkdir ~/wallpaper
echo SUCCESS

echo COPY ASSETS
cp -r ./assets/wallpapers/* ~/wallpaper
ls ./assets | grep .txt
echo ENTER FASTFETCH LOGO NAME:
read ffLogo
cp "./assets/$ffLogo.txt" ~/ffLogo/logo.txt
echo SUCCESS

echo SET THEME AND WALLPAPER
cd ~/wallpaper
ls | grep .png
echo ENTER WALLPAPER NAME:
read wallpaper
cp "$wallpaper.png" wallpaper.png
matugen image wallpaper.png
cd ~/dotFiles
echo SUCCESS


echo SWITCH SHELL
chsh -s /usr/bin/zsh
cp ./assets/.zshrc ./assets/.zlogin ~
echo SUCCESS

echo LOG BACK IN TO SEE CHANGES
exit
