# Cookvim 快捷键速查 & 自定义指南

> **Leader 键** = `Space`（空格），定义在 `lua/core/keymap.lua`  
> **快捷键提示**：按下 `<leader>` 等待 1 秒，which-key 自动弹出分组菜单；也可用 `<leader>fk` 搜索所有快捷键

---

## 1. 通用操作

| 快捷键 | 模式 | 功能 |
|:------:|:----:|------|
| `<leader>qq` | n | 保存所有文件并退出 |
| `<C-s>` | i,n,v,s | 保存当前文件 |
| `<C-a>` | i,n | 全选 |
| `<leader>T` | n | 主题切换（Telescope 弹窗） |
| `<leader>H` | n | 帮助文档查询（Telescope） |
| `<leader>fk` | n | 快捷键查询（Telescope） |

### 行移动

| 快捷键 | 模式 | 功能 |
|:------:|:----:|------|
| `<A-j>` | n | 当前行下移 |
| `<A-k>` | n | 当前行上移 |
| `<A-j>` | v | 选中块下移 |
| `<A-k>` | v | 选中块上移 |
| `j` | n | 按显示行下移（自动处理换行） |
| `k` | n | 按显示行上移（自动处理换行） |

### 窗口尺寸

| 快捷键 | 模式 | 功能 |
|:------:|:----:|------|
| `<C-Up>` | n | 增加窗口高度 |
| `<C-Down>` | n | 减少窗口高度 |
| `<C-Left>` | n | 减少窗口宽度 |
| `<C-Right>` | n | 增加窗口宽度 |

### 窗口布局

| 快捷键 | 模式 | 功能 |
|:------:|:----:|------|
| `<leader>wH` | n | 窗口移到最左边 |
| `<leader>wJ` | n | 窗口移到最底部 |
| `<leader>wK` | n | 窗口移到最顶部 |
| `<leader>wL` | n | 窗口移到最右边 |

### 标签页

| 快捷键 | 模式 | 功能 |
|:------:|:----:|------|
| `<leader><tab><tab>` | n | 新建标签页 |
| `<leader><tab>d` | n | 关闭当前标签页 |
| `<leader><tab>o` | n | 关闭其他标签页 |
| `<leader><tab>l` | n | 下一个标签页 |
| `<leader><tab>h` | n | 上一个标签页 |

---

## 2. 文件导航

### 文件查找（Telescope）— `<leader>f` 系列

| 快捷键 | 功能 | 样式 |
|--------|------|:----:|
| `<leader>ff` | 按文件名查找 | dropdown |
| `<leader>fg` | 全局搜索（搜索文件内容） | ivy |
| `<leader>fs` | 快速搜索当前光标下的单词 | ivy |
| `<leader>fr` | 高级搜索（支持参数过滤） | ivy |
| `<leader>fb` | 查看打开的文件列表 | vertical |
| `<leader>fo` | 查看历史打开的文件 | dropdown |
| `<leader>fp` | 切换项目（project.nvim） | — |
| `<leader>fk` | 快捷键查询 | — |
| `<leader>H` | 帮助文档查询 | ivy |

### 文件树 & 文件管理器

| 快捷键 | 模式 | 功能 |
|:------:|:----:|------|
| `<leader>e` | n | 打开/关闭 Neo-tree 侧边栏 |
| `-` | n | 打开 Mini-files 文件管理器（含预览窗） |

### Telescope 内快捷键

| 快捷键 | 模式（浮窗内） | 功能 |
|:------:|:----:|------|
| `<A-s>` | i / n | 在水平分屏中打开 |
| `<A-v>` | i / n | 在垂直分屏中打开 |
| `<A-t>` | i / n | 在新标签页中打开 |
| `<Esc>` | i / n | 关闭 Telescope |

---

## 3. 缓冲区操作 — `<leader>b` 系列

| 快捷键 | 功能 |
|--------|------|
| `<leader>bb` | 快速切换缓冲区（切换到上一个） |
| `<leader>bd` | 删除当前缓冲区 |
| `<leader>bf` | 查询并跳转缓冲区（BufferLinePick） |
| `<leader>bo` | 删除其他缓冲区 |
| `<leader>bp` | 切换缓冲区固定状态 |
| `<leader>bP` | 删除未固定的缓冲区 |
| `]b` | 切换到下一个缓冲区 |
| `[b` | 切换到上一个缓冲区 |

