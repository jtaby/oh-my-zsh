function collapse_pwd {
    echo $(pwd | sed -e "s,^$HOME,~,")
}

function prompt_char {
    git branch >/dev/null 2>/dev/null && echo '±' && return
    echo '○'
}

function battery_charge {
    echo `BAT_CHARGE`
}

function virtualenv_info {
    [ $VIRTUAL_ENV ] && echo '('`basename $VIRTUAL_ENV`') '
}

local return_code="%(?..%{$fg[red]%}%? ↵%{$reset_color%})"

PROMPT='
%{$fg[yellow]%}%n%{$reset_color%} on %{$fg[yellow]%}%M%{$reset_color%} in %{$fg_bold[green]%}$(collapse_pwd)%{$reset_color%}$(git_prompt_info) $(virtualenv_info)$(prompt_char) '

RPROMPT='$(battery_charge)'

RPS1="${return_code}"

ZSH_THEME_GIT_PROMPT_PREFIX=" on %{$fg[blue]%}"
ZSH_THEME_GIT_PROMPT_SUFFIX="%{$reset_color%}"
ZSH_THEME_GIT_PROMPT_DIRTY="%{$fg[green]%}!"
ZSH_THEME_GIT_PROMPT_CLEAN=""
