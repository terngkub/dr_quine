%macro extern 0
extern _dprintf
%endmacro

%macro text 0
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
	je		exit
	mov		[rsp], rax

	mov		rdi, [rsp]
	lea		rsi, [rel format]
	lea		rdx, [rel format]
	mov		rcx, 10
	mov		r8, 9
	mov		r9, 34
	call	_dprintf

	mov		rdi, [rsp]
	mov		rax, 0x2000006
	syscall

exit:
	mov		rsp, rbp
	pop		rbp
	ret
%endmacro

%macro data 0
section .data
	filename: db "Grace_kid.s", 0
	format: db "%%macro extern 0%2$cextern _dprintf%2$c%%endmacro%2$c%2$c%%macro text 0%2$csection .text%2$cglobal _main%2$c%2$c_main:%2$c%3$cpush	rbp%2$c%3$cmov		rbp, rsp%2$c%3$csub		rsp, 16%2$c%2$c%3$clea		rdi, [rel filename]%2$c%3$cmov		rsi, 0x202%2$c%3$cmov		rdx, 0o644%2$c%3$cmov		rax, 0x2000005%2$c%3$csyscall%2$c%3$ccmp		rax, -1%2$c%3$cje		exit%2$c%3$cmov		[rsp], rax%2$c%2$c%3$cmov		rdi, [rsp]%2$c%3$clea		rsi, [rel format]%2$c%3$clea		rdx, [rel format]%2$c%3$cmov		rcx, 10%2$c%3$cmov		r8, 9%2$c%3$cmov		r9, 34%2$c%3$ccall	_dprintf%2$c%2$c%3$cmov		rdi, [rsp]%2$c%3$cmov		rax, 0x2000006%2$c%3$csyscall%2$c%2$cexit:%2$c%3$cmov		rsp, rbp%2$c%3$cpop		rbp%2$c%3$cret%2$c%%endmacro%2$c%2$c%%macro data 0%2$csection .data%2$c%3$cfilename: db %4$cGrace_kid.s%4$c, 0%2$c%3$cformat: db %4$c%1$s%4$c, 0%2$c%%endmacro%2$c%2$cextern%2$ctext%2$cdata", 0
%endmacro

extern
text
data