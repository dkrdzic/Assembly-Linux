.intel_syntax noprefix
.arch i386

.data

niz:
.int 1,2,3

broj:
.byte 97

text:
.asciz "Zdravo\n"

izlaz_text:
.asciz "Slovo je %c\n"

izlaz:
.asciz "Brojevi su: %d,%d,%d\n"


izlaz1:
.asciz "Broj je %c\n"

.text

.extern printf
.extern scanf
.extern exit

.global _start

_start:


push broj
push offset izlaz1
call printf
add esp,5



mov eax,offset niz
push [eax+8]
push [eax+4]
push [eax]
push offset izlaz
call printf

add esp,8


push text
push offset izlaz_text
call printf
add esp,5

mov eax, offset text
push [eax+1]
push offset izlaz_text
call printf
add esp,5




push 0
call exit
.end



