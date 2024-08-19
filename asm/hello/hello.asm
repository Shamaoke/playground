;;
;; ::: hello.asm :::
;;

;;
;; Compile with:
;;
;; yasm -f|--oformat=elf64 \
;;      -g|--dformat=dwarf2 \
;;      -p|--parser=nasm \
;;      -l|--list=hello.lst \
;;      -o|--objfile=hello.o \
;;           hello.asm
;;
;; yasm -f help -- list yasm obect formats
;; yasm -g help -- list yasm debug formats
;; yasm -p help -- list yasm parsers
;;
;; Link with:
;;
;; ld -o|--output=hello hello.o
;;
;; or
;;
;; ld.lld -o|--output=hello hello.o
;;

section .data
  msg dd "Hello, world!",0xa
  len equ $ - msg

section .bss

section .text
  global _start

_start:
  mov rax, 0x1  ; 1 is to write
  mov rdi, 0x1  ; 1 is to stdout
  mov rsi, msg  ; string to display in rsi
  mov rdx, len  ; length of the string
  syscall       ; display the string
  mov rax, 0x3c ; 60 is exit
  mov rdi, 0x0  ; 0 is the success exit code
  syscall       ; quit

