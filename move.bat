@echo off
setlocal enabledelayedexpansion

REM Get the directory from user
set /p dir=Enter the directory containing the images: 

REM Create directories for each camera
for /r "%dir%" %%f in (*.png) do (
  for /f "tokens=2 delims=." %%a in ("%%~nf") do (
    if not exist "%dir%\camera%%a" (
      mkdir "%dir%\camera%%a"
    )
  )
)

REM Move files into corresponding directories
for /r "%dir%" %%f in (*.png) do (
  for /f "tokens=2 delims=." %%a in ("%%~nf") do (
    copy "%%f" "%dir%\camera%%a"
  )
)