vim9script
##                    ##
# ::: Lambda Term :::  #
##                    ##

var title  = 'Files'
var width  = 0.8
var height = 0.8

var command = [
  'fzf',
  '--no-multi',
  '--preview-window=sharp:',
  '--preview=bat --color=always --style=numbers {1}',
  '--ansi',
  '--expect=esc,enter,ctrl-t,ctrl-s,ctrl-v'
]

var popup_options = {
  title: title,
  border: [1, 1, 1, 1],
  borderchars: ['─', '│', '─', '│', '┌', '┐', '┘', '└']
}

var ExitCb = (job: job, status: number): string => execute('quit')

var Begin = ( ): func(string): string =>
  (file: string): string => execute(['edit assets/rabbit.txt', $"echo '{file}'"])->split("\n")->get(1)

var End = (Fn: func(string): string): func(string): string =>
  (file: string): string => printf("%d", writefile([Fn(file)->delete()], 'assets/result.txt'))

var OnEvent = (data: list<string>, event: string, action: string, Fn: func(string): string, file: string): string =>
  data[0] == event ? execute([$"{action} {data[1]}", $"echo '{file}'"])->split("\n")->get(1) : Fn(file)

var OnEnter = (Fn: func(string): string): func(string): string =>
  (file: string): string => OnEvent(readfile(file), 'enter', 'edit', Fn, file)

var OnCtrl_T = (Fn: func(string): string): func(string): string =>
  (file: string): string => OnEvent(readfile(file), 'ctrl-t', 'tabedit', Fn, file)

var OnCtrl_S = (Fn: func(string): string): func(string): string =>
  (file: string): string => OnEvent(readfile(file), 'ctrl-s', 'split', Fn, file)

var OnCtrl_V = (Fn: func(string): string): func(string): string =>
  (file: string): string => OnEvent(readfile(file), 'ctrl-v', 'vsplit', Fn, file)

var Process: func(string): string =
  Begin()->OnCtrl_V()->OnCtrl_S()->OnCtrl_T()->OnEnter()->End()

var SetCloseCb = (tmp_file: string): func(channel): string => (channel: channel): string =>
  tmp_file->Process()

var term_options = {
  'hidden': true,
  'out_io': 'file',
  'exit_cb': ExitCb
}

var ExtendPopupOptions = (a_popup_options: dict<any>): dict<any> =>
   a_popup_options->extendnew(
    { minwidth:  (&columns * width)->ceil()->float2nr(),
      minheight: (&lines * height)->ceil() ->float2nr() })

var ExtendTermOptions = (a_term_options: dict<any>, a_tmp_file: string): dict<any> =>
   a_term_options->extendnew(
     { 'out_name': a_tmp_file,
       'close_cb': SetCloseCb(a_tmp_file) })

var LambdaTerm = ( ): void =>
  term_start(command, term_options->ExtendTermOptions(tempname()))->popup_create(popup_options->ExtendPopupOptions())

command LT LambdaTerm()

# vim: set textwidth=80 colorcolumn=80:
