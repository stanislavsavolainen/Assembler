section     .text
global      _start                              ;must be declared for linker (ld)


_myloop:

    push eax	                                ; save value of eax register from add command before use eax register for interupt write method
	
    mov     edx,len                             ;message length
    mov     ecx,msg                             ;message to write
    mov     ebx,1                               ;file descriptor (stdout)
    mov     eax,4                               ;system call number (sys_write)
    int     0x80 

    pop eax                                     ; restore saved eax register value to continue loop	
    
    add eax, 1 ; eax += 1;
	
    jmp _next                                   ; jump without condition , cmp command not required

_start:                                         ;tell linker entry point

     mov eax, 0	                                ; eax = 0

    _next:
                    
    cmp eax, [count]
    jl _myloop                                  ; if  eax < count then jump to _myloop label 	

                                                ; dont continue if eax value is under counter directive constant

    mov     eax,1                               ;system call number (sys_exit)
    int     0x80                                ;call kernel

section     .data
    msg     db  'Hello, world!',0xa             ;our dear string
    len     equ $ - msg
    count dd 10      