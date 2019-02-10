extern _strcmp
extern _asprintf
extern _printf
extern _dprintf
extern _system

section .text
global _main

_main:
push	rbp
mov		rbp, rsp
sub		rsp, 48

mov		eax, [rel i]
cmp		eax, 0
jle		exit

lea		rdi, [rel file]
lea		rsi, [rel sully]
call	_strcmp
cmp		rax, 0
je		create_file_name

mov		rax, [rel i]
dec		rax
mov		[rel i], rax

create_file_name:
lea		rdi, [rsp]
lea		rsi, [rel filename]
mov		rdx, [rel i]
call	_asprintf

mov		rdi, [rsp]
mov		rsi, 0x202
mov		rdx, 0o644
mov		rax, 0x2000005
syscall
cmp		rax, -1
je		exit
mov		[rsp+16], rax

mov		rdi, [rsp+16]
lea		rsi, [rel format]
lea		rdx, [rel format]
mov		rcx, [rel i]
mov		r8, 9
mov		r9, 10
push	37
push	34
call	_dprintf
pop		rax
pop		rax

mov		rdi, [rsp+16]
mov		rax, 0x2000006
syscall

lea		rdi, [rsp+32]
lea		rsi, [rel compile]
mov		rdx, [rel i]
call	_asprintf

mov		rdi, [rsp+32]
call	_system

exit:
mov		rsp, rbp
pop		rbp
ret

section .data

i: dd 5
file: db __FILE__, 0
sully: db "Sully.s", 0
filename: db "Sully_%d.s", 0
compile: db "nasm -f macho64 Sully_%1$d.s -o Sully_%1$d.o && gcc -Wall -Wextra -Werror Sully_%1$d.o -o Sully_%1$d && rm Sully_%1$d.o && ./Sully_%1$d", 0
format: db "extern _strcmp%4$cextern _asprintf%4$cextern _printf%4$cextern _dprintf%4$cextern _system%4$c%4$csection .text%4$cglobal _main%4$c%4$c_main:%4$cpush%3$crbp%4$cmov%3$c%3$crbp, rsp%4$csub%3$c%3$crsp, 48%4$c%4$cmov%3$c%3$ceax, [rel i]%4$ccmp%3$c%3$ceax, 0%4$cjle%3$c%3$cexit%4$c%4$clea%3$c%3$crdi, [rel file]%4$clea%3$c%3$crsi, [rel sully]%4$ccall%3$c_strcmp%4$ccmp%3$c%3$crax, 0%4$cje%3$c%3$ccreate_file_name%4$c%4$cmov%3$c%3$crax, [rel i]%4$cdec%3$c%3$crax%4$cmov%3$c%3$c[rel i], rax%4$c%4$ccreate_file_name:%4$clea%3$c%3$crdi, [rsp]%4$clea%3$c%3$crsi, [rel filename]%4$cmov%3$c%3$crdx, [rel i]%4$ccall%3$c_asprintf%4$c%4$cmov%3$c%3$crdi, [rsp]%4$cmov%3$c%3$crsi, 0x202%4$cmov%3$c%3$crdx, 0o644%4$cmov%3$c%3$crax, 0x2000005%4$csyscall%4$ccmp%3$c%3$crax, -1%4$cje%3$c%3$cexit%4$cmov%3$c%3$c[rsp+16], rax%4$c%4$cmov%3$c%3$crdi, [rsp+16]%4$clea%3$c%3$crsi, [rel format]%4$clea%3$c%3$crdx, [rel format]%4$cmov%3$c%3$crcx, [rel i]%4$cmov%3$c%3$cr8, 9%4$cmov%3$c%3$cr9, 10%4$cpush%3$c37%4$cpush%3$c34%4$ccall%3$c_dprintf%4$cpop%3$c%3$crax%4$cpop%3$c%3$crax%4$c%4$cmov%3$c%3$crdi, [rsp+16]%4$cmov%3$c%3$crax, 0x2000006%4$csyscall%4$c%4$clea%3$c%3$crdi, [rsp+32]%4$clea%3$c%3$crsi, [rel compile]%4$cmov%3$c%3$crdx, [rel i]%4$ccall%3$c_asprintf%4$c%4$cmov%3$c%3$crdi, [rsp+32]%4$ccall%3$c_system%4$c%4$cexit:%4$cmov%3$c%3$crsp, rbp%4$cpop%3$c%3$crbp%4$cret%4$c%4$csection .data%4$c%4$ci: dd %2$d%4$cfile: db __FILE__, 0%4$csully: db %5$cSully.s%5$c, 0%4$cfilename: db %5$cSully_%6$cd.s%5$c, 0%4$ccompile: db %5$cnasm -f macho64 Sully_%6$c1$d.s -o Sully_%6$c1$d.o && gcc -Wall -Wextra -Werror Sully_%6$c1$d.o -o Sully_%6$c1$d && rm Sully_%6$c1$d.o && ./Sully_%6$c1$d%5$c, 0%4$cformat: db %5$c%1$s%5$c, 0%4$c", 0
