 global  _main
    extern  _printf
  	
_main:


	mov eax, 0
	mov ebx, 10
	
	myloop:
   
		push eax ; save eax value before use printf function 
		
		
		;print function 
		push message1
		call _printf
		add esp, 4
		
		;line break
		push linebreak
		call _printf
		add esp, 4
		
		pop eax ; restore eax value after printf function 
	
		add eax , 1 ; eax = eax + 1
		
		cmp eax, [count]  ; if eax is smaller than "count" -> then jump
		jl myloop
	

ret


section .data

message1 db  " Hello World !",0
linebreak db " ",0xA, 0xD

count dd 10 ; value -> amout of loop counts 





