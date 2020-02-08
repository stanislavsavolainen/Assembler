.386
.model flat, stdcall
option casemap:none

include \masm32\include\kernel32.inc
includelib \masm32\lib\kernel32.lib

include \masm32\include\masm32.inc
includelib \masm32\lib\masm32.lib


.data
    linebreak db " ", 13, 10, 0
    userinput dd ?
; ------------- copy from Project4/win32/option1.asm ( I did it previosly )	
    option_title db "Drink menu list", 0
    msg db  "Enter your option :",0
    menuenter db "Enter " , 0
    menufor db " for " , 0
    option_coffee db "Coffee", 0
    option_tea db "Tea", 0
    option_milk db "Milk", 0
    option_is db "Your option is " , 0
    option_not_exist db "That kind of drink is not in list",0
    input_variable dd 0
    num dd " " , 0
    formatin db "%s", 0   

.code

;----- option coffee-----------
_label_coffee:

    push offset option_is
    call StdOut
    
    push offset option_coffee
    call StdOut
   
    push offset linebreak
    call StdOut
    
jmp exit

;----- option tea-------------
_label_tea:

    push offset option_is
    call StdOut
    
    push offset option_tea
    call StdOut
   
    push offset linebreak
    call StdOut
    

jmp exit

;----- option milk------------
_label_milk:

    push offset option_is
    call StdOut
   
    push offset option_milk
    call StdOut
    
    push offset linebreak
    call StdOut
    
jmp exit


;----- option not in list -----
_label_not_listed:

    push offset option_not_exist
    call StdOut

    push offset linebreak
    call StdOut

jmp exit


start:
     
   ;--------- title --------

   push offset option_title
   call StdOut

   push offset linebreak
   call StdOut

   ;----------- 1 ----------

   push offset menuenter
   call StdOut
   
   mov eax, 49
   mov [num] , eax  ; num - directive must be DD type because register is 32 bit ( DB type not work )
   push offset num
   call StdOut
   

   push offset menufor
   call StdOut
   
   push offset option_coffee
   call StdOut
   

   push offset linebreak
   call StdOut
  
  ;----------- 2 ---------

   push offset menuenter
   call StdOut
   
   mov eax, 50
   mov [num] , eax   ; num - directive must be DD type because register is 32 bit ( DB type not work )
   push offset num
   call StdOut
   
   push offset menufor
   call StdOut
   
   push offset option_tea
   call StdOut
  
   push offset linebreak
   call StdOut
   
  ;----------- 3 ----------

   push offset menuenter
   call StdOut
   
   mov eax, 51
   mov [num] , eax   ; num - directive must be DD type because register is 32 bit ( DB type not work )
   push offset num
   call StdOut
   
   push offset menufor
   call StdOut
   
   push offset option_milk
   call StdOut
   
   push offset linebreak
   call StdOut
    
   ;-------- input --------- 
   push offset msg
   call StdOut
	    
   push 1
   push offset userinput
   call StdIn	 	
	  
  ;------- select --------

    mov     eax , [userinput]

    cmp     eax, 49
    je      _label_coffee

    cmp     eax, 50
    je      _label_tea

    cmp     eax, 51
    je      _label_milk


    jmp     _label_not_listed


   ; --------- exit ---------
   	   
exit:
       push 0                                        ; exit code for the process and all threads
       call ExitProcess                              ; invoke ExitProcess API
end start