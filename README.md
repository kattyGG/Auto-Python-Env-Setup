# PyTorch CUDA 运行环境配置

本仓库包含一组脚本，可在 Windows 机器上快速搭建 Python 运行环境，并检查 PyTorch 及 CUDA 的安装情况。

---

## **1. 主要安装内容**
运行 **`install_env_v2.bat`** 时，系统将安装：
- **Micromamba**（轻量级 Conda 管理工具）
- **Python 3.10**
- **PyTorch 及相关 CUDA 组件（若用户手动安装）**

---

## **2. 文件说明**

### **（1）`install_env_v2.bat`**
- 下载并安装 **Micromamba**（存放在 `installer_files/mamba/`）。
- 创建 Python 3.10 运行环境（存放在 `installer_files/env/`）。
- 适用于 **首次安装环境** 的用户。

### **（2）`Start_mamba_env_cuda_check.bat`**
- 启动 `install_env_v2.bat` 配置的 Micromamba 运行环境。
- 运行 `install_check_cuda.py` 检查 CUDA 及 PyTorch 版本信息。
- 适用于 **检查 PyTorch 与 CUDA** 的用户。

### **（3）`Start_mamba_env_fast.bat`**
- 直接启动 Micromamba 运行环境（不检查 CUDA）。
- 适用于 **仅需运行 Python 代码** 的用户。

### **（4）`install_check_cuda.py`**
- 检查 **Python 解释器** 及 **版本信息**。
- 检测 **PyTorch 是否安装**。
- 检查 **CUDA 是否可用** 及 **CUDA 版本**。

---

## **3. 使用步骤**

### **1️⃣ 安装运行环境**
如果是首次使用，请运行：
```sh
install_env_v2.bat
