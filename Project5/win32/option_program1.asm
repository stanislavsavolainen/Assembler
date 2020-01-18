global _main
extern _printf
extern _scanf


section .bss
section .text


;----- option coffee-----------
_label_coffee:

	push option_is
    call _printf
    add esp, 4

    push option_coffee
    call _printf
    add esp, 4

    push linebreak
    call _printf
    add esp, 4

jmp label_exit_program

;----- option tea-------------
_label_tea:

	push option_is
    call _printf
    add esp, 4

    push option_tea
    call _printf
    add esp, 4

    push linebreak
    call _printf
    add esp, 4

jmp label_exit_program

;----- option milk------------
_label_milk:

	push option_is
    call _printf
    add esp, 4

    push option_milk
    call _printf
    add esp, 4

    push linebreak
    call _printf
    add esp, 4

jmp label_exit_program


;----- option not in list -----
_label_not_listed:

	push option_not_exist
    call _printf
    add esp, 4

    push linebreak
    call _printf
    add esp, 4

jmp label_exit_program


_main:

	push ebp
	mov ebp, esp


  ;--------- title --------



   push option_title
   call _printf
   add esp, 4

   push linebreak
   call _printf
   add esp, 4

   ;----------- 1 ----------

   push menuenter
   call _printf
   add esp, 4

   mov eax, 49
   mov [num] , eax  ; num - directive must be DD type because register is 32 bit ( DB type not work )
   push num
   call _printf
   add esp, 4

   push menufor
   call _printf
   add esp, 4

   push option_coffee
   call _printf
   add esp, 4

   push linebreak
   call _printf
   add esp, 4

  ;----------- 2 ---------

   push menuenter
   call _printf
   add esp, 4

   mov eax, 50
   mov [num] , eax   ; num - directive must be DD type because register is 32 bit ( DB type not work )
   push num
   call _printf
   add esp, 4

   push menufor
   call _printf
   add esp, 4

   push option_tea
   call _printf
   add esp, 4

   push linebreak
   call _printf
   add esp, 4

  ;----------- 3 ----------

   push menuenter
   call _printf
   add esp, 4

   mov eax, 51
   mov [num] , eax   ; num - directive must be DD type because register is 32 bit ( DB type not work )
   push num
   call _printf
   add esp, 4

   push menufor
   call _printf
   add esp, 4

   push option_milk
   call _printf
   add esp, 4

   push linebreak
   call _printf
   add esp, 4

   ;-------- input ---------

   push msg
   call _printf
   add esp, 4

   push input_variable
   push formatin ; arguments are right to left (first parameter)
   call _scanf
   add esp, 8 ; remove parameters


  ; push integer1
  ; call _printf
  ; add esp, 4


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

   mov esp,ebp
   pop ebp

ret



section .data

	option_title db "Drink menu list", 0
	msg db  "Enter your option :",0
	;linebreak     db  '',0xa
    menuenter	db "Enter " , 0
	menufor	db " for " , 0
	option_coffee db "Coffee", 0
	option_tea db "Tea", 0
	option_milk db "Milk", 0
	option_is db "Your option is " , 0
	option_not_exist db "That kind of drink is not in list",0
	input_variable dd 0
	num dd "" , 0
	formatin db "%s", 0
	;integer1: times 4 db 0
	integer1 db "123456" , 0
	formatout db "%s", 0 ; newline, nul terminator
	msg1 db "Enter value :",0
	linebreak db " ", 0xA , 0xD
	enterkey db "",0xD , 0xD






