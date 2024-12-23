if status is-interactive
    starship init fish | source
end

colorscript -e panes
set -U fish_user_paths $HOME/.nix-profile/bin $fish_user_paths
# alias

alias ls='eza -x -a --icons'
alias config='sudo nvim /etc/nixos/configuration.nix'
alias rebuild='sudo nixos-rebuild switch'
alias anime='fastanime --icons --preview --fzf anilist'
alias manga='fastanime --manga search -t'
alias n='nvim'
alias g='cd ~/GitHub/'
alias gc='git clone'
