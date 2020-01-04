section     .text
global      _start                              ;must be declared for linker (ld)




_myloop:

    push eax	; save value of eax register from add command before use eax register for interup write method
	
                                ;message length
    ;mov     ecx,msg                             ;message to write
    ;mov ebx , [ mynumbers  ]
    ;mov [number] , ebx
    
    ;mov eax, 0

    
   


    mov edx, 1
    mov ecx, esi
    add esi, 4  ; increase esi-register by 4 because we work with DD-directive

   ;mov ecx, 50
    ;add     ecx, 48  
    mov     ebx,1 
    mov     eax,4                               ;system call number (sys_write)
    int     0x80 

    
    mov edx, len4
    mov ecx, linebreak
    mov     ebx,1 
    mov     eax,4                               ;system call number (sys_write)
    int     0x80


    pop eax	
	
	add eax, 1 ;  ; restore saved eax register value to continue loop	
	
	jmp _next   ; jump anyway cmp command not required

_start:                                         ;tell linker entry point

     mov eax, 0	  ; eax = 0

     mov esi, mynumbers ; point esi - register to mynumbers directive wich is DD
     mov     edi, arraylen - 1 	

    _next:
                    
    cmp eax, [count]
    jl _myloop    ; if  eax < count then jump to _myloop label 	

    ; dont continue if eax value is under counter directive constant


	
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
arraylen equ ($ - mynumbers) / 4
