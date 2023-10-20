##  使用lua语法配置nvim配置文件

#### lua写的包管理器
使用 [lazy.nvim](https://github.com/folke/lazy.nvim) 的包管理

### GUI使用的字体: [FiraCode Nerd Font](https://www.nerdfonts.com/)

### 当前遇到过的问题
- 在 Windows 环境下 不能使用 `LLVM (Clang)` C编译器
- 推荐使用 Mingw toolchain 
    - 安装命令 `choco install mingw`
        - 需要使用 powershell（管理员） 来进行安装，续提前安装 choco 工具
        ``` shell
        Set-ExecutionPolicy Bypass -Scope Process -Force; [System.Net.ServicePointManager]::SecurityProtocol = [System.Net.ServicePointManager]::SecurityProtocol -bor 3072; iex ((New-Object System.Net.WebClient).DownloadString('https://community.chocolatey.org/install.ps1'))
        ```


#### 当前配置基于[ayamir/nvimdots](https://github.com/ayamir/nvimdots)🙏感谢
