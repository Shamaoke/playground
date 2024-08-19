;;
;; ::: hello32.asm :::
;;
section .data
  msg  db  "Hello, world!", 0xa
  .len equ $ - msg

section .bss

section .text
  global _start

_start:
  mov eax, 0x4     ; write
  mov ebx, 0x1     ; stdout
  mov ecx, msg
  mov edx, msg.len
  int 0x80         ; write(stdout, msg, strlen(msg));

  xor eax, msg.len ; invert return value from write()
  xchg eax, ebx    ; value for exit()
  mov eax, 1       ; exit
  int 0x80         ; exit(...)


