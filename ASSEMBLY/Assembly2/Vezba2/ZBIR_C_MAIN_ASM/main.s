.intel_syntax noprefix
.arch i386




.data

.global var
var: .int 45

unos_text:
.asciz "Unesi dva broja:\n"

unos:
.asciz "%d%d"

izlaz:
.asciz "Zbir je:%d\n"


proveri_k:
.asciz "K je %d\n"

.extern k


.text



.extern zbir
.extern printf
.extern scanf
.extern exit






.global _start
_start:
call  main

call exit

.type main, @function

.func main
main:

enter 8,0


push offset unos_text
call printf
add esp,4

lea eax, [ebp-8]
push eax
lea eax,[ebp-4]
push eax
push offset unos
call scanf
add esp,12

push [ebp-8]
push [ebp-4]
call zbir 
add esp,8

push eax
push offset izlaz
call printf
add esp,8


push k
push offset proveri_k
call printf
add esp, 8



leave
ret

.endfunc

.end

