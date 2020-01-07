FD_OPTIONS="--follow --exclude .git --exclude node_modules --exclude .fonts"
GIT_OPTIONS="ls-files --cached --others --exclude-standard --exclude .fonts" 
export FZF_DEFAULT_OPTS="--no-mouse --height 50% -1 --reverse --multi --inline-info --preview='[[ \$(file --mime {}) =~ binary ]] && echo {} is a binary file || (bat --style=numbers --color=always {} || cat {}) 2> /dev/null | head -300' --preview-window='right:hidden:wrap' --bind='f3:execute(bat --style=numbers {} || less -f {}),f2:toggle-preview,ctrl-d:half-page-down,ctrl-u:half-page-up,ctrl-a:select-all+accept,ctrl-y:execute-silent(echo {+} | pbcopy)'"
# Use git-ls-files inside git repo, otherwise fd
#export FZF_DEFAULT_COMMAND="git $GIT_OPTIONS || fdfind --type f --hidden --type l $FD_OPTIONS"
#export FZF_DEFAULT_COMMAND="fdfind --type f --type l $FD_OPTIONS"
export FZF_CTRL_T_COMMAND="fd $FD_OPTIONS"
export FZF_ALT_C_COMMAND="fd --type d $FD_OPTIONS"

export BAT_PAGER="less -R"
