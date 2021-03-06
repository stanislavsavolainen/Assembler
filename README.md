# Assembler
Assembler programming ( mostly pc 32 bit x86-architecture i386)


I am using NASM ( Netwide Assembler ) compiler for assembly programming on Linux and Windows.

This repository is for learnign purpose. Maybe someone can also benefit from it.


Linux online compiler in web : 
https://www.jdoodle.com/compile-assembler-nasm-online/
don't need Linux and install nasm to run code in physical hardware, expect some exception or specific code.
Project1 to Project4 ubuntu32bit code sould work clear on web nasm-emulator.


Ubuntu 32 bit compile command  : 
```sh
 $ nasm -f elf string1.asm
 $ ld -s -o string1 string1.o
 $ ./string1
```

Window 32 bit compile command : 
```sh
 $ nasm -f elf string1.asm
 $ gcc  c:/sourcedirectoryname/string1.o -o c:/wherecompilebinary/string1bin
 $ string1bin
```

- wich means that gcc build string1bin.exe file from nasm code. I am using old dev-c++ compiler because it already installed 
in my enviroment from previous anci c and c++ project. You can get gcc or mingw32 compiler for windows (32 bit) for gcc command.
As you can see for windows using "ansci c" - function call instead of system interupt for displaying text.

- You can see platform difference between Linux and Windows, but there is also same things. If you learn concept how to do assembly programming 
in general, then you can better benefit your knownledges for different device assembly programming.

- conditional label jump , general arithmetic instruction and push/pop data from register work same way in different platform


MASM = Macro Assembler ( Windows only)

I ported projects 4 , 5 and 6 for masm32 - compatible ( works on win7 and masm32 6.14.8444)

Masm32 compile command :
```sh
 $ ml.exe /c /coff function1.asm
 $ link.exe /SUBSYSTEM:CONSOLE function1.obj
 $ function1.exe
```
  
Where ml.exe make obj - file from source code and link make exe - file from obj - file.
Your should put masm source code to masm32/bin folder. 

------------------------------------------   

Project1 : Hello World 
  - ubuntu32bit  
  - win32 , where mingw32 as linker

http://asm.sourceforge.net/intro/hello.html

please note that windows version probaply need carrier return ascii symbol as you can see in screenshot, if
/n = 0xA  not return then do  /n /r  0xA, 0xD

------------------------------------------

Project2 : Loops where conditional label jump
  - ubuntu32bit
  - win32 where mingw32 as linker

 asm label jump:


| Jump command ( asm mnemonic)  | description | programming if - statement |
| ----------------------------- | ------------- |----------------------------|
| jmp                           | jump without condition | 		     | 
| je  				| jump if  equal  | if( eax == directive_value ) | 
| jne  				| jump if not equal  | if( eax != directive_value ) |
| jl             | jump if less |      if( eax < directive_value )  |
| jg | jump if greater |     		if( eax > directive_value )  | 
| jge | jump if greater or equal |  	if( eax >= directive_value ) |
| jle | jump if less or equal |  	if (eax <= direcitve_value ) | 
| jz | jump if zero |       		if( eax == 0 ) |
 | jnz | jump if not zero |   		if( eax != 0 ) |



 Please note that "cmp" command required before jump command, if jump is with condition

```
  cmp eax, [ directive_value ]
  jl _mylabel
```

 - check ascii table and you can benefit from it in assembly. Check ascii values and directive "mynumbers" in loop_program2.asm
Project2/ubuntu32/loop_program2.asm
[a link](Project2/ubuntu32bit/loop_program2.asm)


 - about "directive" , google -> assembler directive of 8086
 
 
 - You can find something that DB is used for string and DD for numbers
 ( Nible , Byte, Word, double-word )
 - dd is double word. So we increase stack index by 4 and for db it is only 1
 I put more info in "array" project

 ------------------------------------------

