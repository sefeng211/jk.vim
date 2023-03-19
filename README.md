# jk.vim

jk.vim is plugin that always switch the mode to "normal" when the
current input mode is "insert" and user types "jk".

Generally this plugin is not needed because one can map "jk" with <esc>
to do the same thing. However, this could be useful when the current
input method is not English. For example, if current input method is
Chinese with Fcitx5, type "jk" would not trigger <esc> because the input
method captures the input first. This plugin fixes this.

## Install
`Plug 'sefeng211/jk.vim', { 'do': 'pip install pynput' }`

