section     .text
global      _start                              ;must be declared for linker (ld)

;----- option coffee-----------
_label_coffee:
    mov     edx, len_option_is                  ;message length
    mov     ecx, option_is                      ;message to write
    mov     ebx,1                               ;file descriptor (stdout)
    mov     eax,4                               ;system call number (sys_write)
    int     0x80  


    mov     edx, len_coffee                     ;message length
    mov     ecx, option_coffee                  ;message to write
    mov     ebx,1                               ;file descriptor (stdout)
    mov     eax,4                               ;system call number (sys_write)
    int     0x80  
    
    mov     edx, len2                  		;message length
    mov     ecx, linebreak                      ;message to write
    mov     ebx,1                               ;file descriptor (stdout)
    mov     eax,4                               ;system call number (sys_write)
    int     0x80 

jmp label_exit_program

;----- option tea-------------
_label_tea:
    mov     edx, len_option_is                  ;message length
    mov     ecx, option_is                      ;message to write
    mov     ebx,1                               ;file descriptor (stdout)
    mov     eax,4                               ;system call number (sys_write)
    int     0x80  


    mov     edx, len_tea                      	;message length
    mov     ecx, option_tea                  	;message to write
    mov     ebx,1                               ;file descriptor (stdout)
    mov     eax,4                               ;system call number (sys_write)
    int     0x80  
    
    mov     edx, len2                  		;message length
    mov     ecx, linebreak                      ;message to write
    mov     ebx,1                               ;file descriptor (stdout)
    mov     eax,4                               ;system call number (sys_write)
    int     0x80 
jmp label_exit_program

;----- option milk------------
_label_milk:
    mov     edx, len_option_is                  ;message length
    mov     ecx, option_is                      ;message to write
    mov     ebx,1                               ;file descriptor (stdout)
    mov     eax,4                               ;system call number (sys_write)
    int     0x80  


    mov     edx, len_milk                      	;message length
    mov     ecx, option_milk                  	;message to write
    mov     ebx,1                               ;file descriptor (stdout)
    mov     eax,4                               ;system call number (sys_write)
    int     0x80  
    
    mov     edx, len2                  		;message length
    mov     ecx, linebreak                      ;message to write
    mov     ebx,1                               ;file descriptor (stdout)
    mov     eax,4                               ;system call number (sys_write)
    int     0x80 
jmp label_exit_program

;----- option not in list -----
_label_not_listed:

    mov     edx, len_option_not_exist           ;message length
    mov     ecx, option_not_exist               ;message to write
    mov     ebx,1                               ;file descriptor (stdout)
    mov     eax,4                               ;system call number (sys_write)
    int     0x80

    mov     edx, len2                  		;message length
    mov     ecx, linebreak                      ;message to write
    mov     ebx,1                               ;file descriptor (stdout)
    mov     eax,4                               ;system call number (sys_write)
    int     0x80 
jmp label_exit_program

