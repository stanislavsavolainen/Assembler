# Assembler
Assembler programming ( mostly pc 32 bit x86-architecture i386)


I am using NASM ( Netwide Assembler ) compiler for assembly programming on Linux and Windows.

This repository is for learnign purpose. Maybe someone can also benefit from it.


Ubuntu 32 bit compile command  : 
```
 <br /> nasm -f elf string1.asm
 <br /> ld -s -o string1 string1.o
 <br /> ./string1
```
------------------------------------------   

Project1 : Hello World 
 -> "ubuntu32bit"  
 -> "win32" where mingw32 as linker

http://asm.sourceforge.net/intro/hello.html

------------------------------------------

Project2 : Loops where conditional label jump
 -> ubuntu32bit
 -> "win32" where mingw32 as linker

 asm label jump:

``` 
 jmp - jump without condition
```

 
```
 <br /> jne - jump if not equal  if( eax != directive_value )
 <br /> jl - jump if less        if( eax < directive_value )
 <br /> jg - jump if greater     if( eax > directive_value )   
 <br /> jge - jump if greater or equal  if( eax >= directive_value )
 <br /> jle - jump if less or equal   if (eax <= direcitve_value  )
 <br /> jz - jump if zero        if( eax == 0 )
 <br /> jnz - jump if not zero   if( eax != 0 )
```

 Please note that "cmp" command required before jump command if jump is with condition

```
 <br /> cmp eax, [ directive_value ]
 <br /> jl _mylabel
```

 -> check also ascii table and you can benefit it also as I did in loop_program2.asm

 -> about "directive" , google -> assembler directive of 8086
 
In this project directives is under 
```section     .data```
at then end of source code
 
 uou can find something that DB is used for string and DD for numbers
 ( Nible , Byte, Word, double-word )
 -> dd is double word so we increase stack index by 4 and for db it is only 1
 I put more info in "array" project
 ------------------------------------------

Project3 : Arrays where also label jump 
 



