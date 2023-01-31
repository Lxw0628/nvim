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

  use {
    'nvim-tree/nvim-tree.lua',
    requires = {
      'nvim-tree/nvim-web-devicons', -- 图标
    }
  }

  -- coc.nvim
  use {'neoclide/coc.nvim', branch = 'release'}

  use "christoomey/vim-tmux-navigator" -- 用ctl-hjkl来定位窗口
  use "akinsho/bufferline.nvim" -- buffer分割线

  use "tpope/vim-repeat" -- 使某些插件的命令可以使用‘.’
  use "honza/vim-snippets" -- 代码片段
  use "liuchengxu/vista.vim" -- 右侧显示方法函数
  use "easymotion/vim-easymotion" -- 光标快速跳转
  use "tpope/vim-surround" -- 包裹
  use "junegunn/vim-easy-align" -- 自动对齐
  -- use "preservim/nerdcommenter" -- 自动注释
  use "terrortylor/nvim-comment" -- 注释
  use "luochen1990/rainbow" -- 🌈彩虹括号
  use 'voldikss/vim-floaterm' -- 浮动终端

  if packer_bootstrap then
    require('packer').sync()
  end
end)
