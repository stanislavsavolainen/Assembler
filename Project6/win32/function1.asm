global _main
	extern _printf

section .bss
section .text
_func:

    push msg4
    call _printf
    add esp, 4  
     
    push linebreak
    call _printf
    add esp, 4  
	 
ret ; return next line after this function called


_func2:

    
    ; ------- function parameter 1 ----------	
    
    mov eax, [esp+4]
    mov [param1] , eax  
    
    push param1
    call _printf
    add esp, 4 	 
    
    push linebreak
    call _printf
    add esp, 4  
    
     ; ------- function parameter 2 ----------  
    
    mov eax, [esp+8]
    mov [param2] , eax      

    push param2
    call _printf
    add esp, 4 	 
    
    push linebreak
    call _printf
    add esp, 4  	
	
     ; ------- function parameter 3 ----------  
    
    mov eax, [esp+12]
    mov [param3] , eax      

    push param3
    call _printf
    add esp, 4 	 
    
    push linebreak
    call _printf
    add esp, 4  
    

ret ; return next line after this function called


_main:                  ;tell linker entry point


    call _func

    
    push msg5
    call _printf
    add esp, 4
    
    push linebreak
    call _printf
    sadd esp, 4  


    call _func

    ; like ANCI-C  void func2( '3' , '2' , '1'); 
    push 49   ; parameter 3
    push 50   ; parameter 2
    push 51   ; parameter 1   
    call _func2

  
    push linebreak
    call _printf
    add esp, 4

    push msg5
    call _printf
    add esp, 4

ret 

section .data

    param1 dd "-" , 0
    param2 dd "-" , 0
    param3 dd "-" , 0
    msg4    db  "text inside function", 0
    msg5    db  "text after function" , 0
    linebreak db "",0xa, 0xd

                          