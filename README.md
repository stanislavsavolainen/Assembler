# Assembler
Assembler programming ( mostly pc 32 bit x86-architecture i386)


I am using NASM ( Netwide Assembler ) compiler for assembly programming on Linux and Windows.

This repository is for learnign purpose. Maybe someone can also benefit from it.


Ubuntu 32 bit compile command  : 
```sh
 $ nasm -f elf string1.asm
 $ ld -s -o string1 string1.o
 $ ./string1
```
------------------------------------------   

Project1 : Hello World 
  - ubuntu32bit  
  - win32 , where mingw32 as linker

http://asm.sourceforge.net/intro/hello.html

------------------------------------------

Project2 : Loops where conditional label jump
  - ubuntu32bit
  - win32 where mingw32 as linker

 asm label jump:


| Jump command ( asm mnemonic)  | Second Header | programming if - statement |
| ----------------------------- | ------------- |----------------------------|
| jmp                           | jump without condition | 		     |  
| jne  				| jump if not equal  | if( eax != directive_value ) |
| jl             | jump if less |      if( eax < directive_value )  |
| jg | jump if greater |     		if( eax > directive_value )  | 



| Jump command ( asm mnemonic) | programming if - statement  |
| ------ | ------ |
  
  | jmp - jump without condition| no condition |
  | jne - jump if not equal |  		if( eax != directive_value ) |
  | jl - jump if less |        		if( eax < directive_value )  |
  | jg - jump if greater |     		if( eax > directive_value )  |  
  | jge - jump if greater or equal |  	if( eax >= directive_value ) |
  | jle - jump if less or equal |  	if (eax <= direcitve_value ) |  
  | jz - jump if zero |       		if( eax == 0 ) |
  | jnz - jump if not zero |   		if( eax != 0 ) |


 Please note that "cmp" command required before jump command, if jump is with condition

```
  cmp eax, [ directive_value ]
  jl _mylabel
```

 - check ascii table and you can benefit from it in assembly. Check ascii values and directive "mynumbers" in loop_program2.asm

 - about "directive" , google -> assembler directive of 8086
 
 
 - You can find something that DB is used for string and DD for numbers
 ( Nible , Byte, Word, double-word )
 - dd is double word. So we increase stack index by 4 and for db it is only 1
 I put more info in "array" project

 ------------------------------------------

Project3 : Arrays where also label jump 
 


------------------------------------------

MD-file editor and visual fix:
https://dillinger.io/


