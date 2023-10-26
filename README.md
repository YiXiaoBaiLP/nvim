##  使用lua语法配置nvim配置文件

#### lua写的包管理器
使用 [lazy.nvim](https://github.com/folke/lazy.nvim) 的包管理

### GUI使用的字体: [FiraCode Nerd Font](https://www.nerdfonts.com/)

### 当前遇到过的问题
- 在 Windows 环境下 不能使用 `LLVM (Clang)` C编译器
- 推荐使用 **zig**  
  ` scoop install zig`
- ~~推荐使用 Mingw toolchain~~
    - ~~安装命令 `choco install mingw`~~
        - ~~需要使用 **powershell**（管理员） 来进行安装，需要提前安装 **choco** 工具~~
        ~~``` shell
            Set-ExecutionPolicy Bypass -Scope Process -Force; [System.Net.ServicePointManager]::SecurityProtocol = [System.Net.ServicePointManager]::SecurityProtocol -bor 3072; iex ((New-Object System.Net.WebClient).DownloadString('https://community.chocolatey.org/install.ps1'))
        ``~~
- **安装 scoop 工具**
  - `Invoke-Expression (New-Object System.Net.WebClient).DownloadString('https://get.scoop.sh')`
    > 通过以上命令，可以将Scoop安装到默认目录（C:\Users\<username>\scoop）
  - 或者使用短命令 `iwr -useb get.scoop.sh | iex`
    > 中国用户专享
    > 如果你访问Github有问题，或下载其中的资源有问题，可尝试以下方法：
    > 1. 设置Scoop代理,在命令行中输入（PowerShell或者CMD中都行）`scoop config proxy 127.0.0.1:7890`（一看就是clash用户）让scoop网络连接走代理，后面的ip地址和端口根据自己的代理设置。
    > 2. 使用Gitee镜像源。可能备份更新得不是那么勤快，以及实际下载软件包同样会有网络问题，所以不推荐。在命令行中输入`scoop config SCOOP_REPO https://gitee.com/squallliu/scoop`修改仓库源的地址。



#### 当前配置基于[ayamir/nvimdots](https://github.com/ayamir/nvimdots)🙏感谢
