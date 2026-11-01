#!/bin/bash
# Removes the Minim library code from a Processing sketch.
#
#
# Usage: 
#   
#  ./scripts/remove_libraries.sh
input="game/game.pde"
output="game_without_libraries/game_without_libraries.pde"

awk '
  /^final int player_width = 600;/          { sub(/600/, "320") }
  /^final int player_height = 600;/         { sub(/600/, "200") }
  /t_pock|t_roll/                           { print; next }  # always keep
  /^import ddf/                             { next }
  /Minim|minim|AudioPlayer|pock\.|roll\./   { next }
                                            { print }
' "$input" > "$output"
