@echo off
cd /D "%~dp0"

set MAMBA_ROOT_PREFIX=%cd%\installer_files\mamba
set INSTALL_ENV_DIR=%cd%\installer_files\env

@rem 激活 micromamba 环境
call "%MAMBA_ROOT_PREFIX%\condabin\micromamba.bat" activate "%INSTALL_ENV_DIR%"

@rem 设置 SOCKS5 代理
set "http_proxy=socks5://127.0.0.1:10601"
set "https_proxy=socks5://127.0.0.1:10601"

@rem 保持命令行窗口打开
cmd /k
