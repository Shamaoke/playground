vim9script
##                 ##
# ::: Fzf Files ::: #
##                 ##

var title  = 'Files'
var width  = 0.8
var height = 0.8

var command = [
  'fzf',
  '--multi',
  '--preview-window=sharp:',
  '--preview=bat --color=always --style=numbers {1}',
  '--ansi',
  '--expect=esc,enter,ctrl-t,ctrl-s,ctrl-v'
]

$FZF_DEFAULT_COMMAND = 'fd --type file --color always .'

var popup_options = {
  title: title,
  border: [1, 1, 1, 1],
  borderchars: ['─', '│', '─', '│', '┌', '┐', '┘', '└']
}

var Default = ( ) => (file) => execute([$"edit assets/rabbit.txt", $"echo '{file}'"])->split("\n")->get(-1)

var Always = (Fn) => (file) => Fn(file)->delete()

var On = (event, action, data, Fn, file) =>
  data[0] == event ? execute([$"args {data->slice(1)}", $"{action}", $"echo '{file}'"])->split("\n")->get(-1) : Fn(file)

var OnEnter = (Fn) => (file) => On('enter', 'all', readfile(file), Fn, file)

var OnCtrl_T = (Fn) => (file) => On('ctrl-t', 'tab all', readfile(file), Fn, file)

var OnCtrl_S = (Fn) => (file) => On('ctrl-s', 'sall', readfile(file), Fn, file)

var OnCtrl_V = (Fn) => (file) => On('ctrl-v', 'vertical sall', readfile(file), Fn, file)

var Process = Default()->OnCtrl_V()->OnCtrl_S()->OnCtrl_T()->OnEnter()->Always()

var SetExitCb = ( ) => (job, status) => execute('quit')

var SetCloseCb = (tmp_file) => (channel) => tmp_file->Process()

var term_options = {
  'hidden': true,
  'out_io': 'file',
  'exit_cb': SetExitCb()
}

var ExtendPopupOptions = (a_popup_options) =>
   a_popup_options->extendnew(
    { minwidth:  (&columns * width)->ceil()->float2nr(),
      minheight: (&lines * height)->ceil() ->float2nr() })

var ExtendTermOptions = (a_term_options, a_tmp_file) =>
   a_term_options->extendnew(
     { 'out_name': a_tmp_file,
       'close_cb': SetCloseCb(a_tmp_file) })

var FzfFiles = ( ) =>
  term_start(command, term_options->ExtendTermOptions('assets/fzf-files'))->popup_create(popup_options->ExtendPopupOptions())

command FzfFiles FzfFiles()

# vim: set textwidth=80 colorcolumn=80:
