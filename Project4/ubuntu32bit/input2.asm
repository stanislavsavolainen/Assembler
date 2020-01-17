section     .text
global      _start                              ;must be declared for linker (ld)

_start:                                         ;tell linker entry point

    mov     edx,len                             ;message length
    mov     ecx,msg                             ;message to write
    mov     ebx,1                               ;file descriptor (stdout)
    mov     eax,4                               ;system call number (sys_write)
    int     0x80                                ;call kernel

    ;read ( stdin)
    mov eax , 3   ;system call number (sys_read)
    mov ebx , 0
    mov ecx, input_variable
    mov edx, 10 ;how much byte read	
    int 0x80

   ; mov     edx,len2                            ;message length
   ; mov     ecx,linebreak                       ;message to write
   ; mov     ebx,1                               ;file descriptor (stdout)
   ; mov     eax,4                               ;system call number (sys_write)
   ; int     0x80  

    mov     edx,10                               ;message length
    mov     ecx,input_variable                  ;message to write
    mov     ebx,1                               ;file descriptor (stdout)
    mov     eax,4                               ;system call number (sys_write)
    int     0x80                                ;call kernel

    mov     eax,1                               ;system call number (sys_exit)
    int     0x80                                ;call kernel

section     .data

msg     db  'Enter value :', 0                 ;our dear string
len     equ $ - msg                            ;length of our dear string

linebreak     db  '', 0xa                       ;our dear string
len2     equ $ - linebreak                       ;length of our dear string


input_variable dd 0
