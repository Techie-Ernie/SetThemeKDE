bold=$(tput bold)

normal=$(tput sgr0)
echo "${bold}Ernie's script to change the theme${normal}"
echo "${bold}What wallpaper do you want to pick${normal}?"
ls ~/Pictures/Wallpapers/
read wallpaper
qdbus org.kde.plasmashell /PlasmaShell org.kde.PlasmaShell.evaluateScript "var allDesktops = desktops();print (allDesktops);for (i=0;i<allDesktops.length;i++) {d = allDesktops[i];d.wallpaperPlugin = 'org.kde.image';d.currentConfigGroup = Array('Wallpaper', 'org.kde.image', 'General');d.writeConfig('Image', 'file:///home/ernest/Pictures/Wallpapers/$wallpaper')}"
echo "${bold}What icon theme do you want to use?${normal}"
ls ~/.local/share/icons/
read iconTheme
/usr/lib/plasma-changeicons $iconTheme
echo "${bold} What folder colour do you want     to use? (black, bluegrey, brown, deeporange, magneta, orange, paleorange, red, violet, yaru, blue, breeze, cyan, green, indigo, nordic, palebrown, pink, teal, white, yellow)${normal}"
read folderColour
papirus-folders -C  $folderColour
if [[ "$wallpaper" == *"dracula"* ]]; then
 wal --theme base16-dracula
elif [[ "$wallpaper" == *"nord"* ]]; then
wal --theme base16-nord
else
wal -i /home/ernest/Pictures/Wallpapers/$wallpaper

fi

