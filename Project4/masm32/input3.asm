.386
.model flat, stdcall
option casemap:none

include \masm32\include\kernel32.inc
includelib \masm32\lib\kernel32.lib

include \masm32\include\masm32.inc
includelib \masm32\lib\masm32.lib

.data
    dataMessage db "Hello world ! ", 0   ; define 12 bytes, fill it with 'Hello world.', 0 -> terminator
    linebreak db " ", 13, 10, 0
    userinput dd ?
    message db "Enter value : " , 0
       
.code

myloop:

    push eax ; save eax - register value for add-operation
	
    push offset dataMessage
    call StdOut
	
    push offset linebreak
    call StdOut

    pop eax ; restore eax - register for add-operaion

    add eax , 1

jmp next_element


start:
      
    push offset message
    call StdOut
	      
    push 1 ; read only 1 byte from StdIn, this means values 0 to 9
    push offset userinput
    call StdIn	 	
	  
    ; do same operation that I did in Project4/ubuntu32bit/input3.asm
    ; because numbers input is in ascii format substract 48 value to means for example if number 2 is 50 in ascii sub 48 to make it 2 is 2 value
    mov eax , [userinput]
    sub eax , 48
    mov [userinput], eax 
	  
    mov eax , 0
	 
    next_element:	   
    cmp eax, [userinput]   ; if eax < userinput, then jump / continue loop next element
    jl myloop	   
    	   
exit:
    push 0                                        ; exit code for the process and all threads
    call ExitProcess                              ; invoke ExitProcess API
end start