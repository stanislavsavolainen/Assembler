section     .text
global      _start                              ;must be declared for linker (ld)




_myloop:

    push eax	; save value of eax register from add command before use eax register for interup write method
	
                                ;message length
    ;mov     ecx,msg                             ;message to write
    ;mov ebx , [ mynumbers  ]
    ;mov [number] , ebx
    
    ;mov eax, 0

    ;mov     ecx,str1                             
    ;mov ebx , [ str1 + eax * 4 ]
    ;mov [number] , ebx
   


    mov edx, 1
    mov ecx, esi
    add esi, 1       ; increase esi-register by 1 because we work with DB-directive

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


    pop eax  ; restore saved eax register value to continue loop		
	
	add eax, 1 ; eax += 1;
	
	jmp _next   ; jump anyway cmp command not required

_start:                                         ;tell linker entry point

     mov eax, 0	  ; eax = 0

     mov esi, str1 ; make esi-register to point to str1 - directive wich is DB
     mov     edi, str1 - 1 	

    _next:
                    
    cmp eax, [count]
    jl _myloop    ; if  eax < count then jump to _myloop label 	

    ; dont continue if eax value is under counter directive constant


	


    mov     eax,1                               ;system call number (sys_exit)
    int     0x80                                ;call kernel

section     .data

msg     db  'Hello, world!',0xa                 ;our dear string
len     equ $ - msg
count dd 20      
str1 db 'hello from stanislav', 0xa
len2     equ $ - 1
number db '' , 0xa
len3 equ $ - number
linebreak db '-' , 0xa
len4 equ $ - linebreak
arraylen equ ($ - str1)
str_len equ $ -str1

 
