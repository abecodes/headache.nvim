if !has('nvim-0.5')
  echohl WarningMsg
  echom "headache.nvim needs Neovim >= 0.5"
  echohl None
  finish
endif

if exists('g:loaded_headache') | finish | endif " prevent loading file twice

let g:loaded_headache = 1
