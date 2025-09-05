#!/bin/bash
PANE_ID="$(tmux display-message -p "#{pane_id}")"
old="$(tmux display-message -p "#{client_session}")"
current_path="$(tmux display-message -p "#{pane_current_path}")"

sesh connect "$current_path"

new="$(tmux display-message -p "#{client_session}")"

if [ "$old" != "$new" ]; then
  tmux break-pane -s "$PANE_ID" -t "$new"
fi

