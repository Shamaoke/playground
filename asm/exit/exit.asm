; Program: exit
;
; Executes the `exit` system call
;
; Input: no input
;
; Output: the exit status ($? in the shell)
;

segment .text
global _start

_start:
  mov eax,1 ; 1 is the exit syscall number
  mov ebx,6 ; the status value to return
  int 0x80  ; exicute the system call

