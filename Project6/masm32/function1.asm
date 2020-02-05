.386
.model flat, stdcall
option casemap:none

include \masm32\include\kernel32.inc
includelib \masm32\lib\kernel32.lib

include \masm32\include\masm32.inc
includelib \masm32\lib\masm32.lib

.data
       dataMessage db "Hello world.", 0   ; define 12 bytes, fill it with 'Hello world.', 0 -> terminator
	   msg1 db "1111", 0
	   msg2 db "2222", 0
	   msg3 db "3333", 0
	   linebreak db " ", 13, 10, 0 

      msg4    db  'this is text inside function', 13, 10 , 0
	  msg5    db  'this is text after function' , 13, 10 , 0

      param1 db '-' , 0
	  param2 db '-' , 0
	  param3 db '-' , 0

.code

_func:

	   push offset msg4
	   call StdOut  

ret


_func2:

    
    ; ------- function parameter 1 ----------	
    
    mov eax, [esp+4]
    mov  dword ptr   [param1] , eax  ;  ptr - command will not work in nasm just  mov [param1] , eax

    push offset param1
    call StdOut
   
    push offset linebreak
    call StdOut
    
     ; ------- function parameter 2 ----------  
    
    mov eax, [esp+8]
    mov dword ptr [param2] , eax  ;  ptr - command will not work in nasm just  mov [param2] , eax    

    push offset param2
    call StdOut
   
    push offset linebreak
    call StdOut 


     ; ------- function parameter 3 ----------  
    
     mov eax, [esp+12]
     mov dword ptr [param3] , eax  ;  ptr - command will not work in nasm just  mov [param3] , eax    

    push offset param3
    call StdOut
   
    push offset linebreak
    call StdOut 
    

ret


start:
       ;push offset dataMessage               ; put in to stack the effective add of dataMessage
       ;call StdOut                                      ; invoke StdOut API

       call _func

	   push offset msg5
	   call StdOut
	   
	   call _func

       ; like ANCI-C  void func2( '3' , '2' , '1'); 
		push offset 49   ; parameter 3
		push offset 50   ; parameter 2
		push offset 51   ; parameter 1   
		call _func2

        push offset linebreak
        call StdOut    
    
       push offset msg5
	   call StdOut
	   

      
exit:
       push 0                                         ; exit code for the process and all threads
       call ExitProcess                              ; invoke ExitProcess API
end start