Project3 : Arrays where also label jump 

  
```str1 db 'hello from stanislav', 0xa``` can be compared to 
``` char * str1 = "hello from stanislav \n"; ``` in ANCI C where 0xa means \n if check ascii value



  - you need to learn esi - register and make it point to directive wich you want to handle

   like this ``` mov esi, str1  ```

   https://stackoverflow.com/questions/1856320/purpose-of-esi-edi-registers

  - then when you want next array element just increase esi register value by 1 for DB or by 4 for DD type directive

   like this ```add esi, 1```  wich means esi += 1  or ``` add esi, 4 ``` wich means esi += 4  

  - win32 don't use esi- register. I did different solution for it. 

------------------------------------------

Project 4 : input ( win32 -> ansic c "scanf" , linux using stdin system interupt, read line assembly)


```
#include <stdio.h>

int main(){

 int count = 0;

 printf("Enter value :");
 scanf("%d" , &count);

 for( int i = 0; i < count ; i++){
    printf("Hello world !");
    printf("\n");
 }

 return 0;
}

```

https://www.tutorialspoint.com/assembly_programming/assembly_system_calls.htm


I did this impelentation in assembly ( win32 and linux) . ANSI C - code example is showing what we want to do in Assembly. 

check windows Project4/win32/input3.asm to compare it with ANCI C - code above
[a link](Project4/win32/input3.asm)

Linux version of input command can be found at:
Project4/ubuntu32/input3.asm
[a link](Project4/ubuntu32bit/input3.asm)

Windows masm32 code :
Project4/masm32/input3.asm
[a link](Project4/masm32/input3.asm)


------------------------------------------

Project 5 : nasm options , like ANCI C switch-case structure

See example code on ANCI C :


```
#include <stdio.h>

int main(){

	printf("Drink menu list \n");
	printf("Enter 1 for Coffee \n");
	printf("Enter 2 for Tea \n");
	printf("Enter 3 for Milk \n");
	

	int i = 0;
	printf("Enter your option : ");
	scanf("%d" , &i);
	
	switch(i) {
		case 1: 
			printf("Your option is Coffee \n");
		break;
	
		case 2:
			printf("Your option is Tea \n");
		break;
	
		case 3:
			printf("Your option is Milk \n");
		break;
		
		default:
		      printf("This drink is not listed \n");	
		break;
	}	

return 0;
}


```
Compare it to Linux nasm code :

Project5/ubuntu32bit/option_program1.asm
[a link](Project5/ubuntu32bit/option_program1.asm)

Also compare it to Windows nasm code :
Project5/win32/option_program1.asm
[a link](Project5/win32/option_program1.asm)

Windows masm32 code :
Project5/masm32/option_program1.asm
[a link](Project5/masm32/option_program1.asm)


------------------------------------------

Project 6 : Nasm function call 

```
#include <stdio.h>

void func1() {
   printf("text inside function \n");
}

void func2(int param1, int param2,  int param3 ) {
   printf("%d \n" , param1);
   printf("%d \n" , param2);
   printf("%d \n" , param3);
}

int main(){

 char * after = "text after function\n"; 

 func1();

 printf("%s" , after);

 func1(); 

 func2( 3 , 2 , 1 );

 printf("\n");

 printf("%s" , after);

 
return 0;
}


``` 

Compare it to Linux nasm code :

Project6/ubuntu32bit/function1.asm
[a link](Project6/ubuntu32bit/function1.asm)

Also Windows nasm code :

Project6/win32/function1.asm
[a link](Project6/win32/function1.asm)

Windows Masm32 code :
Project6/masm32/function1.asm
[a link](Project6/masm32/function1.asm)


ESP (stack pointer) - register : 
http://www.c-jump.com/CIS77/ASM/Stack/S77_0040_esp_register.htm


------------------------------------------

MD-file editor and visual fix:
https://dillinger.io/

https://pandao.github.io/editor.md/en.html

README.md relative link:
https://github.blog/2013-01-31-relative-links-in-markup-files/


