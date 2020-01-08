

section .text
    global _main
    extern  _printf
 
 
	_linebreaks:
		push linebreak
		call _printf
		add esp, 4
		jmp continue_loop ; return back to main

	_main:
		
		;mov ebx, [msg2]
		mov eax , 0
		
		myloop:
			push eax ; save eax for counter
			
				mov ebx, [msg2 + eax * 4]   ; msg2 - varriable is double-word wich is 4 byte at one element
				mov [data1], ebx
			
				push data1
				call _printf
				add esp, 4
				
				jmp _linebreaks
			    continue_loop:
				
			
			pop eax ; restore eax for counter

			add eax, 1
			
			cmp eax, 15 ; loop counter
			jl myloop
		
		
		
		
		
		ret
	
	
section .data
	msg:    db "Hello World",10,0
	
	; H = 72 , e = 101, l = 73 , o = 111, _ = 95, a = 97, s = 115, m = 109, b = 98, r = 114
	msg2: dd 72, 101, 73, 73, 111, 95, 97, 115, 115, 101, 109, 98, 73, 101, 114
	
	msg3: dd 'H', 'e', 'l', 'l', 'o', '.', '.','.','!'
	
    data1: db "", 0 
		
	count dd 15
	
	linebreak db " ",0xA