unbind-key -n C-a
bind-key c new-window \; rename-window ""
bind-key C-Z last-window
bind-key z send-keys C-z
unbind-key -n C-z
set -g prefix ^Z
set -g prefix2 ^Z
bind z send-prefix
