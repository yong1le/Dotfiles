#!/usr/bin/env bash

case "$1" in
focus*)
  niri msg action "$@" && pkill -SIGRTMIN+8 waybar
  ;;
move*)
  niri msg action "$@" && pkill -SIGRTMIN+8 waybar
  ;;
*)
  set -e

  monitor=$1

  active="<span color='#a6e3a1'></span>"
  inactive=""

  active_social="<span color='#a6e3a1'>󰓇</span>"
  inactive_social="󰓇"

  workspace_str=""

  msg_out="$(niri msg -j workspaces | jq -c ".[] | select(.output == \"$monitor\") | {is_active: .is_active, name: .name}")"

  for ws in $msg_out; do
    is_active="$(echo "$ws" | jq -r '.is_active')"
    name="$(echo "$ws" | jq -r '.name')"

    if [ "$name" == "social" ] && "$is_active"; then
      workspace_str="${workspace_str}${active_social}  "
    elif [ "$name" == "social" ]; then
      workspace_str="${workspace_str}${inactive_social}  "
    elif "$is_active"; then
      workspace_str="${workspace_str}${active}  "
    else
      workspace_str="${workspace_str}${inactive}  "
    fi
  done

  printf "%s" "$workspace_str"
  ;;
esac
