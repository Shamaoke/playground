vim9script

var Sample = (file) => printf("%s", file)

def DoWork()
  echomsg expand("<script>:h")->Sample()
enddef

command DoWork DoWork()

# vim: set textwidth=80 colorcolumn=80:
