global _main
extern _printf
extern _scanf 

section .data
   
	formatin: db "%d", 0
	;integer1: times 4 db 0
	integer1 db "123456" , 0
	inputcount  dd 0
	formatout: db "%s", 0 ; newline, nul terminator
	msg1: db "Enter value :",0 
	linebreak: db " ", 0xA , 0xD, 0
	enterkey: db "",0xD
	message: db "Hello World !", 0

section .bss
section .text
_main:
	
	
	
	push msg1
	call _printf
	add esp, 4
	
	
   ;push integer1 ; address of integer1 (second parameter)
   push inputcount
   push formatin ; arguments are right to left (first parameter)
   call _scanf
   add esp, 8 ; remove parameters	
   
   
   ;push integer1
   ;call _printf
   ;add esp, 4
   
  ; push linebreak
  ; call _printf
  ; add esp, 4
   
   ;mov esp, 0
   
   ;-------------------------- loop -----------------
   
   mov eax, 0 ;
   ;mov [inputcount], integer1   ; operation size not permited  mov dd-directive, db-directive not posible
   
   myloop:
   
		push eax ; save eax value before use printf function 
		
		
		 
		push message
		call _printf
		add esp, 4
		
		;line break
		push linebreak
		call _printf
		add esp, 4
		
		pop eax ; restore eax value after printf function 
	
		add eax , 1 ; eax = eax + 1
		
		cmp eax, [inputcount]  ; if eax is smaller than "count" -> then jump
		jl myloop
   
   
   ;-------------------------------------------------
   
   ;push enterkey
  ; call _printf       ; display the sum
  ; add esp , 4
   
   ;push ebx
  ; push formatout
  ; call _printf       ; display the sum
   ;add esp , 4
   ;add  esp, 8       ; remove parameters

   	
	

ret