---

## 4. LSP 代码操作 — `<leader>c` 系列

| 快捷键 | 功能 | 来源 |
|--------|------|------|
| `<leader>ca` | 代码操作（快速修复/重构） | LSP |
| `<leader>cd` | 当前行诊断详情 | LSP |
| `<leader>ce` | 当前文件所有诊断 | Telescope |
| `<leader>cW` | 全局诊断 | Telescope |
| `<leader>cf` | 文件大纲（当前文件符号） | Telescope |
| `<leader>cs` | 切换符号面板（Aerial 侧边栏） | Aerial |
| `<leader>ci` | 查找接口/方法实现 | Telescope |
| `<leader>cr` | 查找所有引用 | Telescope |
| `<leader>cw` | 工作区符号搜索 | Telescope |
| `<leader>c[` | 被调列表（谁调用了该函数） | Telescope |
| `<leader>c]` | 调用列表（该函数调用了谁） | Telescope |
| `<leader>cR` | 重命名符号 | LSP |

---

## 5. Git 操作

### Lazygit

| 快捷键 | 功能 |
|--------|------|
| `<leader>gg` | 打开 Lazygit 图形化 Git 界面 |

### Gitsigns — `<leader>h` 系列

| 快捷键 | 功能 |
|--------|------|
| `<leader>hp` | 预览当前 hunk 变更（浮动窗口） |
| `<leader>hi` | 行内预览 hunk 变更 |
| `<leader>hb` | 显示当前行的 git blame 弹窗 |
| `<leader>hd` | 显示文件差异（与索引对比） |
| `<leader>hD` | 显示文件差异（与 HEAD~ 对比） |
| `<leader>hQ` | 将所有 Git 变更发送到 Quickfix 列表 |
| `<leader>hq` | 将当前文件变更发送到 Quickfix 列表 |
| `<leader>ht` | 切换行内 blame 行尾显示 |
| `<leader>hw` | 切换行内单词差异高亮 |
| `]c` | 跳转到下一个 hunk |
| `[c` | 跳转到上一个 hunk |
| `ih` | 文本对象：选择当前 Git hunk |

---

## 6. 快速跳转（Flash）— `s` 系列

| 快捷键 | 模式 | 功能 |
|:------:|:----:|------|
| `s` | n,x,o | Flash 跳转（输入字符 → 标签跳转） |
| `S` | n,x,o | Flash Treesitter 节点跳转 |
| `gl` | n,x,o | 跳转到某一行（显示行号标签） |
| `r` | o | 远程跳转（operator-pending 模式） |
| `R` | o,x | Treesitter 搜索跳转 |
| `<C-s>` | c | 切换 Flash 搜索（命令行模式） |

---

## 7. 文件标记跳转（Harpoon）— `<leader>m` 系列

| 快捷键 | 功能 |
|--------|------|
| `<leader>ma` | 添加当前文件到 Harpoon 列表 |
| `<leader>md` | 从列表中移除当前文件 |
| `<leader>mm` | 打开/关闭 Harpoon 菜单（快速选择） |
| `<leader>m1` | 跳转到标记 1 |
| `<leader>m2` | 跳转到标记 2 |
| `<leader>m3` | 跳转到标记 3 |
| `<leader>m[` | 跳转到上一个标记 |
| `<leader>m]` | 跳转到下一个标记 |

---

## 8. 代码补全（Blink）— 补全面板内快捷键

> 配置为 `preset = "super-tab"`

| 快捷键 | 模式 | 功能 |
|:------:|:----:|------|
| `<Tab>` | 补全面板 | 选择下一个 / 接受补全 |
| `<S-Tab>` | 补全面板 | 选择上一个 |
| `<C-j>` | 补全面板 | 向下移动 |
| `<C-k>` | 补全面板 | 向上移动 |
| `<Enter>` / `<CR>` | 补全面板 | 接受当前选择 |
| `<C-Space>` | i | 手动触发补全 |
| `<C-b>` | 补全面板 | 文档向上翻页 |
| `<C-f>` | 补全面板 | 文档向下翻页 |

