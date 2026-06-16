hyprpath=/home/$USER/.config/hypr
echo "Ensuring hyprland config directory exists..."
mkdir -p $hyprpath
if [ -s "$hyprpath/hyprland.lua" ]; then 
  echo "hyprland.lua file already exists, renaming to hyprland.lua.old..." && mv "$hyprpath/hyprland.lua" "$hyprpath/hyprland.lua.old"
fi
echo "Creating hyprland.lua file..."
cp ./hyprland.lua "$hyprpath/hyprland.lua"
echo "Creating link to other config files..."
ln -s ./ config && mv config "$hyprpath/config"
echo "Script finished."