_start:                                         ;tell linker entry point

   ;------- title -----------
    mov     edx, len_title                   ;message length
    mov     ecx, title                     ;message to write
    mov     ebx,1                               ;file descriptor (stdout)
    mov     eax,4                               ;system call number (sys_write)
    int     0x80 




    ;------- 1 --------------
    mov     edx, lenmenuenter                   ;message length
    mov     ecx, menuenter                     	;message to write
    mov     ebx,1                               ;file descriptor (stdout)
    mov     eax,4                               ;system call number (sys_write)
    int     0x80 
    

   ;mov     eax, 0x00002b
    mov     eax, 49
    mov     [num] , eax 
	
    mov     edx, len_num                        ;message length
    mov     ecx, num                     	;message to write
    mov     ebx,1                               ;file descriptor (stdout)
    mov     eax,4                               ;system call number (sys_write)
    int     0x80    	

   
    mov     edx, lenmenufor                   	;message length
    mov     ecx, menufor                    	;message to write
    mov     ebx,1                               ;file descriptor (stdout)
    mov     eax,4                               ;system call number (sys_write)
    int     0x80 	

    mov     edx, len_coffee                   	;message length
    mov     ecx, option_coffee                  ;message to write
    mov     ebx,1                               ;file descriptor (stdout)
    mov     eax,4                               ;system call number (sys_write)
    int     0x80 
	

    mov     edx, len2                  		;message length
    mov     ecx, linebreak                      ;message to write
    mov     ebx,1                               ;file descriptor (stdout)
    mov     eax,4                               ;system call number (sys_write)
    int     0x80 

      
    ;------- 2 --------------
    mov     edx, lenmenuenter                   ;message length
    mov     ecx, menuenter                     ;message to write
    mov     ebx,1                               ;file descriptor (stdout)
    mov     eax,4                               ;system call number (sys_write)
    int     0x80 

   ;mov     eax, 0x00002b
    mov     eax, 50
    mov     [num] , eax 
	
    mov     edx, len_num                        ;message length
    mov     ecx, num                     	;message to write
    mov     ebx,1                               ;file descriptor (stdout)
    mov     eax,4                               ;system call number (sys_write)
    int     0x80    	

    mov     edx, lenmenufor                   ;message length
    mov     ecx, menufor                    	;message to write
    mov     ebx,1                               ;file descriptor (stdout)
    mov     eax,4                               ;system call number (sys_write)
    int     0x80 

    mov     edx, len_tea                   	;message length
    mov     ecx, option_tea                  	;message to write
    mov     ebx,1                               ;file descriptor (stdout)
    mov     eax,4                               ;system call number (sys_write)
    int     0x80 

    mov     edx, len2                  		;message length
    mov     ecx, linebreak                      ;message to write
    mov     ebx,1                               ;file descriptor (stdout)
    mov     eax,4                               ;system call number (sys_write)
    int     0x80 

    ;------- 3 --------------
    mov     edx, lenmenuenter                   ;message length
    mov     ecx, menuenter                     ;message to write
    mov     ebx,1                               ;file descriptor (stdout)
    mov     eax,4                               ;system call number (sys_write)
    int     0x80 

   ;mov     eax, 0x00002b
    mov     eax, 51
    mov     [num] , eax 
	
    mov     edx, len_num                        ;message length
    mov     ecx, num                     	;message to write
    mov     ebx,1                               ;file descriptor (stdout)
    mov     eax,4                               ;system call number (sys_write)
    int     0x80    		

    mov     edx, lenmenufor                   	;message length
    mov     ecx, menufor                    	;message to write
    mov     ebx,1                               ;file descriptor (stdout)
    mov     eax,4                               ;system call number (sys_write)
    int     0x80 

    mov     edx, len_milk                   	;message length
    mov     ecx, option_milk                  	;message to write
    mov     ebx,1                               ;file descriptor (stdout)
    mov     eax,4                               ;system call number (sys_write)
    int     0x80 

    mov     edx, len2                  		;message length
    mov     ecx, linebreak                      ;message to write
    mov     ebx,1                               ;file descriptor (stdout)
    mov     eax,4                               ;system call number (sys_write)
    int     0x80 	
   
    ;-------- input ---------

    mov     edx,len                             ;message length
    mov     ecx,msg                             ;message to write
    mov     ebx,1                               ;file descriptor (stdout)
    mov     eax,4                               ;system call number (sys_write)
    int     0x80                                ;call kernel	

  
    ;read ( stdin)
    mov     eax , 3   				;system call number (sys_read)
    mov     ebx , 0
    mov     ecx, input_variable
    mov     edx, 1 				;how much byte read	
    int     0x80
    
    ; ------- select --------

    mov     eax , [input_variable] 
    	
    cmp     eax, 49
    je      _label_coffee

    cmp     eax, 50
    je      _label_tea

    cmp     eax, 51
    je      _label_milk


    jmp     _label_not_listed	


   ; --------- exit ---------
    
     label_exit_program:
    mov     eax,1                               ;system call number (sys_exit)
    int     0x80                                ;call kernel

section     .data

title db 'Drink menu list' , 0xa
len_title equ $ - title

msg  db  'Enter your option :',0               ;our dear string
len  equ $ - msg                               ;length of our dear string

linebreak db  '',0xa                           ;our dear string
len2 equ $ - linebreak                         ;length of our dear string

menuenter	db 'Enter ' , 0
lenmenuenter equ $ - menuenter

menufor	db ' for ' , 0
lenmenufor	equ $ - menufor

option_coffee db 'Coffee', 0
len_coffee equ $ - option_coffee

option_tea db 'Tea', 0
len_tea equ $ - option_tea

option_milk db 'Milk', 0
len_milk equ $ - option_milk

option_is db 'Your option is ' , 0
len_option_is equ $ - option_is

option_not_exist db 'This drink is not listed',0
len_option_not_exist equ $ - option_not_exist

input_variable dd 0

num db '-' , 0
len_num equ $ - num