---

## 9. Markdown & Typst 文档

| 快捷键 | 功能 |
|--------|------|
| `<leader>pm` | 切换 Markdown 浏览器预览 |
| `:MarkdownPreview` | 启动预览 |
| `:MarkdownPreviewStop` | 停止预览 |

---

## 10. 专注工具（Obsess）— `<leader>o` 系列

| 快捷键 | 功能 |
|--------|------|
| `<leader>os` | 切换专注窗口显示 |
| `<leader>oc` | 注销 |
| `<leader>oo` | 设置倒计时器（HH:MM:SS） |
| `<leader>ol` | 设置倒计时器（秒数） |
| `<leader>oa` | 添加待办任务 |
| `<leader>ot` | 切换任务完成状态 |
| `<leader>od` | 删除任务 |
| `<leader>oe` | 清空任务列表 |

---

## 11. 其他命令

| 命令 | 功能 |
|------|------|
| `:Lazy` | 打开 Lazy.nvim 插件管理面板 |
| `:Mason` | 打开 Mason LSP 安装管理界面 |
| `:ThemeSwitch` | 打开主题切换器（等价于 `<leader>T`） |
| `:TransparentToggle` | 切换编辑器透明/不透明背景 |
| `:Format` | 手动格式化当前文件（Conform） |

---

## 12. Neovide 专属快捷键

> 仅在 Neovide GUI 中生效，终端 Ghostty 下不加载。

| 快捷键 | 模式 | 功能 |
|:------:|:----:|------|
| `<D-s>` | n | 保存（macOS Cmd+S） |
| `<D-c>` | v | 复制到系统剪贴板 |
| `<D-v>` | n | 从系统剪贴板粘贴（普通模式） |
| `<D-v>` | v | 从系统剪贴板粘贴（可视模式） |
| `<D-v>` | c | 从系统剪贴板粘贴（命令模式） |
| `<D-v>` | i | 从系统剪贴板粘贴（插入模式） |
| `<C-=>` | n | UI 放大 10% |
| `<C-->` | n | UI 缩小 10% |

---

## 13. which-key 分组速查

按下 `<leader>` 等待后弹出的分组菜单：

| 触发键 | 分组名称 | 内容 |
|:-------:|----------|------|
| `<leader>e` | Neotree | 文件树 |
| `<leader>f` | 文件查找 | ff, fg, fs, fr, fb, fo, fp, fk |
| `<leader>b` | 缓冲区操作 | bb, bd, bf, bo, bp, bP |
| `<leader>c` | LSP 操作 | ca, cd, ce, cW, cf, cs, ci, cr, cw, c[, c], cR |
| `<leader>g` | Git 操作 | gg |
| `<leader>h` | Git Hunk/信息 | hp, hi, hb, hd, hD, hQ, hq, ht, hw |
| `<leader>m` | 文件标记跳转 | ma, md, mm, m1, m2, m3, m[, m] |
| `<leader>o` | 专注面板 | os, oc, oo, ol, oa, ot, od, oe |
| `<leader>p` | 文档预览 | pm |
| `<leader>q` | 退出编辑器 | qq |
| `<leader>T` | 主题切换 | T |
| `<leader>w` | 窗口操作 | wH, wJ, wK, wL |
| `<leader>H` | 帮助/历史 | H |
| `<leader><tab>` | 标签栏 | tab, d, o, l, h |
| `<leader>D` | 诊断浮窗 | — (预留) |
| `<leader>x` | 问题查看 | — (预留) |

---

## 快捷键修改指南

### 修改方式总览

