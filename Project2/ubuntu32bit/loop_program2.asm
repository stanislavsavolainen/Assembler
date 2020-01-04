section     .text
global      _start                              ;must be declared for linker (ld)


_myloop:

    push eax	; save value of eax register from add command before use eax register for interupt write method
	
                                ;message length
    ;mov     ecx,msg                             ;message to write
    ;mov ebx , [ mynumbers  ]
    ;mov [number] , ebx
    
    ;mov eax, 0

    mov edx, len2
    mov ecx, mynumbers
    ;add     ecx, 48  
    mov     ebx,1 
    mov     eax,4                               ;system call number (sys_write)
    int     0x80 

    
    ;mov edx, len4
    ;mov ecx, linebreak
    ;mov     ebx,1 
    ;add     eax,4                               ;system call number (sys_write)
    ;int     0x80


    pop eax ; restore saved eax register value to continue loop	
	
	add eax, 1 ; eax += 1
	
	jmp _next   ; jump anyway cmp command not required

_start:                                         ;tell linker entry point

     mov eax, 0	  ; eax = 0

    _next:
                    
    cmp eax, [count]
    jl _myloop    ; if  eax < count then jump to _myloop label 	

    ; don't continue if eax value is under counter directive constant


	
    mov     edx,len2                             ;message length
    mov     ecx,mynumbers                             ;message to write
    mov     ebx,1                               ;file descriptor (stdout)
    mov     eax,4                               ;system call number (sys_write)
    int     0x80 



    mov     eax,1                               ;system call number (sys_exit)
    int     0x80                                ;call kernel

section     .data

msg     db  'Hello, world!',0xa                 ;our dear string
len     equ $ - msg
count dd 10      
mynumbers : dd 48, 49, 50, 51, 52, 53, 54, 55, 56, 57, 0xa
len2     equ $ - mynumbers
number db '' , 0xa
len3 equ $ - number
linebreak db '-' , 0xa
len4 equ $ - linebreak
