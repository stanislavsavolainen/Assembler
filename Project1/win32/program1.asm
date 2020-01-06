global _main
extern _printf

section .data
msg db "Hello, World!",0
section .bss
section .text
_main:
	push ebp
	mov ebp, esp
	

	push msg
	call _printf
	add esp, 4



	mov esp,ebp
	pop ebp

ret