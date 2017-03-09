# ZSH Theme - linuxer
# Author: Patrick Wu <wotingwu@live.com>
# Theme based on Yaris Alex Gutierrez's classyTouch, Yad Smood's ys, and Bureau Theme

# Current Dir Shortener
local current_dir='::%{$fg[magenta]%}%1d%{$reset_color%}'

# VCS
YS_VCS_PROMPT_PREFIX="%{$fg[yellow]%}+"
YS_VCS_PROMPT_SUFFIX=" %{$reset_color%} "
YS_VCS_PROMPT_DIRTY=" %{$fg[red]%}x"
YS_VCS_PROMPT_CLEAN=" %{$fg[green]%}o"

# Git info
local git_info='$(git_prompt_info)'
ZSH_THEME_GIT_PROMPT_PREFIX=" %{$fg[cyan]%}%Bg:%b%{$reset_color%}"
ZSH_THEME_GIT_PROMPT_SUFFIX="$YS_VCS_PROMPT_SUFFIX"
ZSH_THEME_GIT_PROMPT_DIRTY="$YS_VCS_PROMPT_DIRTY"
ZSH_THEME_GIT_PROMPT_CLEAN="$YS_VCS_PROMPT_CLEAN"

# HG info
local hg_info='$(hg_prompt_info)'
hg_prompt_info() {
	# make sure this is a hg dir
	if [ -d '.hg' ]; then
		echo -n "%{$fg[yellow]%}%Bh:%b%{$reset_color%}"
		echo -n $(hg branch 2>/dev/null)
		if [ -n "$(hg status 2>/dev/null)" ]; then
			echo -n "$YS_VCS_PROMPT_DIRTY"
		else
			echo -n "$YS_VCS_PROMPT_CLEAN"
		fi
		echo -n "$YS_VCS_PROMPT_SUFFIX"
	fi
}

# NVM info
local nvm_info='$(nvm_prompt_info)'
ZSH_THEME_NVM_PROMPT_PREFIX="${YS_VCS_PROMPT_PREFIX}%{$reset_color%}node-"
ZSH_THEME_NVM_PROMPT_SUFFIX="$YS_VCS_PROMPT_SUFFIX"

# RVM info
local rvm_info='$(rvm_prompt_info)'
ZSH_THEME_RVM_PROMPT_PREFIX="${YS_VCS_PROMPT_PREFIX}%{$reset_color%}"
ZSH_THEME_RVM_PROMPT_SUFFIX="$YS_VCS_PROMPT_SUFFIX"

local exit_code="%(?,%?,%{$fg[red]%}%B%?%b%{$reset_color%})"
local current_info='%B%*%b::%?::%h::%{$fg[cyan]%}%B%y%{$reset_color%}%b'

PROMPT="${current_info}${current_dir}${git_info}${hg_info}
%#"
RPROMPT="${nvm_info}${rvm_info}"
