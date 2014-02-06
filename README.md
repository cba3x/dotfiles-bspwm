# bspwm\-git

![The setup](http://i.imgur.com/5zbotPc.jpg)

## Requirements

As of the time of writing these configuration files are designed using the following:

### Required

* [bspwm](https://github.com/baskerville/bspwm)
 * lua
 * lua-posix
* [sxhkd](https://github.com/baskerville/sxhkd)
* [BAR](https://github.com/LemonBoy/bar)
 * [terminus font](http://terminus-font.sourceforge.net/)
* [conky](https://github.com/brndnmtthws/conky)
* [xwinfo](https://github.com/baskerville/xwinfo)
* [xtitle](https://github.com/baskerville/xtitle)
* [trayer](https://code.google.com/p/trayer/)

### Optional

Part of the conky configuration for BAR involves the following programs; as conky is probably one of the biggest parts of this you'll want to customize anyway, consider these vague suggestions.

* xorg-xbacklight for laptop backlight levels
* nvidia-smi for NVIDIA GPU temperatures
* [Weather Underground scripts](https://github.com/iwvelando/conky_wunderground_scripts) for weather conditions
* lm\_sensors for temperatures of individual CPU cores

Additionally the .xinitrc has multiple lines commented that may be of interest; again these are basically vague suggestions.

* xorg-xset for tweaking things like key repeat threshold and backlight timeout

Lastly:

* xorg-xwininfo is used for the bin/wclass utility to extract the window class as needed in bspwm/bspwm\_rules declarations

## Install

Install the above requirements through git or your package manager if available; all of these are available through the [AUR](https://aur.archlinux.org/) for Arch users. Once ready, either manually place the files and edit to your liking or run

```
./install.sh
```

This will backup any files that already exist in the expected locations and create symlinks to the repository.

You'll almost certainly need to do some level of tweaking for your own setup; I've commented several lines throughout the files that may be of interest but especially the bspwm/conkyrc\_bar and .xinitrc are likely to need to be customized. Additionally you'll need to move or symlink the bspwm.desktop file to /usr/share/xsessions/ (this is mentioned when running install.sh) so it gets noticed by your display manager; I run the setup through SLiM but it should be general.

As a final note I've included a simple script bin/wclass that is useful for extracting the window class for use in configuring bspwm/bspwm\_rules. Just run

```
wclass
```

and select the window you want to add a rule for and the output should be the window class.

Please contact me if you run into any issues using this configuration or running install.sh.
