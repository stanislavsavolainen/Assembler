section     .text
global      _start                              ;must be declared for linker (ld)


_func:

   mov     edx,len4                             ;message length
   mov     ecx,msg4                             ;message to write
   mov     ebx,1                                ;file descriptor (stdout)
   mov     eax,4                                ;system call number (sys_write)
   ;add eax, 4
   int     0x80   


ret


_func2:

    
    ; ------- function parameter 1 ----------	
    
    mov eax, [esp+4]
    mov     [param1] , eax  

    mov     edx, len_param1                     ;message length
    mov     ecx, param1                     	;message to write
    mov     ebx,1                               ;file descriptor (stdout)
    mov     eax,4                               ;system call number (sys_write)
    int     0x80   

   
    mov     edx,len_linebreak                   ;message length
    mov     ecx,linebreak                       ;message to write
    mov     ebx,1                               ;file descriptor (stdout)
    mov     eax,4                               ;system call number (sys_write)
    ;add eax, 4
    int     0x80 

    
     ; ------- function parameter 2 ----------  
    
     mov eax, [esp+8]
     mov     [param2] , eax      

     mov     edx, len_param2                     ;message length
     mov     ecx, param2                     	 ;message to write
     mov     ebx,1                               ;file descriptor (stdout)
     mov     eax,4                               ;system call number (sys_write)
     int     0x80   


     mov     edx,len_linebreak                   ;message length
     mov     ecx,linebreak                       ;message to write
     mov     ebx,1                               ;file descriptor (stdout)
     mov     eax,4                               ;system call number (sys_write)
     ;add eax, 4
     int     0x80 


     ; ------- function parameter 3 ----------  
    
     mov eax, [esp+12]
     mov     [param3] , eax      

     mov     edx, len_param3                     ;message length
     mov     ecx, param3                     	 ;message to write
     mov     ebx,1                               ;file descriptor (stdout)
     mov     eax,4                               ;system call number (sys_write)
     int     0x80   

     mov     edx,len_linebreak                   ;message length
     mov     ecx,linebreak                       ;message to write
     mov     ebx,1                               ;file descriptor (stdout)
     mov     eax,4                               ;system call number (sys_write)
     ;add eax, 4
     int     0x80 
    

ret




_start:                                         ;tell linker entry point


    call _func

    
    mov     edx,len5                            ;message length
    mov     ecx,msg5                            ;message to write
    mov     ebx,1                               ;file descriptor (stdout)
    mov     eax,4                               ;system call number (sys_write)
    ;add eax, 4
    int     0x80 


    call _func

    ; like ANCI-C  void func2( '3' , '2' , '1'); 
    push 49   ; parameter 3
    push 50   ; parameter 2
    push 51   ; parameter 1   
    call _func2

  
    mov     edx,len_linebreak                   ;message length
    mov     ecx,linebreak                       ;message to write
    mov     ebx,1                               ;file descriptor (stdout)
    mov     eax,4                               ;system call number (sys_write)
    ;add eax, 4
    int     0x80 

    mov     edx,len5                            ;message length
    mov     ecx,msg5                            ;message to write
    mov     ebx,1                               ;file descriptor (stdout)
    mov     eax,4                               ;system call number (sys_write)
    ;add eax, 4
    int     0x80 


    mov     eax,1                               ;system call number (sys_exit)
    int     0x80                                ;call kernel

section  .data


    msg4    db  'text inside function', 0xa
    len4    equ $ - msg4

    msg5    db  'text after function' , 0xa
    len5    equ $ - msg5

    linebreak db '',0xa
    len_linebreak equ $ - linebreak 

    param1 db '-' , 0
    len_param1 equ $ - param1

    param2 db '-' , 0
    len_param2 equ $ - param2

    param3 db '-' , 0
    len_param3 equ $ - param3

                          




