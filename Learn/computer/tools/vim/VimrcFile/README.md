[TOC]

# nvim 安装及插件环境配置

## Neovim install

### macOS

```sh
brew install neovim
```

### Ubuntu

Ubuntu 自己软件源里面 Neovim 的版本太旧,需要添加单独源进行安装

``` sh
# 添加源
sudo add-apt-repository ppa:neovim-ppa/unstable

# 更新源 
sudo apt-get update

# 安装neonvim
sudo apt-get install -y neovim
```

### Arch (Manjaro)

``` sh
sudo pacman -Sy neovim
```

---

## git install

没有 git 寸步难行!! 大部分 Neonvim 插件的代码都是存放在 GitHub 上面的, 需要 git 工具克隆 GitHub 代码到本地.

git 在很多类 Unix 系统里默认已经被安装了,若不确定是否安装,请执行 `git --version` 命令,如果显示 `command not found: git` 之类的提示信息, 就说明没有被安装,请执行如下命令安装

### macOS

``` sh
brew install git
```

### Ubuntu

``` sh
sudo apt-get -y install git
```

### Arch(Manjaro)

``` sh
sudo pacman -Sy git
```

---

## curl install

### macOS

```sh
brew install curl
```

### Ubuntu

```sh
sudo apt-get install -y curl
```

``` sh
sudo pacman -Sy curl
```

---

## nodejs & npm install

插件所需的运行环境

### macOS

``` sh
brew install node
```

### Ubuntu

``` sh
# 添加指定版本的源
curl -sL https://deb.nodesource.com/setup_18.x | sudo -E bash -

# 更新源
sudo apt update

# 安装 nodejs
sudo apt install -y nodejs
```

### Arch (Manjaro)

``` sh
sudo pacman -Sy nodejs
```

---

## yarn install

插件所需的运行环境

``` sh
sudo npm i -g yarn
```

---

## pynvim install

插件所需的运行环境

``` sh
python3 -m pip install pynvim
```

如无法加载, 运行命令 `pip --version` 和 `python3 --version` 查看是否安装了 pip 和 Python3, 没有安装的话, 安装一下就好了

安装方法和 curl 安装方法一致

---


## Github 无法访问

**解决raw.githubusercontent.com无法访问:** 

``` sh
sudo sh -c 'echo "185.199.108.133 raw.githubusercontent.com" >> /etc/hosts'
```

---

## 安装插件管理器


### packer.nvim install

``` sh
git clone --depth 1 https://gitee.com/hello-luiswu/packer.nvim\
 ~/.local/share/nvim/site/pack/packer/start/packer.nvim
```

### vim-plug install

``` sh
sh -c 'curl -fLo "${XDG_DATA_HOME:-$HOME/.local/share}"/nvim/site/autoload/plug.vim --create-dirs \
       https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim'
```
适用于 Linux/Unix 系统

---
