

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
		
		; ESI - register not used in win32 nasm code
		;mov esi, str1 ; make esi-register to point to str1 - directive wich is DB
		
		
		
		myloop:
			push eax ; save eax for counter
			
				;mov ebx, [msg2 + eax * 4]   ; msg2 - varriable is double-word wich is 4 byte at one element
				mov ebx, [str1 + eax * 1 - 3] ;  ; str - varriable is DB wich is 1 byte at one element
				;mov [ebx + 1] , 0x2b 
				;mov ebx , 0x00002b
				shr ebx, 24    ; shift 24 bits right to not put 4 character in same line , 
						; because when eax 4 bytes ( 32 bit) is moving 4 db character on screen in same line
				mov [data1], ebx
				
				; ESI - register not used in win32 nasm code
				;mov [data1] , esi
			
				push data1
				;mov ecx, esi
				;push str1
				;push ecx
				call _printf
				add esp, 4
				
				;add esi, 1       ; increase esi-register by 1 because we work with DB-directive
				
				jmp _linebreaks
			    continue_loop:
				
			
			pop eax ; restore eax for counter

			add eax, 1
			
			;cmp eax, [count] ; loop counter
			cmp eax, 20 ; count - directive not working properly , fix required there			
			jl myloop
		
		
		
		
		
		ret
	
	
section .data
	msg:    db "Hello World",10,0
	
	str1: db 'hello from stanislav', 0
	
	; H = 72 , e = 101, l = 108 , o = 111, _ = 95, a = 97, s = 115, m = 109, b = 98, r = 114
	msg2: dd 72, 101, 108, 108, 111, 95, 97, 115, 115, 101, 109, 98, 73, 101, 114
	
	msg3: dd 'H', 'e', 'l', 'l', 'o', '.', '.','.','!', 0
	
    data1: db "", 0 
		
	count dd 15
	
	linebreak db "-",0xA , 0xD