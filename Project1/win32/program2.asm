global _main
extern _printf

section .data
msg1 db "1111",0
msg2 db "2222", 0
msg3 db "3333", 0
linebreak db " ", 0xA , 0xD
section .bss
section .text
_main:
	
	;push ebp
	;mov ebp, esp
	
	push msg1
	call _printf
	add esp, 4
	
	push linebreak
	call _printf
	add esp, 4

    push msg2
	call _printf
	add esp, 4
	
	push linebreak
	call _printf
	add esp, 4
	
	push msg3
	call _printf
	add esp, 4

	;mov esp,ebp
	;pop ebp

ret