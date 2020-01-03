section     .text
global      _start                              ;must be declared for linker (ld)

_start:                                         ;tell linker entry point

    mov     edx,len                             ;message length
    mov     ecx,msg                             ;message to write
    mov     ebx,1                               ;file descriptor (stdout)
    mov     eax,4                               ;system call number (sys_write)
    int     0x80                                ;call kernel

    mov     edx,len2                             ;message length
    mov     ecx,msg2                             ;message to write
    mov     ebx,1
    ;mov     eax,4                               ;system call number (sys_write)
    add eax, 4
    int     0x80  	

    mov     edx,len3                             ;message length
    mov     ecx,msg3                             ;message to write
    mov     ebx,1
    ;mov     eax,4                               ;system call number (sys_write)
    add eax, 4
     int     0x80 	


    mov     eax,1                               ;system call number (sys_exit)
    int     0x80                                ;call kernel

section     .data

msg     db  '1111',0xa                 ;our dear string
msg2    db  '2222',0xa
msg3    db  '3333',0xa

len     equ $ - msg                             ;length of our dear string
len2    equ $ - msg2
len3    equ $ - msg3

