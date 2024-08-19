vim9script
##                ##
#  ::: Buffers ::: #
##                ##

def Buf( ): void
  # writefile([getbufinfo()->json_encode()], 'assets/bufinfo.json')
  var Cb = (_, v) =>
    ({ 'bufnr':  v->get('bufnr'),
       'name':   v->get('name'),
       'lnum':   v->get('lnum'),
       'loaded': v->get('loaded'),
       'listed': v->get('listed'),
       'hidden': v->get('hidden') })

  echomsg getbufinfo()->map(Cb)
enddef

command Buf Buf()

# vim: set textwidth=80 colorcolumn=80:
