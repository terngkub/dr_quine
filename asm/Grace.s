extern _dprintf

section .text
global _main

_main:
	push	rbp
	mov		rbp, rsp
	sub		rsp, 16

	lea		rdi, [rel filename]
	mov		rsi, 0x202
	mov		rdx, 0o644
	mov		rax, 0x2000005
	syscall
	cmp		rax, -1
	jne		exit
	mov		[rsp], rax

	mov		rdi, [rsp]
	lea		rsi, [rel format]
	call	_dprintf

	mov		rdi, [rsp]
	mov		rax, 0x2000006
	syscall

exit:
	mov		rsp, rbp
	pop		rbp
	ret

section .data
	filename: db "Grace_kid.s", 0
	format: db "Hello World", 0
