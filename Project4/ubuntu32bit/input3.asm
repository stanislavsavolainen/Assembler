section     .text
global      _start                              ;must be declared for linker (ld)


_myloop:

    push eax	; save value of eax register from add command before use eax register for interup write method
	
    mov     edx,len                             ;message length
    mov     ecx,msg                             ;message to write
    mov     ebx,1                               ;file descriptor (stdout)
    mov     eax,4                               ;system call number (sys_write)
    int     0x80 

    pop eax	
	
	add eax, 1
	
	jmp _next   ; jump anyway cmp command not required

_start:                                         ;tell linker entry point



;write (stdout)  -> input text
    mov     edx,len3                             ;message length
    mov     ecx,msg2                             ;message to write
    mov     ebx,1                                ;file descriptor (stdout)
    mov     eax,4                                ;system call number (sys_write)
    int     0x80 


;read ( stdin)
    mov eax , 3   				;system call number (sys_read)
    mov ebx , 0
   ; mov ecx, input_variable
    mov ecx, count 				; use exsisting directive for loop count for mathing win32 input3.asm version
    mov edx, 1 					;how much byte read	
    int 0x80

; because numbers input is in ascii format substract 48 value to means for example if number 2 is 50 in ascii sub 48 to make it 2 is 2 value
mov eax , [count]
sub eax , 48
mov [count], eax

;------------ loop ------------------------------ 	

     mov eax, 0	  ; eax = 0

    _next:
                    
    cmp eax, [count]
    ; cmp eax, 5 
   jl _myloop    ; if  eax < count then jump to _myloop label 	

    ; dont continue if eax value is under counter directive constant

    mov     eax,1                               ;system call number (sys_exit)
    int     0x80                                ;call kernel

section     .data

msg     db  'Hello, world!',0xa                 ;our dear string
len     equ $ - msg				;length of our dear string
count dd 0
                        
linebreak     db  '', 0xa                       ;our dear string
len2     equ $ - linebreak                       ;length of our dear string

msg2     db  'Enter value :', 0                 ;our dear string
len3     equ $ - msg2  


input_variable dd 0



      
