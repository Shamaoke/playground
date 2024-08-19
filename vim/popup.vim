vim9script
##
# ::: Popup :::
#

var Id: list<number>
var Options: dict<any>
var Counter: list<string>
var Zindex: number = 1000
var MinWidth: number = 1
var MinHeight: number = 1
var Key: string = 'x'

def Filter(winid: number, key: string): number
  if key == Key
    popup_close(winid)
    return 0
  endif
  return 0
enddef

Options = {
  minwidth: MinWidth,
  minheight: MinHeight,
  title: 'Popup',
  border: [1, 1, 1, 1],
  borderchars: ['-', '|', '-', '|', '┌', '┐', '┘', '└'],
  zindex: Zindex,
  filter: Filter
}

def PushId(id: number): void
  add(Id, id)
enddef

def PopId(): number
  return remove(Id, -1)
enddef

def Open(): void
  Zindex = Zindex - 1
  MinHeight = MinHeight + 1
  MinWidth = MinWidth + 1
  add(Counter, '.')
  var id = popup_create('', Options)
  PushId(id)
  # popup_settext(id, join(Counter, "Ok\n"))
  echo Counter
  popup_settext(id, join(Counter, "->\n"))
  # echo Zindex
  echo MinHeight
  # echo join(Counter, '')
  # echo popup_list()
enddef

def Close(): void
  # remove(Counter, -1)
  popup_close(PopId())
  # echo join(Counter, '')
  # echo popup_list()
enddef

command Open Open()
command Close Close()

# `vim -u NONE -S popup.vim`

