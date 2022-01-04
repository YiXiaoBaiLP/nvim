" Set Editor Font
if exists(':GuiFont')
    " Use GuiFont! to ignore font errors
    GuiFont! Fira Code:h12
endif

"图形自适应颜色
if exists(':GuiAdaptiveColor')
    GuiAdaptiveColor 1
endif

" 图形自适应字体
if exists(':GuiAdaptiveFont')
    GuiAdaptiveFont! 1
endif

" 图形自适应样式
if exists(':GuiAdaptiveStyle')
    GuiAdaptiveStyle Fusion
endif

" 禁用QT的标签
if exists(':GuiTabline')
    GuiTabline 0
endif

" 禁用QT的弹出菜单
if exists(':GuiPopupmenu')
    GuiPopupmenu 0
endif

" Enable GUI 连体字
if exists(':GuiRenderLigatures')
    GuiRenderLigatures 1
endif

if exists(':GuiWindowMaximized')
    " 最大化打开nvim-qt
    GuiWindowMaximized 1
endif

" Right Click Context Menu (Copy-Cut-Paste)
nnoremap <silent><RightMouse> :call GuiShowContextMenu()<CR>
inoremap <silent><RightMouse> <Esc>:call GuiShowContextMenu()<CR>
xnoremap <silent><RightMouse> :call GuiShowContextMenu()<CR>gv
snoremap <silent><RightMouse> <C-G>:call GuiShowContextMenu()<CR>gv
