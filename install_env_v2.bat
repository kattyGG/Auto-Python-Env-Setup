@echo off

cd /D "%~dp0"

set MAMBA_ROOT_PREFIX=%cd%\installer_files\mamba
set INSTALL_ENV_DIR=%cd%\installer_files\env
set HTTPS_PROXY=127.0.0.1:10602
set MICROMAMBA_DOWNLOAD_URL=https://github.com/mamba-org/micromamba-releases/releases/download/1.4.0-0/micromamba-win-64

set PATH=%PATH%;%SystemRoot%\system32

set PACKAGES_TO_INSTALL=python=3.10
set CHANNEL=-c pytorch -c nvidia -c conda-forge

@rem check if micromamba exists
call "%MAMBA_ROOT_PREFIX%\micromamba.exe" --version >nul 2>&1
if "%ERRORLEVEL%" NEQ "0" (
    echo "Downloading Micromamba from %MICROMAMBA_DOWNLOAD_URL% to %MAMBA_ROOT_PREFIX%\micromamba.exe"
    mkdir "%MAMBA_ROOT_PREFIX%"
    curl -Lk "%MICROMAMBA_DOWNLOAD_URL%" -o "%MAMBA_ROOT_PREFIX%\micromamba.exe" || ( echo. && echo Micromamba failed to download. && goto end )
    echo Micromamba version:
    call "%MAMBA_ROOT_PREFIX%\micromamba.exe" --version || ( echo. && echo Micromamba not found. && goto end )
)

@rem create micromamba hook
if not exist "%MAMBA_ROOT_PREFIX%\condabin\micromamba.bat" (
    call "%MAMBA_ROOT_PREFIX%\micromamba.exe" shell hook >nul 2>&1
)

@rem Check if environment is already created
if not exist "%INSTALL_ENV_DIR%\python.exe" (
    echo "Creating environment..."
    call "%MAMBA_ROOT_PREFIX%\micromamba.exe" create -y --prefix "%INSTALL_ENV_DIR%" %CHANNEL% %PACKAGES_TO_INSTALL% || ( echo. && echo Environment creation failed. && goto end )
) else (
    echo "Environment already created. Skipping creation step..."
)

@rem activate installer env
call "%MAMBA_ROOT_PREFIX%\condabin\micromamba.bat" activate "%INSTALL_ENV_DIR%" || ( echo. && echo MicroMamba hook not found. && goto end )

:end
pause
