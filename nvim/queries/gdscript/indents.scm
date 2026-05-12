; FROM https://github.com/GDQuest/zed-gdscript/blob/main/languages/gdscript/

; Add an indent level when adding a line within brackets
(_ "[" "]" @end) @indent
(_ "{" "}" @end) @indent
(_ "(" ")" @end) @indent