| 快捷键来源 | 修改文件 | 示例 |
|-----------|---------|------|
| 通用快捷键 | `lua/core/keymap.lua` | `<leader>T`、`<leader>qq` 等 |
| Telescope 查找 | `lua/plugins/navigation/telescope.lua` | `<leader>ff`、`<leader>fg` |
| Git (gitsigns) | `lua/plugins/git/gitsigns.lua` | `<leader>hp`、`]c` |
| Git (lazygit) | `lua/plugins/git/lazygit.lua` | `<leader>gg` |
| 缓冲区 (bufferline) | `lua/plugins/ui/bufferline.lua` | `<leader>bd`、`]b` |
| Harpoon 标记 | `lua/plugins/navigation/harpoon.lua` | `<leader>ma`、`<leader>m1` |
| Flash 跳转 | `lua/plugins/utils/flash.lua` | `s`、`S`、`gl` |
| 文件树 | `lua/plugins/editor/neo-tree.lua` | `<leader>e` |
| Mini-files | `lua/plugins/editor/mini-files.lua` | `-` |
| Aerial 大纲 | `lua/plugins/editor/aerial.lua` | `<leader>cs` |
| Markdown 预览 | `lua/plugins/utils/markdown-preview.lua` | `<leader>pm` |
| Obsess 计时 | `lua/plugins/utils/obsess.lua` | `<leader>os`、`<leader>oo` |
| 代码补全 (blink) | `lua/plugins/lsp/blink.lua` | Tab 行为 |
| Neovide 专属 | `lua/neovide/keymap.lua` | `<D-s>`、`<C-=>` |
| which-key 分组 | `lua/plugins/navigation/which-key.lua` | 分组标签 |

---

### 示例 1：修改通用快捷键

编辑 `lua/core/keymap.lua`：

```lua
-- 把 <leader>qq 改成 <leader>q
map("n", "<leader>q", "<cmd>wqa<cr>", { desc = "退出编辑器" })
```

### 示例 2：修改 Telescope 快捷键

编辑 `lua/plugins/navigation/telescope.lua`，找到 `keys = {` 部分：

```lua
keys = {
    -- 把 <leader>ff 改成 <leader>sf
    {
        "<leader>sf",
        "<cmd>Telescope find_files theme=dropdown previewer=false layout_config={height=0.3}<cr>",
        desc = "查找文件",
    },
    -- 其他保持不变...
},
```

### 示例 3：修改 Git 快捷键

编辑 `lua/plugins/git/gitsigns.lua`，修改 `on_attach` 函数内的 `map()` 调用：

```lua
-- 把 ]c 改成 ]h
map("n", "]h", function()
    if vim.wo.diff then
        vim.cmd.normal({ "]c", bang = true })
    else
        gitsigns.nav_hunk("next")
    end
end, "跳转到下一个修改块")
```

### 示例 4：修改 which-key 分组标签

编辑 `lua/plugins/navigation/which-key.lua`：

```lua
wk.add({
    -- 修改分组名称
    { "<leader>f", group = " 搜索/查找", icon = "🔍" },
    -- 添加新分组
    { "<leader>z", group = " 自定义操作", icon = " " },
}, { mode = { "n", "v" } })
```

---

### 快捷键语法参考

```lua
-- 最基本的映射
vim.keymap.set("n", "<leader>xx", ":SomeCommand<CR>", { desc = "描述" })

-- 带 mode 选项（多个模式）
vim.keymap.set({ "n", "v" }, "<leader>xx", ":Command<CR>", { silent = true, desc = "..." })

-- 用 function 作为 action（复杂逻辑）
vim.keymap.set("n", "<leader>xx", function()
    -- 多步操作的逻辑
    vim.cmd("write")
    vim.notify("已保存")
end, { desc = "保存并通知" })

-- mode 含义
-- n = normal
-- i = insert
-- v = visual + select
-- x = visual only
-- o = operator-pending
-- c = command-line
-- s = select
-- t = terminal
```

---

### 注意事项

1. **修改后无需重启**，可使用 `:so %` 在当前文件重新加载，或重启 Neovim
2. **插件快捷键**在 `keys = { ... }` 中定义的是懒加载触发键，同时也会作为插件加载后的快捷键
3. **避免冲突** — 修改前用 `<leader>fk` 搜索确认快捷键是否被占用
4. **Leader 键**定义在 `lua/core/keymap.lua` 第 2 行：`vim.g.mapleader = " "`
