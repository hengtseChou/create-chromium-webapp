# How to create an icon

### 1.

Download app icon with png format and transparent background.

<img src="https://i.imgur.com/myCTcjr.png" alt="img1" width="300" height="300">

### 2.

Crop it as a squared icon with no padding. (Recommend tool: gthumb)

<img src="https://i.imgur.com/1bg8xrC.png" alt="img2" width="300" height="300">

### 3.

Adjust it with imagemagick command

```
magick ICON.png -background transparent -gravity center -scale 216x216 -extent 256x256 ICON.png
```

<img src="https://i.imgur.com/uCr1frw.png" alt="img2" width="300" height="300">

Done!
