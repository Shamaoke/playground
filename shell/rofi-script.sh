#!/usr/bin/env zsh

# run it with `rofi -show custom -modi custom:./rofi-script.sh
# the `.sh` extension is mandatory
# see `man 5 rofi-script` for details

function main {
  case $1 {
    (one)   notify-send --app-name=rofi 'Rofi' 'ok!'     ; exit 0 ;;
    (two)   notify-send --app-name=rofi 'Rofi' 'ok too!' ; exit 0 ;;
    (three) notify-send --app-name=rofi 'Rofi' 'ok free!'; exit 0 ;;
    (four)  notify-send --app-name=rofi 'Rofi' 'ok for!' ; exit 0 ;;
    (quit)  exit 0 ;;
  }

  echo '\x00prompt\x1f>'
  echo '\x00message\x1fSelect an entry'

  echo 'one'
  echo 'two'
  echo 'three'
  echo 'four'
  echo 'quit'
}

main $1
