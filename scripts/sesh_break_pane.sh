#!/bin/bash

PANE_ID="$(tmux display-message -p "#{pane_id}")"
old="$(tmux display-message -p "#{client_session}")"

selected="$1"

[ -z "$selected" ] && exit 0

sesh connect "$selected"

new="$(tmux display-message -p "#{client_session}")"
if [ "$old" != "$new" ]; then
  tmux break-pane -s "$PANE_ID" -t "$new"
fi
