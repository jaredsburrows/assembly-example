Assembly
========

### Common Functions and Code written in Assembly Language

- Intel(x86-32)
- ATT&T
- MIPS


### Compiling on Mac OSX

Steps:

- nasm -f macho hello.asm
- ld -arch i386 -macosx_version_min 10.7 -e _start -o hello hello.o
- ./hello

One-Liner:

- nasm -f macho hello.s && ld -arch i386 -macosx_version_min 10.6 -no_pie -e main -o hello hello.o && ./hello


### Important: 

For nasm:
- -f - specify format
	- Linux - elf or elf64 
	- Mac OSX - macho

For ld:
- -arch i386 (32 bit assembly)
- -macosx_version_min 10.6 (Mac OSX - complains about default specification)
- -no_pie (Mac OSX - removes ld warning)
- -e main - specify symbol name
- -o outfile

For Shell:
- ./hello - execution


Compilation Issues:

### Mac OSX

"ld: warning: PIE disabled. Absolute addressing (perhaps -mdynamic-no-pic) not allowed in code signed PIE, but used in _start from hello.o. To fix this warning, don't compile with -mdynamic-no-pic or link with -Wl,-no_pie"
- Add the "-no_pie" option to "ld" when linking

"ld: warning: -macosx_version_min not specified, assuming 10.6"
- Add the "-macosx_version_min 10.6" option to "ld" when linking
