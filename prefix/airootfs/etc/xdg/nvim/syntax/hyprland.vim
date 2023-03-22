if exists("b:current_syntax") " Quit when a (custom) syntax file was already loaded
  finish " Quit
endif " End if-else statement

syn keyword hyprTodo contained TODO FIXME XXX
syn match   hyprComment	"^#.*" contains=hyprTodo,@Spell
syn match   hyprComment	"\s#.*"ms=s+1 contains=hyprTodo,@Spell

syn match   hyprValue "\s=.*" contains=hyprComment,hyprBool,hyprString,hyprOperator,hyprNumber,hyprKeybinding,hyprDispatcher
syn match   hyprKeyword ".*=" contains=hyprComment,hyprOperator,hyprvalue
syn match   hyprKeyword "\$\w* " contains=hyprComment,hyprOperator,hyprvalue
syn match   hyprSection ".*{" contains=hyprComment,hyprOperator
syn region  hyprSection start="{" end="}" fold contains=hyprComment,hyprBool,hyprString,hyprOperator,hyprNumber,hyprKeybinding
syn match   hyprDispatcher "\w*,.*[^,]" contains=hyprComment,hyprOperator,hyprKeybinding,hyprString,hyprKeyword,hyprValue,hyprNumber

syn region  hyprString start=+"+ skip=+\\\\\|\\"+ end=+"+ oneline
syn region  hyprString start=+'+ skip=+\\\\\|\\'+ end=+'+ oneline
syn match   hyprOperator "\."
syn match   hyprOperator "{"
syn match   hyprOperator "}"
syn match   hyprOperator ","
syn match   hyprOperator "="
syn keyword hyprBool true false
syn match   hyprNumber "-\=\<\d\+L\=\>\|0[xX][0-9a-fA-F]\+\>"
syn keyword hyprKeybinding F10 mouse mouse_up mouse_down escape SUPER SHIFT CAPS SUPERCTRL SUPERALT CONTROL CTRL MOD2 MOD3 MOD4 MOD5 WIN SUPERSHIFT SUPERCONTROL return space A B C D E F G H I J K L M N O P Q R S T U V W X Y Z ALT left right up down print XF86AudioMute XF86AudioRaiseVolume XF86AudioLowerVolume XF86MonBrightnessDown XF86MonBrightnessUp Comma Period

" Define the default highlighting.
" Only used when an item doesn't have highlighting yet
hi def link hyprValue Include
hi def link hyprComment Comment
hi def link hyprTodo Todo
hi def link hyprString	String
hi def link hyprOperator Operator
hi def link hyprNumber Number
hi def link hyprBool Boolean
hi def link hyprKeyword Identifier
hi def link hyprSection Keyword
hi def link hyprDispatcher manReference
hi def link hyprKeybinding Special

let b:current_syntax = "hyprland" " Set current syntax name
" vim: ts=8 sw=2
