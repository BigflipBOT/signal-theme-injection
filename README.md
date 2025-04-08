# How to make and apply signal custom themes (on linx)
Generally speaking, your electron package you download, contains asar archive, witch you have to unpack, inject your theme css into a file, and repack it. In this gist I will show you how you can do that. There is also a script to do that all automaticly

## Extracting main css file
Signal package usually resides in `/usr/lib/signal-desktop/resources` directory. Inside of it there is a file called app.asar witch is an electron archive. Asar app is needed to unpack it, so make sure you installed it. Unpack archive to some directory with command `asar e <path-to-app.asar> <path-to-extract-to>` for example `asar e /usr/lib/signal-desktop/resources/app.asar .`.

## Injecting css
Now when you have your app unpacked, you have access to `stylesheets/manifest.css`. You can edit this file with values you want or add an import **after the @charset** line. If you want to go with the second option you can do it by inserting following line: `@import "<your-theme.css>";` and placing your theme in the `stylesheets` folder. If you are wondering about what values change what, you can get inspierd by this [catppuccin theme](https://github.com/CalfMoon/signal-desktop/blob/main/themes/catppuccin-latte.css).

## Repacking files
After the injection, you can repack all files and replace your app.asar file. You will need sudo for that. If you are in a directory with your unpacked files you can do that by executting the command `sudo asar p . /usr/lib/signal-desktop/resources/app.asar`. You should turn off your signal-desktop app for this operation.

## Automatic script
If you want all that automated, you can use script provided with this repo. It was based on [this](https://github.com/CapnSparrow/signal-desktop-themes), and [this](https://github.com/CalfMoon/signal-desktop/tree/main). <br/>
To run it do `chmod +x injector.sh` and `./injector.sh <path-to-your-theme-css>`. <br/>
Remember you have to have asar installed. If for some reason paht to your signal directory is diffrent (in eg. you installed with flatpack), change your SIGNAL_DIR variable in script accordingly.
