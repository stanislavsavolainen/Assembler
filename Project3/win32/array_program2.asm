

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
			
				mov ebx, [mynumbers + eax * 4]   ; msg2 - varriable is double-word wich is 4 byte at one element
				mov [data1], ebx
			
				push data1
				call _printf
				add esp, 4
				
				jmp _linebreaks
			    continue_loop:
				
			
			pop eax ; restore eax for counter

			add eax, 1
			
			cmp eax, 10 ; loop counter
			jl myloop
		
			mov eax, 0
		
			myloop2:
				push eax ; save eax for counter
				
					mov ebx, [mynumbers + eax * 4]   ; msg2 - varriable is double-word wich is 4 byte at one element
					mov [data1], ebx
				
					push data1
					call _printf
					add esp, 4
				
				pop eax ; restore eax for counter
				add eax, 1
				cmp eax, 10 ; loop counter
			jl myloop2
		
		
		ret
	
	
section .data
	msg:    db "Hello World",10,0
	
	; H = 72 , e = 101, l = 73 , o = 111, _ = 95, a = 97, s = 115, m = 109, b = 98, r = 114
	msg2: dd 72, 101, 73, 73, 111, 95, 97, 115, 115, 101, 109, 98, 73, 101, 114
	
	msg3: dd 'H', 'e', 'l', 'l', 'o', '.', '.','.','!'
	
    data1: db "", 0 
		
	count dd 10
	
	mynumbers : dd 48, 49, 50, 51, 52, 53, 54, 55, 56, 57, 0xa
	
	linebreak db "-",0xA, 0xD
	;linebreak2 db "",0xA, 0xD
	