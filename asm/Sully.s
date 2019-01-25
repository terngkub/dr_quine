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
	cmp		rax, 0
	jle		exit

	; check Sully.s
	;dec 	rax

	; create filename
	lea		rdi, [rsp]
	lea		rsi, [rel filename]
	mov		rdx, [rel i]
	call	_asprintf

	; debug - print filename
	mov		rdi, [rsp]
	call	_printf

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
	;lea		rdx, [rel format]
	; mov		rcx, 10
	; mov		r8, 9
	; mov		r9, 34
	call	_dprintf

	; close file
	mov		rdi, [rsp+4]
	mov		rax, 0x2000006
	syscall

	; ; compile

	; run

exit:
	mov		rsp, rbp
	pop		rbp
	ret

section .data

i: dd 5
filename: db "Sully_%d.s", 0
format: db "abc", 0
compile: db "clang -Wall -Wextra -Werror Sully_%d.c -o Sully_%d", 0
run: db "./Sully_%d", 0