#
# ███████╗██╗░██████╗██╗░░██╗
# ██╔════╝██║██╔════╝██║░░██║
# █████╗░░██║╚█████╗░███████║
# ██╔══╝░░██║░╚═══██╗██╔══██║
# ██║░░░░░██║██████╔╝██║░░██║
# ╚═╝░░░░░╚═╝╚═════╝░╚═╝░░╚═╝
#
# Created by: Dang Minh Ngo
# Github: @dangminhngo
# Email: dangminhngo.dev@gmail.com

# Disable fish_greeting
set -U fish_greeting

set -Ux PNPM_HOME $HOME/.local/share/pnpm
set -Ux GTK_IM_MODULE ibus
set XMODIFIERS "@im=ibus"
set QT_IM_MODULE ibus

# Add paths
fish_add_path -g ~/.local/bin $PNPM_HOME $HOME/.local/share/fnm
fnm env | source

if status is-interactive
    # Commands to run in interactive sessions can go here
end

# Alias
alias ll "ls -la"
alias ga "git add -A"
alias gp "git push"
alias n nvim
