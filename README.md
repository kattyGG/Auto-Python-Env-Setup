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
```

### 2️⃣ 启动 Python 运行环境

运行以下命令，进入 Micromamba 运行环境：

Start_mamba_env_cuda_check.bat

如果 不需要 CUDA 检查，可以运行：

Start_mamba_env_fast.bat

### 3️⃣ 检查 PyTorch 和 CUDA

进入 Micromamba 运行环境后，运行：

python install_check_cuda.py

该脚本将输出：

    Python 解释器路径及版本信息
    PyTorch 版本
    CUDA 是否可用
    CUDA 版本信息

### 4. 运行结果示例

如果 CUDA 和 PyTorch 安装正确：

Python Executable: C:\Users\username\mamba\envs\pytorch\python.exe
Python Version: 3.10.5
Cuda is True
Cuda version - 11.7
Pytorch version - 1.12.0

如果 PyTorch 未安装或 CUDA 不可用：

PyTorch is not installed.
Cuda is False
Cuda version - Not Available

### 5. 依赖要求

    Windows 操作系统
    Micromamba（自动安装）
    Python 3.10（自动安装）
    PyTorch（用户需手动安装）
    CUDA（如果使用 GPU 版本的 PyTorch）

### 6. 许可证

本项目基于 MIT 许可证发布。


---

### **总结**
这个环境 **不会自动安装 PyTorch**，它仅：
1. 安装 **Micromamba** 作为环境管理工具。
2. 创建 **Python 3.10** 运行环境。
3. 启动 Micromamba 环境，并检查 PyTorch + CUDA 的状态。

如果想要使用 PyTorch 和 CUDA，需要手动安装：
```sh
micromamba install pytorch torchvision torchaudio pytorch-cuda=11.7 -c pytorch -c nvidia -c conda-forge

这样，install_check_cuda.py 才能正确检测 CUDA 版本。
