;prog13.asm
;Programa similar al prog12, cambiando el orden de los CMP
.MODEL SMALL
.STACK 20h
.DATA
	cDescripcion DB 'Programa que lee un caracter y determina si es o no'
				 DB 'un digito',10,13,13,'$'
	cIngresar 	 DB 'Ingrese un caracter $'
	cFinProg	 DB 10,10,13,'<FIN DE PROGRAMA, ENTER PARA SALIR>$'
	cSiesMayus   DB 10,10,13, 'Es una letra MAYUSCULA$'
	CSiesMinus   DB 10,10,13, 'Es una letra minuscula$'
	cNoesDig	 DB 10,10,13, 'No es una letra$'
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
		
		cmp al, 'A' ;48 ;0
		jb eNoesDig
		
		cmp al, 'Z' ;57 ;9;
		jbe eSiesMayus
		
		cmp al, 'a' ;jb es <   ;jbe es <= ;je es ==
		jb eNoesDig
		
		cmp al, 'z'
		jbe eSiesMinus
		
		cmp al, 0A4h			;CONSULTAR PORQUE SI PONGO EL VALOR COMO ENCOMILLADO SIMPLE DA ERROR
		je eSiesMinus
		
		cmp al, 0A5h
		je eSiesMayus
		
		jmp eNoesDig
		
		eSiesMayus:
			mov ah,09h
			mov dx,offset cSiesMayus
			int 21h
			jmp eFinProg
			
		eSiesMinus:
			mov ah,09h
			mov dx, offset CSiesMinus
			int 21h
			jmp eFinProg
		
		eNoesDig:
			mov ah,09h
			mov dx, offset cNoesDig
			int 21h
			jmp eFinProg
		
		eFinProg:
			mov ah, 09h
			mov dx, offset cFinProg
			int 21h
			mov ah, 08h				;ConsoleReadKey();	
			int 21h		
			mov ax, 4c00h
			int 21h
	END eInicio