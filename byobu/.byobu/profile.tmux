source $BYOBU_PREFIX/share/byobu/profiles/tmux
set -g default-terminal "screen-256color"
# run-shell "powerline-daemon -q"
# source "/home/tim/.local/lib/python2.7/site-packages/powerline/bindings/tmux/powerline.conf"

set -g @plugin 'seebi/tmux-colors-solarized'

# Initialize TMUX plugin manager (keep this line at the very bottom of tmux.conf)
run '~/.tmux/plugins/tpm/tpm'
