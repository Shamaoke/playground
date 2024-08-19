vim9script
##
# ::: Popup Term :::
#

echomsg 'Popup term has been loaded!'

highlight Pmenu cterm=none ctermfg=008  ctermbg=none

var tmp_file: string = tempname()

# var columns: number = winwidth(0)
# var rows: number = winheight(0)

var width: number = (&columns * 0.8)->ceil()->float2nr()
var height: number = (&lines * 0.8)->ceil()->float2nr()

var command = [
  'fzf',
  # '--preview-window=borderl-left',
  # '--preview=bat --color=always --style=numbers {1}',
  # '--delimiter=\t',
  # '--tabstop=1',
  # '--expect=esc,enter,ctrl-t,ctrl-s,ctrl-v'
  '--expect=esc,enter'
]

var popup_options = {
  minwidth: width,
  minheight: height,
  # title: '─{Tags}─',
  border: [1, 1, 1, 1],
  borderchars: ['─', '│', '─', '│', '┌', '┐', '┘', '└'],
}

# def OutCallback(channel: channel, msg: string)
#   echomsg msg
# enddef

# def Handle(data: list<string>)
#   var [key, value] = data
#   add(result, value)
# enddef

# def ExitCallback(job: job, status: number): void
#   # system('sleep 5')
#   # system('exit')
#   # Handle(readfile(tmp_file))
#   # delete(tmp_file)
#   quit
# enddef

# var ExitCallback = (job: job, status: number): void => win_execute(0, 'quit')

# var ExitCallback = (job: job, status: number): string => execute('quit')
var ExitCallback = (job: job, status: number): string => execute('quit')

# def ChannelHandler(channel: channel, msg: string)
#   echomsg msg
# enddef

# def OutCallback(channel: channel, msg: string)
  # ch_setoptions(channel, {'callback': ChannelHandler})
  # ch_read(channel)
  # ch_readraw(channel)
  # echo ch_status(channel)
  # ch_close(channel)
  # ch_getbufnr(channel, 'out')
# enddef

def CloseCallback(channel: channel): void
  # execute $"buffer gold"
  # echomsg ch_status(channel)
  var [key, value] = readfile(tmp_file)

  delete(tmp_file)

  if key == 'enter'
    echomsg value
  else
    echomsg '∅'
  endif

  # if key == 'esc'
  #   execute $"::"
  # elseif key == 'enter'
  #   execute $"edit {value}"
  # elseif key == 'ctrl-t'
  #   execute $"tabedit {value}"
  # elseif key == 'ctrl-s'
  #   execute $"split {value}"
  # elseif key == 'ctrl-v'
  #   execute $"vsplit {value}"
  # endif
enddef

# var CloseCallback = (channel: channel): string => readfile(tmp_file)

# var CloseCallback = (file: string) => (channel: channel) => file

# CloseCallback(readfile(tmp_file))

# readfile(tmp_file)->CloseCallback()

# def Callback(channel: channel, msg: string): void
#   echomsg msg
# enddef

var term_options = {
  'hidden': true,
  # 'term_finish': 'close',
  # 'out_io': 'buffer',
  # 'out_name': 'gold',
  # 'out_msg': false, # Do not append the string "Reading from channel output..." to buffer. See `:help out_msg`.
  'out_io': 'file',
  'out_name': tmp_file,
  # 'in_io': 'buffer',
  # 'in_name': buf,
  # 'out_name': tmp_file,
  # 'out_cb': OutCallback,
  # 'exit_cb': ExitCallback,
  'close_cb': CloseCallback,
  # 'term_finish': 'open',
  # 'term_opencmd': 'buffer %d',
  # 'callback': Callback,
}

def PopupTerm(): void
  # var buf_nr = term_start(command, term_options)

  # var win_id = popup_create(buf_nr, popup_options)

  var fzf_default_command = $FZF_DEFAULT_COMMAND

  # var data = systemlist('cat tags')->filter((_, v) => v !~ '^!')->join('\n')
  # var data = readfile('tags')->filter((_, v) => v !~ '^!')->join('\n')

  var data = readfile('data-1000.txt')->join('\n')
  # var data = readfile('data-100_000.txt')->join('\n')

  # var data = systemlist('cat data-1000.txt')->join('\n')
  # var data = systemlist('cat data-100_000.txt')->join('\n')

  # echomsg data

  $FZF_DEFAULT_COMMAND = $"echo '{data}'"
  # $FZF_DEFAULT_COMMAND = $"cat data-100_000.txt"

  # $FZF_DEFAULT_COMMAND = $"echo '{data}' | column --table --separator=\\\t --output-separator=\\\t"
  # $FZF_DEFAULT_COMMAND = $"cat tags | column --table --separator=\\\t --output-separator=\\\t"

  try
    term_start(command, term_options)->popup_create(popup_options)
  finally
    $FZF_DEFAULT_COMMAND = fzf_default_command
  endtry
enddef

command PT PopupTerm()

