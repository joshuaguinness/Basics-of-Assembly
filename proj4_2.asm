%include "asm_io.inc"

segment .data
str: db "hello world hellbsd",0 
numberChars: dd 0
strLength: dd 0
numberBlanks: dd 0
warningOne: db "There are too many characters",0
outputOne: db "The length of the string is: ",0
outputTwo: db "The number of blanks are: ",0

segment .bss

segment .text
	global asm_main
asm_main:
	enter 0,0
	pusha

	mov eax, str
	mov ebx, dword [numberChars]
	mov ecx, dword [strLength]
	mov edx, dword [numberBlanks]

	while:
		cmp ebx, dword 20
		je toManyCharacters

		cmp [eax], byte 0
		je finishedString
	
		cmp [eax], byte ' '
		je addBlank		

		jmp addCharacter

	while2:
		inc ecx
		inc eax
		jmp while

	addBlank:
		inc edx
		jmp while2

	addCharacter:
		inc ebx
		jmp while2

	toManyCharacters:
		mov eax, warningOne
		call print_string
		call print_nl
		jmp end

	finishedString:
		mov eax, str
		call print_string
		call print_nl

		mov eax, outputOne
		call print_string
		mov eax, ecx
		call print_int
		call print_nl

		mov eax, outputTwo
		call print_string
		mov eax, edx
		call print_int
		call print_nl
		jmp new

	new:
		mov ebx, str
		jmp new2

	new2:
		cmp ecx, dword 0
		je end

		dec ecx

		mov al, byte [ebx+ecx]
		call print_char
		
		jmp new2		

	end:
		call print_nl

	popa
	mov eax, 0
	leave
	ret
