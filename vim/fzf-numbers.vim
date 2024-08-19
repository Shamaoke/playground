vim9script
##                       ##
# ::: Fzf Numbers 2.0 ::: #
##                       ##

#
# Display a list of numbers to choose from.
#

#
# How to use
# ----------
# 1. Create the `data.txt` file with the command: `seq 1 1000000 > data.txt`;
# 2. Run Vim with the command: `vim -S fzf-numbers.vim`;
# 3. In the Vim command line run the command: `:FzfNN`.
# 4. Choose a number and press `Enter` to confirm or press `Esc` to cancel and close a Fzf window.
#

echomsg 'Fzf Numbers has been loaded!'

var data = 'data.txt'

var tmp_file: string
var tmp_data: string

var width: number
var height: number

var command = [
  'fzf',
  '--border=sharp',
  '--expect=esc,enter',
  '--bind=focus:transform-border-label:printf "Number %4d is selected" {1}',
]

var popup_options = {
  # title: '─{{{ Fzf Numbers }}}─',
  # border: [1, 1, 1, 1],
  # borderchars: ['─', '│', '─', '│', '┌', '┐', '┘', '└'],
}

def ExitCallback(job: job, status: number): void
  execute('quit')
enddef

def CloseCallback(channel: channel): void
  var [key, value] = readfile(tmp_file)

  delete(tmp_file)
  delete(tmp_data)

  if key == 'enter'
    echomsg value
  else
    echomsg '∅'
  endif
enddef

var term_options = {
  'hidden': true,
  'out_io': 'file',
  'exit_cb': ExitCallback,
  'close_cb': CloseCallback,
}

def Run( ): void
  tmp_file = tempname()
  tmp_data = tempname()

  width  = (&columns * 0.8)->ceil()->float2nr()
  height = (&lines * 0.8)->ceil()->float2nr()

  readfile(data)
    ->filter((_, v) => v->str2nr() % 2 == 0)
    ->writefile(tmp_data)

  term_start(
    command
      ->extendnew([$'--bind=start:reload^cat ''{tmp_data}''^']),
    term_options
      ->extendnew({'out_name': tmp_file}))
    ->popup_create(
        popup_options
          ->extendnew({'minwidth': width, 'minheight': height}))
enddef

command FzfNN Run()

# vim: set textwidth=80 colorcolumn=80:
