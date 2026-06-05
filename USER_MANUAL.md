# Cookvim 用户使用手册

> **适用环境**：Fedora + Ghostty 终端  
> **基于**：Lazy.nvim 插件管理器  
> **项目地址**：`https://github.com/Youthdreamer/nvim`

---

## 目录

1. [环境准备](#1-环境准备)
2. [安装 Neovim](#2-安装-neovim)
3. [安装 Cookvim 配置](#3-安装-cookvim-配置)
4. [首次启动](#4-首次启动)
5. [插件体系总览](#5-插件体系总览)
6. [完整快捷键速查表](#6-完整快捷键速查表)
7. [核心功能详解](#7-核心功能详解)
   - 7.1 [启动仪表盘 (Alpha)](#71-启动仪表盘-alpha)
   - 7.2 [文件查找 (Telescope)](#72-文件查找-telescope)
   - 7.3 [文件树 (Neo-tree)](#73-文件树-neo-tree)
   - 7.4 [文件管理 (Mini-files)](#74-文件管理-mini-files)
   - 7.5 [模糊跳转 (Flash)](#75-模糊跳转-flash)
   - 7.6 [主题系统](#76-主题系统)
   - 7.7 [LSP 语言服务器](#77-lsp-语言服务器)
   - 7.8 [代码补全 (Blink)](#78-代码补全-blink)
   - 7.9 [代码格式化 (Conform)](#79-代码格式化-conform)
   - 7.10 [语法高亮 (Treesitter)](#710-语法高亮-treesitter)
   - 7.11 [Git 集成](#711-git-集成)
   - 7.12 [缓冲区管理](#712-缓冲区管理)
   - 7.13 [代码大纲 (Aerial)](#713-代码大纲-aerial)
8. [会话管理 (Persistence)](#8-会话管理-persistence)
9. [其他工具插件](#9-其他工具插件)
10. [Neovide GUI（可选）](#10-neovide-gui可选)
11. [常见问题 FAQ](#11-常见问题-faq)

---

## 1. 环境准备

### 1.1 系统依赖

在 Fedora 终端中依次安装以下依赖：

```bash
# 基础编译工具链
sudo dnf install -y gcc gcc-c++ make

# Node.js（LSP 和前端工具需要）
sudo dnf install -y nodejs npm

# Python
sudo dnf install -y python3 python3-pip

# 搜索工具（Telescope 核心依赖）
sudo dnf install -y ripgrep fd-find

# 解压工具（Mason 安装 LSP 时需要）
sudo dnf install -y unzip p7zip p7zip-plugins

# Lazygit（Git 图形化操作）
sudo dnf install -y lazygit
```

### 1.2 安装 Nerd Font（图标字体）

> **必须安装**，否则文件树图标、状态栏图标将显示为乱码。

```bash
# 下载并安装 JetBrainsMono Nerd Font
mkdir -p ~/.local/share/fonts
cd /tmp
wget https://github.com/ryanoasis/nerd-fonts/releases/download/v3.3.0/JetBrainsMono.zip
unzip JetBrainsMono.zip -d ~/.local/share/fonts/
fc-cache -fv
```

### 1.3 Ghostty 终端配置

在 Ghostty 配置文件中设置 Nerd Font：

```bash
# 编辑 Ghostty 配置文件
mkdir -p ~/.config/ghostty
cat > ~/.config/ghostty/config << 'EOF'
font-family = JetBrainsMono Nerd Font
font-size = 13
theme = catppuccin-macchiato
EOF
```

> 重启 Ghostty 后，菜单栏或底部应能看到带有图标的字体效果。

---

## 2. 安装 Neovim

Fedora 官方源可能不是最新版，推荐使用开发版或稳定版 PPA：

```bash
# 方式一：使用官方稳定版（推荐）
sudo dnf install -y neovim

# 方式二：使用最新开发版（功能最新）
# wget https://github.com/neovim/neovim/releases/download/stable/nvim.appimage
# chmod u+x nvim.appimage && sudo mv nvim.appimage /usr/local/bin/nvim

# 验证版本（需要 >= 0.10.0）
nvim --version
```

---

## 3. 安装 Cookvim 配置

```bash
# 1. 备份原有配置（如果有）
mv ~/.config/nvim ~/.config/nvim.bak 2>/dev/null

# 2. 克隆 Cookvim 配置
git clone https://github.com/Youthdreamer/nvim ~/.config/nvim
```

---

## 4. 首次启动

```bash
# 在 Ghostty 中运行
nvim
```

首次启动会自动完成以下步骤：

1. **自动安装 Lazy.nvim** — 插件管理器自动从 GitHub 克隆
2. **自动安装所有插件** — Lazy.nvim 根据配置安装约 40+ 个插件
3. **自动安装 Treesitter 解析器** — C/C++、Lua、Python、Rust 等语法解析器
4. **自动安装 Mason LSP 服务器** — 根据 `servers.lua` 中配置的语言列表

> 首次启动需要等待 2-5 分钟，取决于网络速度。后续启动约 0.5-1 秒。

---

## 5. 插件体系总览

| 分类 | 插件 | 功能 |
|------|------|------|
| **编辑器增强** | neo-tree | 文件树侧边栏 |
| | mini-files | 文件管理（支持批量操作） |
| | mini-indentscope | 缩进范围可视化动画 |
| | indent-blankline | 缩进参考线 |
| | autopairs | 自动配对括号/引号 |
| | rainbow-delimiters | 彩虹括号 |
| | treesitter | 语法高亮 & 代码解析 |
| | aerial | 代码大纲/符号列表 |
| **UI 美化** | alpha-nvim | 启动仪表盘 |
| | lualine | 底部状态栏 |
| | bufferline | 缓冲区标签页 |
| | noice | 增强通知/命令行 |
| | notify | 通知引擎 |
| | devicons | 文件图标 |
| | transparent | 透明背景切换 |
| **导航搜索** | telescope | 模糊查找器（文件/内容/符号） |
| | which-key | 快捷键提示弹出 |
| | flash | 快速跳跃定位 |
| | harpoon | 快速文件书签 |
| **LSP 开发** | mason | LSP/格式化工具安装管理器 |
| | lspconfig | LSP 客户端配置 |
| | blink | 代码补全引擎 |
| | conform | 自动格式化（保存时） |
| | fidget | LSP 进度通知 |
| **Git 集成** | gitsigns | Git 状态标记 & inline blame |
| | lazygit | Git 图形化界面 |
| **主题系统** | 15 个主题插件 | 60+ colorscheme 变体 |
| **工具** | persistence | 会话持久化 |
| | markdown-preview | Markdown 浏览器预览 |
| | colorizer | 颜色代码预览 |
| | crates | Rust crate 版本提示 |
| | obsess | 专注计时器 |

---

## 6. 完整快捷键速查表

> `<leader>` = **空格键** (`Space`)

### 6.1 通用操作

| 快捷键 | 功能 |
|--------|------|
| `<leader>qq` | 保存并退出 |
| `<C-s>` | 保存文件 |
| `j` / `k` | 按显示行移动（处理换行） |
| `<A-j>` / `<A-k>` | 上移/下移当前行 |
| `<A-j>` / `<A-k>` (可视模式) | 上移/下移选中块 |

### 6.2 文件查找 — `<leader>f` 系列

| 快捷键 | 功能 |
|--------|------|
| `<leader>ff` | 查找文件（按文件名） |
| `<leader>fg` | 全局搜索（搜索文件内容） |
| `<leader>fs` | 快速搜索当前单词 |
| `<leader>fr` | 高级搜索（带参数过滤） |
| `<leader>fb` | 查看打开的文件列表 |
| `<leader>fo` | 查看历史打开的文件 |
| `<leader>fp` | 切换项目 |
| `<leader>fk` | 快捷键查询 |
| `<leader>H` | 帮助文档查询 |

### 6.3 文件树 & 文件管理

| 快捷键 | 功能 |
|--------|------|
| `<leader>e` | 打开/关闭 Neo-tree 侧边栏 |
| `-` | 打开 Mini-files 文件管理器 |

### 6.4 LSP 代码操作 — `<leader>c` 系列

| 快捷键 | 功能 |
|--------|------|
| `<leader>ca` | 代码操作（快速修复/重构建议） |
| `<leader>cd` | 当前行诊断详情（浮动窗口） |
| `<leader>ce` | 当前文件所有诊断 |
| `<leader>cW` | 全局诊断 |
| `<leader>cf` | 文件大纲（当前文件符号） |
| `<leader>ci` | 查找接口/方法实现 |
| `<leader>cr` | 查找所有引用 |
| `<leader>cw` | 工作区符号搜索 |
| `<leader>c[` | 被调列表（谁调用了这个函数） |
| `<leader>c]` | 调用列表（这个函数调用了谁） |
| `<leader>cR` | 重命名符号 |

### 6.5 缓冲区操作 — `<leader>b` 系列

| 快捷键 | 功能 |
|--------|------|
| `<leader>bb` | 快速切换缓冲区 |
| `<leader>bd` | 删除当前缓冲区 |
| `<leader>bf` | 查询并跳转缓冲区 |
| `<leader>bo` | 删除其他缓冲区 |
| `<leader>bp` | 切换缓冲区固定状态 |
| `<leader>bP` | 删除未固定的缓冲区 |

### 6.6 窗口操作

| 快捷键 | 功能 |
|--------|------|
| `<C-Up>` / `<C-Down>` | 增加/减少窗口高度 |
| `<C-Left>` / `<C-Right>` | 减少/增加窗口宽度 |
| `<leader>wH` | 窗口移到最左 |
| `<leader>wJ` | 窗口移到最底 |
| `<leader>wK` | 窗口移到最顶 |
| `<leader>wL` | 窗口移到最右 |

### 6.7 标签页 — `<leader><tab>` 系列

| 快捷键 | 功能 |
|--------|------|
| `<leader><tab><tab>` | 新建标签页 |
| `<leader><tab>d` | 关闭当前标签页 |
| `<leader><tab>o` | 关闭其他标签页 |
| `<leader><tab>l` | 下一个标签页 |
| `<leader><tab>h` | 上一个标签页 |

### 6.8 Telescope 窗口内快捷键

| 快捷键 | 功能 |
|--------|------|
| `<A-s>` | 在水平分屏中打开 |
| `<A-v>` | 在垂直分屏中打开 |
| `<A-t>` | 在新标签页中打开 |
| `<C-j/k>` | 上下移动选择 |
| `<Esc>` | 关闭 Telescope 窗口 |

### 6.9 Git 操作

| 快捷键 | 功能 |
|--------|------|
| `<leader>gg` | 打开 Lazygit 图形界面 |
| `<leader>gh` | 暂存当前 hunk（代码块） |
| `<leader>gH` | 取消暂存当前 hunk |
| `<leader>gS` | 暂存整个文件 |
| `<leader>gU` | 取消暂存整个文件 |
| `<leader>gR` | 重置当前 hunk |
| `<leader>gs` | 预览当前 hunk 变更 |
| `<leader>gb` | `git blame` 当前行 |
| `<leader>gB` | `git blame` 当前文件 |
| `<leader>gd` | `git diff` 当前文件 |
| `<leader>gD` | `git diff` 暂存区 |
| `]h` / `[h` | 跳转到下一个/上一个 hunk |

### 6.10 Markdown & 文档

| 快捷键 | 功能 |
|--------|------|
| `<leader>p` | Markdown / Typst 浏览器预览 |

### 6.11 其他

| 快捷键 | 功能 |
|--------|------|
| `<leader>T` | 打开主题切换器 |
| `<leader>o` | 打开专注面板（Obsess 计时器） |

---

## 7. 核心功能详解

### 7.1 启动仪表盘 (Alpha)

打开 Neovim（不带文件名）时，会显示 Cookvim 仪表盘：

```
       ██████╗ ██████╗  ██████╗ ██╗  ██╗
      ██╔════╝██╔═══██╗██╔═══██╗██║ ██╔╝
      ██║     ██║   ██║██║   ██║█████╔╝
      ██║     ██║   ██║██║   ██║██╔═██╗
      ╚██████╗╚██████╔╝╚██████╔╝██║  ██╗
       ╚═════╝ ╚═════╝  ╚═════╝ ╚═╝  ╚═╝
      ┌────────────────────────────────┐
      |        Now, Say My Name.       |
      └────────────────────────────────┘

   p   查看项目
   f   查找文件
   n   新建文件
   s   恢复会话
   m   查看会话
   l   Lazy (插件管理)
   q   退出
```

仪表盘上直接按对应按键即可执行操作。

---

### 7.2 文件查找 (Telescope)

Telescope 是 Cookvim 的核心导航引擎，基于 `ripgrep` 和 `fd`：

**使用 `<leader>ff` 查找文件**：

1. 按下 `<leader>ff`
2. 输入文件名关键词（支持模糊匹配）
3. 按 `Enter` 打开文件

**使用 `<leader>fg` 全局搜索内容**：

1. 按下 `<leader>fg`
2. 输入搜索关键词（支持正则表达式）
3. 实时刷新匹配结果
4. 按 `Enter` 跳转到该行

**Telescope 项目切换 (`<leader>fp`)**：

自动扫描 `~/Projects/`（可配置）下的 Git 项目，支持快速切换工作目录。

---

### 7.3 文件树 (Neo-tree)

- 按 `<leader>e` 打开/关闭左侧文件树
- 窗口位置：左侧，宽度 30 列
- **自动跟踪**：编辑时自动展开到当前文件
- **Git 状态图标**：显示新增/修改/删除/冲突等状态
- **支持的操作**：`a` 新建文件，`d` 删除，`r` 重命名，`m` 移动

---

### 7.4 文件管理 (Mini-files)

按 `-` 在当前目录打开文件管理器：

- 直接在文件管理器中编辑和操作文件
- 支持多文件批量操作
- 打开预览窗口

---

### 7.5 模糊跳转 (Flash)

用于快速跳转到可视区域内的任意位置：

- 搜索触发后，目标位置会显示标签字母
- 输入标签字母即可跳转
- 比鼠标和多次 `j`/`k` 快得多

---

### 7.6 主题系统

Cookvim 管理了一个包含 **60+ 个 colorscheme 变体**的主题系统。

#### 切换主题

- **快捷键**：`<leader>T`
- **命令**：`:ThemeSwitch`

> 执行后会弹出 Telescope 选择器，实时预览和选择主题。

#### 切换 UI 样式

`:ThemeSwitch` 支持参数自定义窗口样式：

```vim
:ThemeSwitch theme=ivy          " 底部输入样式
:ThemeSwitch theme=dropdown     " 下拉菜单样式
:ThemeSwitch theme=cursor       " 光标附近弹出
:ThemeSwitch width=0.8 height=0.5  " 自定义窗口大小
```

#### 主题持久化

- 当前主题自动保存到 `~/.local/share/nvim/theme`
- 下次启动 Neovim 时自动恢复上次的主题
- 无论通过任何方式切换主题（命令、脚本、插件），都会自动记录

#### 当前已安装的主题

| 主题插件 | 可用变体 |
|----------|----------|
| tokyonight | night, storm, day, moon |
| catppuccin | latte, frappe, macchiato, mocha |
| github-theme | 11 个 github 风格变体 |
| nightfox | nightfox, dayfox, dawnfox, duskfox, nordfox, terafox, carbonfox |
| kanagawa | wave, dragon, lotus |
| rose-pine | rose-pine, rose-pine-main, rose-pine-moon, rose-pine-dawn |
| monokai-pro | 7 个 monokai 变体 |
| dracula | dracula, dracula-soft |
| nord | nord |
| gruvbox | gruvbox |
| ayu | ayu-dark, ayu-light, ayu-mirage |
| onedark | onedark |
| nordic | nordic |
| poimandres | poimandres |
| vague | vague |

---

### 7.7 LSP 语言服务器

通过 Mason 自动管理 LSP 服务器的安装。

#### 当前已配置的 LSP

| 语言 | LSP Server | 说明 |
|------|-----------|------|
| C/C++ | `clangd` | 代码补全、诊断、格式化 |
| Rust | `rust_analyzer` | 完整 Rust 开发支持，含 clippy 检查 |
| Lua | `lua_ls` | Neovim 配置开发支持 |
| Python | `basedpyright` + `ruff` | 类型检查 + 代码规范检查 |
| JavaScript/TypeScript | `ts_ls` | JS/TS 补全和类型提示 |
| HTML | `html` | HTML 支持 |
| CSS | `cssls` | CSS 支持 |
| Emmet | `emmet_ls` | 快速编写 HTML/CSS |
| TailwindCSS | `tailwindcss` | Tailwind 类名补全 |
| YAML | `yamlls` | YAML 验证和补全 |
| Markdown | `marksman` | Markdown 引用和补全 |
| Typst | `tinymist` | Typst 论文排版 |

#### 安装其他语言的 LSP

编辑 `~/.config/nvim/lua/plugins/lsp/config/servers.lua`，取消注释对应行或添加新配置：

```lua
-- 例如启用 Go 支持
gopls = {},
```

保存后重启 Neovim，Mason 会自动安装。

#### LSP 管理命令

```vim
:Mason              " 打开 Mason 管理界面，查看/安装/卸载 LSP
:LspInfo            " 查看当前文件 LSP 连接状态
```

---

### 7.8 代码补全 (Blink)

输入代码时自动弹出补全菜单：

- **自动触发**：输入 2 个字符后自动弹窗
- **智能排序**：LSP 补全优先于单词补全
- **片段支持**：函数调用自动生成参数占位
- **Ghost 文本**：显示 AI 补全预览（需外部 AI 源）

补全窗口内的操作：

| 快捷键 | 功能 |
|--------|------|
| `<Tab>` / `<Enter>` | 选择补全项 |
| `<C-j>` / `<C-k>` | 上下移动选择 |
| `<C-b>` / `<C-f>` | 文档翻页 |
| `<C-space>` | 手动触发补全 |

---

### 7.9 代码格式化 (Conform)

**保存文件时自动格式化**，开箱即用。

#### 各语言当前的格式化工具

| 语言 | 格式化工具 |
|------|-----------|
| C/C++ | `clang-format` |
| Rust | `rustfmt`（系统自带） |
| Lua | `stylua` |
| Python | `ruff_fix` + `ruff_format` + `ruff_organize_imports` |
| JavaScript/TypeScript | `eslint_d` + `prettierd` |
| HTML/CSS/SCSS | `prettierd` |
| JSON/YAML/Markdown | `prettierd` |
| TOML | `taplo` |
| Typst | `typstyle` |

#### 管理方式

- **Mason 管理**（自动安装）：clang-format, stylua, eslint_d, prettierd, taplo, typstyle
- **系统自带**：rustfmt, ruff

#### 格式化配置

编辑 `~/.config/nvim/lua/plugins/lsp/config/formatters.lua`：

```lua
-- 修改 Lua 的格式化工具
lua = { "stylua" },

-- 为指定文件类型添加/修改格式化器
-- 注意：Mason 管理的工具放在 M.mason 表中
--      非 Mason 的工具放在 M.custom 表中
```

#### 手动格式化

```vim
:Format     " 手动格式化当前文件
```

---

### 7.10 语法高亮 (Treesitter)

Treesitter 提供精确的语法高亮和代码解析：

- **自动安装**：打开新类型文件时自动下载对应解析器
- **缩进指南**：基于语法树的精确缩进线
- **代码折叠**：基于语法的智能折叠
- **增量选择**：按语法节点扩展/缩小选择

---

### 7.11 Git 集成

#### Gitsigns — 行内 Git 标记

- **左侧 Gutter**：显示 `+`（新增）、`~`（修改）、`-`（删除）
- **Blame 信息**：`<leader>gb` 查看当前行的提交信息
- **Hunk 操作**：`<leader>gh` 暂存、`<leader>gR` 重置
- **导航**：`]h` / `[h` 在 hunks 之间跳转

#### Lazygit — 图形化 Git 界面

`<leader>gg` 在 Neovim 内嵌打开 Lazygit：

- 完整的 Git 操作界面（暂存、提交、推送、分支、rebase）
- 浮窗显示，不离开 Neovim
- 操作完成后 `<Esc>` 回到 Neovim

---

### 7.12 缓冲区管理

#### Bufferline — 缓冲区标签页

顶部显示所有打开的缓冲区标签：

- 点击标签切换（需要鼠标支持）
- 显示 Git 修改状态
- 修改后的文件标签有特殊标记

#### 缓冲区操作快捷键

`<leader>bb` 弹出缓冲区列表，快速切换：

```
1. 按 <leader>bb
2. 输入文件名模糊匹配
3. Enter 跳转
```

---

### 7.13 代码大纲 (Aerial)

`<leader>cf` 或打开 Aerial 窗口，显示当前文件的代码结构（函数、类、变量列表）。

- 点击跳转到对应代码位置
- 实时跟随光标位置高亮
- 支持多种语言

---

## 8. 会话管理 (Persistence)

自动保存和恢复编辑会话：

- **保存位置**：`~/.local/share/nvim/sessions/`
- **按分支管理**：同一项目的不同 Git 分支有独立会话
- **保存内容**：打开的缓冲区列表、窗口布局、光标位置

#### 操作方式

| 方式 | 操作 |
|------|------|
| 仪表盘 `s` | 恢复上次会话 |
| 仪表盘 `m` | 从已保存会话中选择 |
| `:SessionSave` | 手动保存当前会话 |
| `:SessionLoad` | 加载指定会话 |

---

## 9. 其他工具插件

### Markdown 预览 (`<leader>p`)

在浏览器中实时预览 Markdown 或 Typst 文档。

```vim
:MarkdownPreview     " 启动预览
:MarkdownPreviewStop " 停止预览
```

### Colorizer — 颜色代码预览

在 CSS/HTML/Lua 等文件中，自动高亮颜色代码（`#ff0000`、`rgb(255,0,0)` 等）以实际颜色显示。

### Crates — Rust Crate 版本提示

在 Rust 项目的 `Cargo.toml` 中，自动检查 crate 版本，显示是否有更新可用。

### Obsess — 专注计时器

`<leader>o` 打开专注面板，类似番茄钟工具，帮助跟踪编码时间。

### Transparency — 透明背景

`:TransparentToggle` 切换编辑器透明背景。

---

## 10. Neovide GUI（可选）

如果在 Neovide 中打开 Cookvim，会自动加载 GUI 专属配置：

```lua
-- 自动检测到 Neovide 环境后加载
-- lua/neovide/basic.lua  — 动画、字体、透明度设置
-- lua/neovide/keymap.lua — GUI 专属快捷键（如缩放）
```

终端 Ghostty 环境下不会加载这些配置，两者互不干扰。

---

## 11. 常见问题 FAQ

### Q1: 文件图标显示为方框/乱码？

**原因**：未安装 Nerd Font 或 Ghostty 未配置 Nerd Font 字体。

**解决**：参考 [1.2 安装 Nerd Font](#12-安装-nerd-font图标字体) 和 [1.3 Ghostty 配置](#13-ghostty-终端配置)。

---

### Q2: 首次启动插件安装失败？

```bash
# 手动重新安装所有插件
nvim +Lazy +:Lazy sync
```

---

### Q3: Telescope 搜索很慢？

**原因**：可能在大目录（如 `node_modules`）中搜索。

**解决**：在项目根目录添加 `.fdignore` 或 `.gitignore`：

```bash
echo "node_modules" >> .fdignore
echo ".git" >> .fdignore
```

---

### Q4: 某一语言的代码补全不工作？

**检查步骤**：

1. 确认 LSP server 已安装：`:Mason`
2. 确认 LSP 已连接：`:LspInfo`
3. 确认配置文件存在：检查 `~/.config/nvim/lua/plugins/lsp/config/servers.lua`

---

### Q5: 想要添加/移除某个语言的支持？

编辑 `servers.lua` 和 `formatters.lua`，然后重启 Neovim。

---

### Q6: 如何更新所有插件？

```vim
:Lazy update          " 更新所有插件
:Lazy sync            " 同步插件状态
:Lazy clean           " 清理不再使用的插件
```

---

### Q7: 透明背景不生效？

```vim
:TransparentToggle    " 切换透明/不透明

-- 或者手动设置
:hi Normal guibg=NONE
```

---

### Q8: 快捷键冲突怎么办？

1. 按 `<leader>fk` 查看所有快捷键
2. 编辑 `~/.config/nvim/lua/core/keymap.lua` 修改对应快捷键
3. 保存后重启 Neovim

---

### Q9: 如何重置所有配置？

```bash
# 删除 Cookvim 配置和插件
rm -rf ~/.config/nvim
rm -rf ~/.local/share/nvim
rm -rf ~/.local/state/nvim
rm -rf ~/.cache/nvim

# 重新克隆
git clone https://github.com/Youthdreamer/nvim ~/.config/nvim
nvim
```

---

### Q10: Ghostty 下的颜色显示不对？

确认 Ghostty 配置中未覆盖颜色设置，并确保 Neovim 配置中启用了真彩色：

```lua
-- ~/.config/nvim/lua/core/basic.lua 中确认
vim.o.termguicolors = true
```

---

## 附录：核心文件结构

```
~/.config/nvim/
├── init.lua                      # 入口文件
├── lazy-lock.json                # 插件版本锁
├── lua/
│   ├── core/
│   │   ├── basic.lua             # 编辑器核心设置
│   │   ├── autocmd.lua           # 自动命令
│   │   ├── keymap.lua            # 全局快捷键
│   │   └── lazy.lua              # Lazy.nvim 引导
│   ├── neovide/                  # Neovide GUI 专属配置
│   ├── features/
│   │   ├── theme-list.lua        # 可用主题注册表
│   │   └── switch-theme.lua      # 主题切换引擎
│   └── plugins/
│       ├── theme.lua             # 主题插件列表
│       ├── editor/               # 编辑器增强插件
│       ├── git/                  # Git 相关插件
│       ├── lsp/                  # LSP/补全/格式化插件
│       ├── navigation/           # 导航/搜索插件
│       ├── ui/                   # 界面/美化插件
│       └── utils/                # 辅助工具插件
```

---

> 欢迎提交 Issue 或 PR 到 [GitHub](https://github.com/Youthdreamer/nvim) 反馈问题或贡献改进。
