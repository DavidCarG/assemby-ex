;prog05.asm
;Programa en el cual lee un caracter del teclado y para finalizar
;muestra el caracter en pantalla
.MODEL SMALL
.STACK 20h
.DATA
	cDescripcion DB 'Programa que lee un caracter y determina si es o no'
				 DB 'un digito',10,13,13,'$'
	cIngresar 	 DB 'Ingrese un caracter $'
	cFinProg	 DB 10,10,13,'<FIN DE PROGRAMA, ENTER PARA SALIR>$'
	cSiesDig     DB 10,10,13, 'Si es un digito$'
	cNoesDig	 DB 10,10,13, 'No es un digito$'
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
		
		cmp al, 30h
		jbe eNoesDig
		
		jne eNoesDig
		
		eSiesDig:
			mov ah,09h
			mov dx, offset cSiesDig
			int 21h
			jmp eFinProg
		
		eNoesDig:
			mov ah,09h
			mov dx, offset cNoesDig
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