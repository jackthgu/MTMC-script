@echo off
setlocal EnableDelayedExpansion

REM Get the path from the user
set /p "path=Enter the path of the image sequences: "

REM Get the number of cameras from the user
set /p "num_cameras=Enter the number of cameras: "

REM Loop over each camera
for /L %%i in (1, 1, %num_cameras%) do (
    REM Create a video from the image sequence for this camera
    ffmpeg -framerate 30 -i "%path%\step*.camera%%i.png" -c:v libx264 -r 30 -pix_fmt yuv420p "%path%\output_camera%%i.mp4"
)

echo Done.
pause
