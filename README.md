# Basics-of-Assembly

A NASM x86 assembly program which uses loops, arrays, and counting to practise the basics of assembly.

In the .data section there is a byte array called string defined. The program traverses the string counting the number of characters in the string and also counting the number of blanks (spaces).

If the number of characters reaches 20 and the string has not been entirely traversed, the program terminates with an error message. 

If the traversal was successfully completed, the string is displayed along with messages about the length of the string and the number of blanks.

To run: Download all files and via command line type: "make"

To clean: "make clean"
