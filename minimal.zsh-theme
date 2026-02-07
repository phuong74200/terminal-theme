# ---- Git prompt config ----
ZSH_THEME_GIT_PROMPT_PREFIX=":"
ZSH_THEME_GIT_PROMPT_SUFFIX=""
ZSH_THEME_GIT_PROMPT_DIRTY="*"
ZSH_THEME_GIT_PROMPT_CLEAN=""

COMMON_COLORS_HOST_ME=green
COMMON_COLORS_CURRENT_DIR=blue
COMMON_COLORS_GIT_BRANCH=magenta

# ---- Git helpers ----
git_custom_status() {
  local branch=$(git_current_branch)
  if [[ -n "$branch" ]]; then
    echo "%{$fg[$COMMON_COLORS_GIT_BRANCH]%}:$branch%{$reset_color%}"
  fi
}

# ---- PROMPT ----
# fuong@debian:~/path:branch$
PROMPT='%{$fg[$COMMON_COLORS_HOST_ME]%}%n@%m%{$reset_color%}:%{$fg[$COMMON_COLORS_CURRENT_DIR]%}%~%{$reset_color%}$(git_custom_status)$ '
