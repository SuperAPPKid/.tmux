#!/bin/bash
sesh list -i -H -d | fzf --tmux \
  --no-sort --ansi --border-label " sesh " --prompt "⚡  " \
  --header "[^a all] [^t tmux] [^p preset] [^o zoxide] [^x KILL]" \
  --bind "tab:down,btab:up" \
  --bind "ctrl-a:change-prompt(⚡  )+reload(sesh list -i -H -d)" \
  --bind "ctrl-t:change-prompt(🪟  )+reload(sesh list -t -i -H -d)" \
  --bind "ctrl-p:change-prompt(⚙️  )+reload(sesh list -c -i -H -d)" \
  --bind "ctrl-o:change-prompt(📁  )+reload(sesh list -z -i -H -d)" \
  --bind "ctrl-x:execute(tmux kill-session -t {2..})+change-prompt(⚡  )+reload(sesh list -i -H -d)" \
  --preview-window "right:66%" \
  --preview "sesh preview {}"
