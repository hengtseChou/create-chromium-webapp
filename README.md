# Chromium App Mode Shortcut

Add desktop entries for you favorite web apps with chromium!

This script is made for Linux only.

## Preliminary

Must have chromium installed.

## Usage

First, place an icon in `~/.icons` and rename it by the app's name.

Then simply run the following commands

```
git clone https://github.com/hengtseChou/create-chromium-webapp.git
cd create-chromium-webapp
./create-chromium-webapp.sh --name $APP_NAME --url $APP_URL
```

## Examples

`icons` contains several ready-to-go icons, for example, one can install Netflix with the following commands.

```
# cd create-chromium-webapp
mkdir -p ~/.icons
cp icons/Netflix.png ~/.icons
./create-chromium-webapp.sh --name "Netflix" --url "https://netflix.com"
```

