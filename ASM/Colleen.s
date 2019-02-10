global _main
global _print
extern _printf
; comment

section .text

_main:
	; comment
	call	_print
	ret

_print:
	lea		rdi, [rel format]
	lea		rsi, [rel format]
	mov		rdx, 10
	mov		rcx, 9
	mov		r8, 34
	call	_printf
	ret

section .data
format: db "global _main%2$cglobal _print%2$cextern _printf%2$c; comment%2$c%2$csection .text%2$c%2$c_main:%2$c%3$c; comment%2$c%3$ccall%3$c_print%2$c%3$cret%2$c%2$c_print:%2$c%3$clea%3$c%3$crdi, [rel format]%2$c%3$clea%3$c%3$crsi, [rel format]%2$c%3$cmov%3$c%3$crdx, 10%2$c%3$cmov%3$c%3$crcx, 9%2$c%3$cmov%3$c%3$cr8, 34%2$c%3$ccall%3$c_printf%2$c%3$cret%2$c%2$csection .data%2$cformat: db %4$c%1$s%4$c, 0%2$c", 0
