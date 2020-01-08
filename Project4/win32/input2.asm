global _main
extern _printf
extern _scanf 

section .data
   
	formatin: db "%s", 0
	;integer1: times 4 db 0
	integer1 db "123456" , 0
	formatout: db "%s", 0 ; newline, nul terminator
	msg1 db "Enter value :",0 
	linebreak db " ", 0xA , 0xD
	enterkey db "",0xD

section .bss
section .text
_main:
	
	
	
	push msg1
	call _printf
	add esp, 4
	
	
   push integer1 ; address of integer1 (second parameter)
   push formatin ; arguments are right to left (first parameter)
   call _scanf
   add esp, 8 ; remove parameters	
   
   
   push integer1
   call _printf
   add esp, 4
   
   ;push enterkey
  ; call _printf       ; display the sum
  ; add esp , 4
   
   ;push ebx
  ; push formatout
  ; call _printf       ; display the sum
   ;add esp , 4
   ;add  esp, 8       ; remove parameters

   	
	

ret