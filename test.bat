@echo off
SET /P dir=Please enter the directory containing the images: 
cd %dir%

:: Assuming the images are in jpg format and are named in a sequence like img001.jpg, img002.jpg, etc.
:: Adjust the below command to fit your specific needs
:: This creates a video named output.mp4 with a framerate of 30
ffmpeg.exe -framerate 24 -i step%d.camera1.png -c:v libx264 -pix_fmt yuv420p output.mp4