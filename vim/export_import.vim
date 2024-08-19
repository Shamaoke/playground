vim9script

# • Place `rabbit.vim` in `lib/import`.
# • Open vim with the command: `vim -u NONE --cmd 'set runtimepath+=$HOME/.development/playground/vim/lib' -S export_import.vim`.

import 'rabbit.vim' as Rabbit

command Greeting Rabbit.Greeting()

# vim: set textwidth=80 colorcolumn=80:
