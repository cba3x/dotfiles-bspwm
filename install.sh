#!/bin/bash

echo ">>> Beginning config"
echo ">>> The default config was designed around a dual 1920x1080 monitor setup; several lines are commented throughout various files that are friendlier for a 1600x900 laptop"
echo ">>> See https://github.com/iwvelando/dotfiles-bspwm for details on the relevant lines"

thisDir="$( cd "$( dirname "${BASH_SOURCE[0]}" )" && pwd )"
bspwmDir="$HOME/.config/bspwm"
sxhkdDir="$HOME/.config/sxhkd"
binDir="$HOME/bin"

# Make sure relevant directories exist; make them if not and notify the user
[ ! -d "$bspwmDir" ] && mkdir -vp "$bspwmDir"
[ ! -d "$sxhkdDir" ] && mkdir -vp "$sxhkdDir"
[ ! -d "$binDir" ] && mkdir -vp "$binDir"

# Temporarily add $binDir to PATH if it's not there and notify the user to modify their config
[ $( echo $PATH | grep -v "$binDir" ) ] && PATH="$binDir:$PATH" && echo ">>> $binDir added to \$PATH; make this permanent in your configuration"

# Create symlinks; check if the targets already exist and if so rename them
[ -f "$bspwmDir/bspwmrc" ] && mv -v "$bspwmDir/bspwmrc" "$bspwmDir/bspwmrc.original"
[ -f "$bspwmDir/bspwm_rules" ] && mv -v "$bspwmDir/bspwm_rules" "$bspwmDir/bspwm_rules.original"
[ -f "$bspwmDir/conkyrc_bar" ] && mv -v "$bspwmDir/conkyrc_bar" "$bspwmDir/conkyrc_bar.original"
[ -f "$bspwmDir/panel_bar" ] && mv -v "$bspwmDir/panel_bar" "$bspwmDir/panel_bar.original"
[ -f "$sxhkdDir/sxhkdrc" ] && mv -v "$sxhkdDir/sxhkdrc" "$sxhkdDir/sxhkdrc.original"
[ -f "$HOME/.xinitrc" ] && mv -v "$HOME/.xinitrc" "$HOME/.xinitrc.original"
[ -f "$HOME/.Xresources" ] && mv -v "$HOME/.Xresources" "$HOME/.Xresources.original"

ln -sv "$thisDir/bspwm/bspwmrc" "$bspwmDir/bspwmrc"
ln -sv "$thisDir/bspwm/bspwm_rules" "$bspwmDir/bspwm_rules"
ln -sv "$thisDir/bspwm/conkyrc_bar" "$bspwmDir/conkyrc_bar"
ln -sv "$thisDir/bspwm/panel_bar" "$bspwmDir/panel_bar"
ln -sv "$thisDir/sxhkd/sxhkdrc" "$sxhkdDir/sxhkdrc"
ln -sv "$thisDir/bspwm/.xinitrc" "$HOME/.xinitrc"
ln -sv "$thisDir/bspwm/.Xresources" "$HOME/.Xresources"

# In this case leave any existing files
[ ! -f "$binDir/rulc" ] && ln -sv "$thisDir/bin/rulc" "$binDir/rulc"
[ ! -f "$binDir/ruld" ] && ln -sv "$thisDir/bin/ruld" "$binDir/ruld"
[ ! -f "$binDir/rule_command" ] && ln -sv "$thisDir/bin/rule_command" "$binDir/rule_command"

echo ">>> Execute the following command as root to add the bspwm entry to your display manager provided it searches /usr/share/xsessions"
echo
echo "ln -sv $thisDir/bspwm.desktop /usr/share/xsessions/bspwm.desktop"
echo
echo ">>> All done! Please remember that every configuration file here has system-specific settings included how many monitors you have, resolution, fonts, certain programs for fetching system info, etc; please consider reviewing everything to suit your system"
