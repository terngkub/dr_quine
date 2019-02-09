extern _strcmp
extern _asprintf
extern _printf
extern _dprintf
extern _system
extern _free

section .text
global _main

_main:
push    rbp
mov     rbp, rsp
sub     rsp, 800

mov     eax, [rel i]
cmp     eax, 0
jle     exit

lea     rdi, [rel file]
lea     rsi, [rel sully]
call    _strcmp
cmp     rax, 0
je      create_file_name

mov     rax, [rel i]
dec     rax
mov     [rel i], rax

create_file_name:
lea     rdi, [rsp]
lea     rsi, [rel filename]
mov     rdx, [rel i]
call    _asprintf

mov     rdi, [rsp]
mov     rsi, 0x202
mov     rdx, 0o644
mov     rax, 0x2000005
syscall
cmp     rax, -1
je      exit
mov     [rsp+16], rax

mov     rdi, [rsp+16]
lea     rsi, [rel format]
lea     rdx, [rel format]
mov     rcx, [rel i]
mov     r8, 9
mov     r9, 10
push    37
push    34
call    _dprintf
pop     rax
pop     rax

mov     rdi, [rsp+16]
mov     rax, 0x2000006
syscall

lea     rdi, [rsp+160]
lea     rsi, [rel compile]
mov     rdx, [rel i]
call    _asprintf

mov     rdi, [rsp+160]
call    _system

exit:
mov     rsp, rbp
pop     rbp
ret

section .data

i: dd 5
file: db __FILE__, 0
sully: db "Sully.s", 0
filename: db "Sully_%d.s", 0
compile: db "nasm -f macho64 Sully_%1$d.s -o Sully_%1$d.o && gcc -Wall -Wextra -Werror Sully_%1$d.o -o Sully_%1$d && ./Sully_%1$d", 0
format: db "extern _strcmp%4$cextern _asprintf%4$cextern _printf%4$cextern _dprintf%4$cextern _system%4$cextern _free%4$c%4$csection .text%4$cglobal _main%4$c%4$c_main:%4$cpush    rbp%4$cmov     rbp, rsp%4$csub     rsp, 800%4$c%4$cmov     eax, [rel i]%4$ccmp     eax, 0%4$cjle     exit%4$c%4$clea     rdi, [rel file]%4$clea     rsi, [rel sully]%4$ccall    _strcmp%4$ccmp     rax, 0%4$cje      create_file_name%4$c%4$cmov     rax, [rel i]%4$cdec     rax%4$cmov     [rel i], rax%4$c%4$ccreate_file_name:%4$clea     rdi, [rsp]%4$clea     rsi, [rel filename]%4$cmov     rdx, [rel i]%4$ccall    _asprintf%4$c%4$cmov     rdi, [rsp]%4$cmov     rsi, 0x202%4$cmov     rdx, 0o644%4$cmov     rax, 0x2000005%4$csyscall%4$ccmp     rax, -1%4$cje      exit%4$cmov     [rsp+16], rax%4$c%4$cmov     rdi, [rsp+16]%4$clea     rsi, [rel format]%4$clea     rdx, [rel format]%4$cmov     rcx, [rel i]%4$cmov     r8, 9%4$cmov     r9, 10%4$cpush    37%4$cpush    34%4$ccall    _dprintf%4$cpop     rax%4$cpop     rax%4$c%4$cmov     rdi, [rsp+16]%4$cmov     rax, 0x2000006%4$csyscall%4$c%4$clea     rdi, [rsp+160]%4$clea     rsi, [rel compile]%4$cmov     rdx, [rel i]%4$ccall    _asprintf%4$c%4$cmov     rdi, [rsp+160]%4$ccall    _system%4$c%4$cexit:%4$cmov     rsp, rbp%4$cpop     rbp%4$cret%4$c%4$csection .data%4$c%4$ci: dd %2$d%4$cfile: db __FILE__, 0%4$csully: db %5$cSully.s%5$c, 0%4$cfilename: db %5$cSully_%6$cd.s%5$c, 0%4$ccompile: db %5$cnasm -f macho64 Sully_%6$c1$d.s -o Sully_%6$c1$d.o && gcc -Wall -Wextra -Werror Sully_%6$c1$d.o -o Sully_%6$c1$d && ./Sully_%6$c1$d%5$c, 0%4$cformat: db %5$c%1$s%5$c, 0%4$c", 0
