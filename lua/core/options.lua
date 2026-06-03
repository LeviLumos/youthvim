local opt = vim.opt

opt.number = true           -- 显示行号
opt.relativenumber = true   -- 显示相对行号
opt.tabstop = 2             -- Tab 键的显示宽度
opt.shiftwidth = 2          -- 自动缩进的空格数
opt.expandtab = true        -- 将 Tab 转换为空格
opt.smartindent = true      -- 智能缩进
opt.cursorline = true       -- 高亮当前行
opt.termguicolors = true    -- 启用真彩色支持
opt.mouse = "a"             -- 启用鼠标支持
opt.clipboard = "unnamedplus" -- 共享系统剪贴板
opt.ignorecase = true       -- 搜索时忽略大小写
opt.smartcase = true        -- 搜索时智能匹配大小写
opt.wrap = false            -- 禁止自动换行
