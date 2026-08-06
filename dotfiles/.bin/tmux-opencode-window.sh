#!/usr/bin/env bash
# Reads opencode state files written by the opencode "tmux-status" plugin.
# Each file /tmp/tmux-opencode/state-<pane>-<window> contains "<state> <pid>".
# Renders a spinner for the given window while its opencode is "thinking",
# or a green dot when it is "ready". Called from window-status-* formats.
#
# Usage: tmux-opencode-window.sh <window_index>

dir=/tmp/tmux-opencode
window=$1
spinner=(⠋ ⠙ ⠹ ⠸ ⠼ ⠴ ⠦ ⠧ ⠇ ⠏)
frame=$(( $(date +%s) % ${#spinner[@]} ))
out=""
for f in "$dir"/state-*; do
  [ -f "$f" ] || continue
  read -r state pid < "$f" 2>/dev/null
  if [ -z "$pid" ] || ! kill -0 "$pid" 2>/dev/null; then
    rm -f "$f"
    continue
  fi
  base=${f##*/}
  n=${base#state-}
  win=${n##*-}
  [ "$win" = "$window" ] || continue
  case "$state" in
    thinking) glyph="#[fg=#e5c07b]${spinner[frame]}" ;;
    blocked)  glyph="#[fg=#d19a66]⬤" ;;
    ready)    glyph="#[fg=#98c379]⬤" ;;
    *) continue ;;
  esac
  out+="${out:+  }${glyph}"
done
[ -n "$out" ] && printf ' %s ' "$out"
