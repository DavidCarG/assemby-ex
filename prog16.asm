;prog14.asm
;Programa para determinar si el caracter ingresado es una vocal, consonante o no es letra
.MODEL SMALL
.STACK 20h
.DATA
	cDescripcion DB 'Programa que lee un caracter y determina si es o no'
				 DB 'una vocal, una consonante o una letra',10,13,13,'$'
	cIngresar 	 DB 'Ingrese un caracter $'
	cFinProg	 DB 10,10,13,'<FIN DE PROGRAMA, ENTER PARA SALIR>$'
	cSiesVocal   DB 10,10,13, 'Es una vocal y es $'
	cSiesConso   DB 10,10,13, 'Es una consonante y es $'
	cNoesDig	 DB 10,10,13, 'No es una letra y es $'
	cSiesDigito  DB 10,10,13, 'Es un digito y es $'
.CODE
	eInicio: 
		mov ax, @Data			;mov dx, @Data
		mov ds, ax
		
		mov ah, 09h
		mov dx, offset cDescripcion
		int 21h

		mov ah, 09h
		mov dx, offset cIngresar
		int 21h
		
		mov ah, 01				;Leer un caracter desde el teclado	
		int 21h
		
		mov bl, al
		
		cmp al, '0'
		je eNoesDig
		
		cmp al, '9'
		jbe eSiesDig
		
		cmp al, 'A'
		je eSiesVocal
		
		cmp al, 'E'
		je eSiesVocal
		
		cmp al, 'I'
		je eSiesVocal
		
		cmp al, 'O'
		je eSiesVocal
		
		cmp al, 'U'
		je eSiesVocal

		cmp al, 'a'
		je eSiesVocal
		
		cmp al, 'e'
		je eSiesVocal
		
		cmp al, 'i'
		je eSiesVocal
		
		cmp al, 'o'
		je eSiesVocal
		
		cmp al, 'u'
		je eSiesVocal
		
		cmp al, 'A' ;48 ;0
		jb eNoesDig
		
		cmp al, 'Z' ;57 ;9;
		jbe eSiesConso
		
		cmp al, 'a' ;jb es <   ;jbe es <= ;je es ==
		jb eNoesDig
		
		cmp al, 'z'
		jbe eSiesConso
		
		cmp al, 0A4h			;CONSULTAR PORQUE SI PONGO EL VALOR COMO ENCOMILLADO SIMPLE DA ERROR
		je eSiesConso
		
		cmp al, 0A5h
		je eSiesConso
		
		jmp eNoesDig
		
		eSiesVocal:
			mov ah,09h
			mov dx, offset cSiesVocal
			int 21h
			jmp eSalida
		
		eSiesConso:
			mov ah, 09h
			mov dx, offset cSiesConso
			int 21h
			jmp eSalida
		
		eNoesDig:
			mov ah,09h
			mov dx, offset cNoesDig
			int 21h
			jmp eSalida
		
		eSiesDig:
			mov ah,09h
			mov dx, offset cSiesDigito
			int 21h
			jmp eSalida
		
		eSalida:
			mov ah, 02h
			mov dl, bl
			int 21h
			
		eFinProg:
			mov ah, 09h
			mov dx, offset cFinProg
			int 21h
			mov ah, 08h				;ConsoleReadKey();	
			int 21h		
			mov ax, 4c00h
			int 21h
	END eInicio