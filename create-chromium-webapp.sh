#!/bin/bash
help() {
    echo "Usage: $0 --name <app_name> --url <app_url>"
    echo "  --name: Name of the webapp"
    echo "  --url: URL of the webapp"
    exit 1
}

if ! command -v chromium 2>&1 >/dev/null; then
    echo ":: error: chromium is not installed. exiting."
    exit 1
fi

app_name=""
app_url=""

while [[ "$#" -gt 0 ]]; do
    case "$1" in
    --name)
        app_name="$2"
        shift 2
        ;;
    --url)
        app_url="$2"
        shift 2
        ;;
    --)
        shift
        break
        ;;
    *)
        echo "Error: Invalid option $1"
        echo "Usage: $0 --name <name> --url <url>"
        exit 1
        ;;
    esac
done

# Check if both arguments are provided
if [[ -z "$app_name" || -z "$app_url" ]]; then
    help
    exit 1
fi

if [ ! -f "$HOME/.icons/$app_name.png" ]; then
    echo ":: error: $app_name.png is not installed in ~/.icons. exiting."
    exit 1
fi

if [ -z "$app_name" ] || [ -z "$app_url" ]; then
    echo help
    exit 1
fi

chromium=$(which chromium)
cp template.desktop $app_name.desktop
sed -i "s|NAME|$app_name|g" $app_name.desktop
sed -i "s|URL|$app_url|g" $app_name.desktop
sed -i "s|CHROMIUM|$chromium|g" $app_name.desktop
mv $app_name.desktop $HOME/.local/share/applications/$app_name.desktop
update-desktop-database $HOME/.local/share/applications

echo ":: $0: succeeded."
