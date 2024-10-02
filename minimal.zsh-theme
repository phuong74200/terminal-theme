# ll=$(last -1 -R $USER | awk 'NR==1 {print $4, $3, $5, strftime("%T"), "on", $2}')
# echo "Last login: $ll"
# export PS1="Last login: [$ll]"'\n\h:\W\$ '

ZSH_THEME_GIT_PROMPT_PREFIX="("
ZSH_THEME_GIT_PROMPT_SUFFIX=")"
ZSH_THEME_GIT_PROMPT_DIRTY="*"
ZSH_THEME_GIT_PROMPT_CLEAN=""

COMMON_COLORS_HOST_ME=green
COMMON_COLORS_HOST_AWS_VAULT=yellow
COMMON_COLORS_CURRENT_DIR=blue
COMMON_COLORS_RETURN_STATUS_TRUE=magenta
COMMON_COLORS_RETURN_STATUS_FALSE=yellow
COMMON_COLORS_GIT_STATUS_DEFAULT=green
COMMON_COLORS_GIT_STATUS_STAGED=red
COMMON_COLORS_GIT_STATUS_UNSTAGED=yellow
COMMON_COLORS_GIT_PROMPT_SHA=green
COMMON_COLORS_BG_JOBS=yellow

ZSH_THEME_GIT_PROMPT_PREFIX="%{$reset_color%}%{$fg[$COMMON_COLORS_RETURN_STATUS_TRUE]%}["
ZSH_THEME_GIT_PROMPT_SUFFIX="]%{$reset_color%}"

git_prompt() {
   echo "$(git_prompt_info)"
}

git_custom_status() {
   local cb=$(current_branch)
   if [ -n "$cb" ]; then
      echo " $(parse_git_dirty)$ZSH_THEME_GIT_PROMPT_PREFIX$(current_branch)$ZSH_THEME_GIT_PROMPT_SUFFIX"
   fi
}

PROMPT='%{$fg[$COMMON_COLORS_HOST_ME]%}@%m%{$reset_color%} %{$fg[$COMMON_COLORS_CURRENT_DIR]%}%0~%{$reset_color%}$(git_custom_status) $ '
# RPROMPT='%{$FG[012]%} ► %{$fg[cyan]%}$(git_prompt_info)%{$FG[012]%} ◄ %{$reset_color%}';

RPROMPT='$(git_prompt)'
