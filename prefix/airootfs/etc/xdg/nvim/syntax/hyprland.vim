if exists("b:current_syntax") " Quit when a (custom) syntax file was already loaded
  finish " Quit
endif " End if-else statement

syn keyword hyprTodo contained TODO FIXME XXX
syn match   hyprComment	"^#.*" contains=hyprTodo,@Spell
syn match   hyprComment	"\s#.*"ms=s+1 contains=hyprTodo,@Spell

syn match   hyprValue "\s=.*"ms=s+1 contains=hyprComment,hyprBool,hyprString,hyprOperator,hyprNumber,hyprKeybinding,hyprDispatcher

syn region  hyprString start=+"+ skip=+\\\\\|\\"+ end=+"+ oneline
syn region  hyprString start=+'+ skip=+\\\\\|\\'+ end=+'+ oneline
syn match   hyprOperator "\."
syn match   hyprOperator "{"
syn match   hyprOperator "}"
syn match   hyprOperator ","
syn keyword hyprBool true false
syn match   hyprNumber "-\=\<\d\+L\=\>\|0[xX][0-9a-fA-F]\+\>"
syn keyword hyprCommand bindm bindr overlay source disable_logs orientation inherit_fullscreen disable_time no_direct_scanout use_resize_transitions damage_blink kb_file binde bindl bindrl drag_lock enable_swallow swallow_regex scroll_factor disable_autoreload no_cursor_warps bind blur layout no_gaps_when_only new_is_master new_on_top dim_inactive dim_strength float_switch_override_focus always_follow_on_dnd layers_hog_keyboard_focus animate_manual_resizes allow_workspace_cycles use_active_for_splits workspace_back_and_forth mouse_move_enables_dpms shadow_offset split_width_multiplier shadow_inactive middle_button_emulation clickfinger_behavior no_vfr submap blur_new_optimizations no_blur_on_oversized pass_mouse_when_bound scroll_event_delay disable_splash_rendering disable_hyprland_logo no_border_on_floating workspace_swipe_fingers workspace_swipe workspace_swipe_distance workspace_swipe_invert workspace_swipe_min_speed_to_force workspace_swipe_cancel_ratio force_no_accel gaps_in gaps_out blur_size blur_passes border_size main_mod max_fps sensitivity follow_mouse kb_rules monitor workspace animation kb_options kb_model kb_layout kb_variant enabled rounding pseudotile damage_tracking col active_border inactive_border disable_while_typing apply_sens_to_raw active_opacity inactive_opacity fullscreen_opacity repeat_rate repeat_delay natural_scroll preserve_split force_split group_border_active group_border blurls special_scale_factor windowrule bezier multisample_edges blur_ignore_opacity drop_shadow shadow_range shadow_render_power shadow shadow_ignore_window numlock_by_default cursor_inactive_timeout
syn keyword hyprSection debug master binds misc animations dwindle decoration general input touchpad gestures
syn keyword hyprKeybinding mouse mouse_up mouse_down escape SUPER SHIFT CAPS SUPERCTRL SUPERALT CONTROL CTRL MOD2 MOD3 MOD4 MOD5 WIN SUPERSHIFT SUPERCONTROL return space A B C D E F G H I J K L M N O P Q R S T U V W X Y Z ALT left right up down print XF86AudioMute XF86AudioRaiseVolume XF86AudioLowerVolume XF86MonBrightnessDown XF86MonBrightnessUp Comma Period
syn keyword hyprDispatcher resizewindow workspace exec once center killactive workspaceopt forcerendererreload togglespecialworkspace movetoworkspace movetoworkspacesilent cyclenext cycleprev swapwithmaster moveactive resizeactive togglefloating opacity float tile nofocus fullscreen pseudo movefocus layoutmsg movewindow focusmonitor splitratio movecursortocorner togglegroup changegroupactive

" Define the default highlighting.
" Only used when an item doesn't have highlighting yet
hi def link hyprValue Include
hi def link hyprComment Comment
hi def link hyprTodo Todo
hi def link hyprString	String
hi def link hyprOperator Operator
hi def link hyprNumber Number
hi def link hyprBool Boolean
hi def link hyprCommand Identifier
hi def link hyprSection Keyword
hi def link hyprDispatcher manReference
hi def link hyprKeybinding Special

let b:current_syntax = "hyprland" " Set current syntax name
" vim: ts=8 sw=2
