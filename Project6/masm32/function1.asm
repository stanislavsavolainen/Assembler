.386
.model flat, stdcall
option casemap:none

include \masm32\include\kernel32.inc
includelib \masm32\lib\kernel32.lib

include \masm32\include\masm32.inc
includelib \masm32\lib\masm32.lib

.data
    linebreak db " ", 13, 10, 0 
    msg4    db  'Text inside function', 13, 10 , 0
    msg5    db  'Text after function' , 13, 10 , 0
    param1 db '-' , 0
    param2 db '-' , 0
    param3 db '-' , 0

.code

_func:

    push offset msg4
    call StdOut  

ret ; return back to next line where this function called,  


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
    
ret ; return back to next line where this function called,  


start:
       
    call _func

    push offset msg5
    call StdOut
	   
    call _func

    ; like ANCI-C  void func2( 3 , 2 , 1); 
    push offset 49   ; parameter 3
    push offset 50   ; parameter 2
    push offset 51   ; parameter 1   
    call _func2

    push offset linebreak
    call StdOut    
    
    push offset msg5
    call StdOut
	       
exit:
       push 0                                  ; exit code for the process and all threads
       call ExitProcess                        ; invoke ExitProcess API
end start