-- 自动安装packer
local ensure_packer = function()
    local fn = vim.fn
    local install_path = fn.stdpath('data')..'/site/pack/packer/start/packer.nvim'
    if fn.empty(fn.glob(install_path)) > 0 then
        fn.system({'git', 'clone', '--depth', '1', 'https://github.com/wbthomason/packer.nvim', install_path})
        vim.cmd [[packadd packer.nvim]]
        return true
    end
    return false
end

local packer_bootstrap = ensure_packer()

-- 保存此文件自动更新安装软件
-- 注意PackerCompile改成了PackerSync
-- plugins.lua改成了plugins-setup.lua，适应本地文件名字
vim.cmd([[
	augroup packer_user_config
	autocmd!
	autocmd BufWritePost plugins-setup.lua source <afile> | PackerSync
	augroup end
]])

return require('packer').startup(function(use)
    use 'wbthomason/packer.nvim'

    -- 外观
    use 'folke/tokyonight.nvim' -- 主题
    use {
        'nvim-lualine/lualine.nvim', -- 状态栏
        requires = { 'kyazdani42/nvim-web-devicons', opt = true } -- 状态栏图标
    }

    -- 文件树
    use {
        'nvim-tree/nvim-tree.lua',
        requires = {
            'nvim-tree/nvim-web-devicons', -- 图标
        }
    }

    -- coc.nvim
    use {'neoclide/coc.nvim', branch = 'release'}
    use "honza/vim-snippets" -- 代码片段
    use "rafamadriz/friendly-snippets" -- 代码片段
    use({
        "L3MON4D3/LuaSnip",
        -- follow latest release.
        tag = "v<CurrentMajor>.*",
        -- install jsregexp (optional!:).
        run = "make install_jsregexp"
    })

    -- 
    use "kdheepak/lazygit.nvim" -- lazygit

    use "christoomey/vim-tmux-navigator" -- 用ctl-hjkl来定位窗口
    use "akinsho/bufferline.nvim" -- buffer分割线
    use "tpope/vim-repeat" -- 使某些插件的命令可以使用‘.’
    use "liuchengxu/vista.vim" -- 右侧显示方法函数
    use "easymotion/vim-easymotion" -- 光标快速跳转
    use "tpope/vim-surround" -- 包裹
    use "terrortylor/nvim-comment" -- 注释
    use "luochen1990/rainbow" -- 🌈彩虹括号
    use 'voldikss/vim-floaterm' -- 浮动终端
    use "yianwillis/vimcdoc" -- vim中文文档
    use "terryma/vim-expand-region" -- 快速选中内容
    -- use "iamcco/markdown-preview.nvim" -- markdowm预览
    use({ "iamcco/markdown-preview.nvim", run = "cd app && npm install", setup = function() vim.g.mkdp_filetypes = { "markdown" } end, ft = { "markdown" }, })
    use "echasnovski/mini.nvim" -- mini.nvim

    if packer_bootstrap then
        require('packer').sync()
    end
end)
