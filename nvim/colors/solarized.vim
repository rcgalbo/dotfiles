" Solarized colorscheme for Vim
" Maintainer: Ethan Schoonover <es@ethanschoonover.com>
" Website:    http://ethanschoonover.com/solarized
" License:    OSI approved MIT license

" Init
highlight clear
if exists("syntax_on")
  syntax reset
endif
let g:colors_name="solarized"

" Background is set in init.lua

" Solarized color definitions
let s:base03      = "#002b36"
let s:base02      = "#073642"
let s:base01      = "#586e75"
let s:base00      = "#657b83"
let s:base0       = "#839496"
let s:base1       = "#93a1a1"
let s:base2       = "#eee8d5"
let s:base3       = "#fdf6e3"
let s:yellow      = "#b58900"
let s:orange      = "#cb4b16"
let s:red         = "#dc322f"
let s:magenta     = "#d33682"
let s:violet      = "#6c71c4"
let s:blue        = "#268bd2"
let s:cyan        = "#2aa198"
let s:green       = "#859900"

" Set terminal colors
if has('nvim')
  let g:terminal_color_0  = s:base02
  let g:terminal_color_1  = s:red
  let g:terminal_color_2  = s:green
  let g:terminal_color_3  = s:yellow
  let g:terminal_color_4  = s:blue
  let g:terminal_color_5  = s:magenta
  let g:terminal_color_6  = s:cyan
  let g:terminal_color_7  = s:base2
  let g:terminal_color_8  = s:base03
  let g:terminal_color_9  = s:orange
  let g:terminal_color_10 = s:base01
  let g:terminal_color_11 = s:base00
  let g:terminal_color_12 = s:base0
  let g:terminal_color_13 = s:violet
  let g:terminal_color_14 = s:base1
  let g:terminal_color_15 = s:base3
endif

" Basic highlighting groups
exe "hi! Normal"        . " guifg=" . s:base0     . " guibg=" . s:base03    . " gui=NONE"
exe "hi! Comment"       . " guifg=" . s:base01    . " guibg=" . "NONE"      . " gui=italic"
exe "hi! Constant"      . " guifg=" . s:cyan      . " guibg=" . "NONE"      . " gui=NONE"
exe "hi! Identifier"    . " guifg=" . s:blue      . " guibg=" . "NONE"      . " gui=NONE"
exe "hi! Statement"     . " guifg=" . s:green     . " guibg=" . "NONE"      . " gui=NONE"
exe "hi! PreProc"       . " guifg=" . s:orange    . " guibg=" . "NONE"      . " gui=NONE"
exe "hi! Type"          . " guifg=" . s:yellow    . " guibg=" . "NONE"      . " gui=NONE"
exe "hi! Special"       . " guifg=" . s:red       . " guibg=" . "NONE"      . " gui=NONE"
exe "hi! Underlined"    . " guifg=" . s:violet    . " guibg=" . "NONE"      . " gui=underline"
exe "hi! Error"         . " guifg=" . s:red       . " guibg=" . s:base03    . " gui=bold"
exe "hi! Todo"          . " guifg=" . s:magenta   . " guibg=" . "NONE"      . " gui=bold"

" Additional highlighting groups
exe "hi! LineNr"        . " guifg=" . s:base01    . " guibg=" . s:base02    . " gui=NONE"
exe "hi! CursorLine"    . " guifg=" . "NONE"      . " guibg=" . s:base02    . " gui=NONE"
exe "hi! CursorLineNr"  . " guifg=" . s:base1     . " guibg=" . s:base02    . " gui=NONE"
exe "hi! Visual"        . " guifg=" . "NONE"      . " guibg=" . s:base01    . " gui=NONE"
exe "hi! Search"        . " guifg=" . s:base03    . " guibg=" . s:yellow    . " gui=NONE"
exe "hi! Folded"        . " guifg=" . s:base0     . " guibg=" . s:base02    . " gui=NONE"
exe "hi! StatusLine"    . " guifg=" . s:base1     . " guibg=" . s:base02    . " gui=reverse"
exe "hi! StatusLineNC"  . " guifg=" . s:base00    . " guibg=" . s:base02    . " gui=reverse"
exe "hi! VertSplit"     . " guifg=" . s:base00    . " guibg=" . s:base00    . " gui=NONE"
exe "hi! Title"         . " guifg=" . s:orange    . " guibg=" . "NONE"      . " gui=bold"
exe "hi! SpecialKey"    . " guifg=" . s:base00    . " guibg=" . s:base02    . " gui=NONE"
exe "hi! NonText"       . " guifg=" . s:base00    . " guibg=" . "NONE"      . " gui=NONE"
exe "hi! MatchParen"    . " guifg=" . s:base03    . " guibg=" . s:base01    . " gui=bold"
exe "hi! Pmenu"         . " guifg=" . s:base0     . " guibg=" . s:base02    . " gui=NONE"
exe "hi! PmenuSel"      . " guifg=" . s:base1     . " guibg=" . s:base01    . " gui=NONE"
exe "hi! PmenuSbar"     . " guifg=" . "NONE"      . " guibg=" . s:base02    . " gui=NONE"
exe "hi! PmenuThumb"    . " guifg=" . "NONE"      . " guibg=" . s:base0     . " gui=NONE"
exe "hi! TabLine"       . " guifg=" . s:base0     . " guibg=" . s:base02    . " gui=underline"
exe "hi! TabLineSel"    . " guifg=" . s:base1     . " guibg=" . s:base02    . " gui=bold"
exe "hi! TabLineFill"   . " guifg=" . s:base0     . " guibg=" . s:base02    . " gui=underline"
exe "hi! CursorColumn"  . " guifg=" . "NONE"      . " guibg=" . s:base02    . " gui=NONE"
exe "hi! DiffAdd"       . " guifg=" . s:green     . " guibg=" . s:base02    . " gui=bold"
exe "hi! DiffChange"    . " guifg=" . s:yellow    . " guibg=" . s:base02    . " gui=bold"
exe "hi! DiffDelete"    . " guifg=" . s:red       . " guibg=" . s:base02    . " gui=bold"
exe "hi! DiffText"      . " guifg=" . s:blue      . " guibg=" . s:base02    . " gui=bold"
