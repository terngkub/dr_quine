extern _strcmp
extern _asprintf
extern _printf
extern _dprintf
extern _system
extern _free

section .text
global _main

_main:
	; init
	push	rbp
	mov		rbp, rsp
	sub		rsp, 160

	; check integer
	mov		eax, [rel i]
	cmp		eax, 0
	jle		exit

	; check Sully.s
	lea		rdi, [rel file]
	lea		rsi, [rel sully]
	call	_strcmp
	cmp		rax, 0
	jne		create_file_name

	; decrement i
	mov		rax, [rel i]
	dec		rax
	mov		[rel i], rax

create_file_name:
	; create filename
	lea		rdi, [rsp]
	lea		rsi, [rel filename]
	mov		rdx, [rel i]
	call	_asprintf

	; create file
	mov		rdi, [rsp]
	mov		rsi, 0x202
	mov		rdx, 0o644
	mov		rax, 0x2000005
	syscall
	cmp		rax, -1
	je		exit
	mov		[rsp+4], rax

	; write file
	mov		rdi, [rsp+4]
	lea		rsi, [rel format]
	lea		rdx, [rel format]
	mov		rcx, 9
	mov		r8, 10
	mov		r9, 34
	call	_dprintf

	; close file
	mov		rdi, [rsp+4]
	mov		rax, 0x2000006
	syscall

exit:
	mov		rsp, rbp
	pop		rbp
	ret

section .data

i: dd 5
file: db __FILE__, 0
sully: db "Sully.s", 0
filename: db "Sully_%d.s", 0
format: db "abc", 0
compile: db "nasm -f macho64 Sully_%d.s -o Sully_%d.o && gcc -Wall -Wextra -Werror Sully_%d.o -o Sully_%d", 0
run: db "./Sully_%d", 0