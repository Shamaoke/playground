vim9script

# class Functions
#   static def DoMultiple(one: string, two: string = 'ok too!', three: string = 'ok free!'): void
#     echowindow join([one, two, three], ' ')
#   enddef
# endclass
#
# command Sample Functions.DoMultiple('ok!', 'ok two!', 'ok three!')

#
# writefile(data: list<string>, filename: string): number(0|-1)
# readfile(filename: string): list<string>
# delete(filename: string): number(0|1)
#

# var file = './data.txt'
# var dt = ['enter', 'sample.vim']
#
# dt->writefile(file)

# var IsKeyEsc    = (data: list<string>): bool => data[0] == 'esc'
# var IsKeyEnter  = (data: list<string>): bool => data[0] == 'enter'
# var IsKeyCtrl_T = (data: list<string>): bool => data[0] == 'ctrl-t'
# var IsKeyCtrl_S = (data: list<string>): bool => data[0] == 'ctrl-s'
# var IsKeyCtrl_V = (data: list<string>): bool => data[0] == 'ctrl-v'
#
# var Callback = (data: list<string>): string =>
#     data->IsKeyEsc()    ? data[1]
#   : data->IsKeyEnter()  ? data[1]
#   : data->IsKeyCtrl_T() ? data[1]
#   : data->IsKeyCtrl_S() ? data[1]
#   : data->IsKeyCtrl_V() ? data[1]
#   : ':'

# vim: textwidth=80 colorcolumn=80:
