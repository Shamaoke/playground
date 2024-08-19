vim9script

# var Data = 'b'
#
# # Default
# var Begin = ( ) => (Dt) => $"{Dt} from default"
#
# # Start
# var End = (Fn, Dt) => Fn(Dt)
#
# var DoA = (Fn) => (Dt) => Dt == 'a' ? $"{Dt} from a" : Fn(Dt)
#
# var DoB = (Fn) => (Dt) => Dt == 'b' ? $"{Dt} from b" : Fn(Dt)
#
# var DoC = (Fn) => (Dt) => Dt == 'c' ? $"{Dt} from c" : Fn(Dt)
#
# var Start = (Dt) => printf("%s", Begin()->DoA()->DoB()->DoC()->End(Dt))
#
# def Run(Dt: string): void
#   echomsg Start(Dt)
# enddef
#
# command Run Run(Data)

# var Data: string = 'Done!'
#
# var Begin: func(): func(string): string = ( ): func(string): string => (Dt: string): string => Dt
#
# var End: func(func): func(string): string = (Fn: func(string): string): func(string): string => (Dt: string): string => Fn(Dt)
#
# var Do: func(func): func(string): string = (Fn: func(string): string): func(string): string => (Dt: string): string => Fn(Dt)
#
# var Start: func(string): string = Begin()->Do()->End()
#
# def Run(Dt: string): void
#   echomsg Start(Dt)
# enddef
#
# command Run Run(Data)

# vim: textwidth=80 colorcolumn=80:
