;prog19.asm
;Programa que lee 2 numeros desde el teclado y determina cual
;de ellos es mayor 

.MODEL SMALL
.STACK 20h
.DATA
	cDescripcion DB 'Programa que lee dos numeros y determina cual de ellos'
				 DB 'es mayor',10,13,13,'$'
	cIngresar 	 DB '  Ingrese un digito:  $',10,13
	cFinProg	 DB 10,10,13,'<FIN DE PROGRAMA, ENTER PARA SALIR>$'
	cMayor1      DB 10,10,13, 'El MAYOR de los numeros es el 1ero:  $'
	cMayor2      DB 10,10,13, 'El MAYOR de los numeros es el 2do:  $'
	cIguales     DB 10,10,13, 'SON IGUALES$'
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

		mov ah, 09h
		mov dx, offset cIngresar
		int 21h
		
		mov ah, 01
		int 21h
		mov bh, al
		
		cmp bl, bh
		je eIguales;ja es >
		ja eMayor1
		jmp eMayor2
		
		eMayor1:
			mov ah, 09h
			mov dx, offset cMayor1
			int 21h
			
			mov ah, 02h
			mov dl, bl
			int 21h
			jmp eFinProg
			
		eMayor2:
			mov ah,09h
			mov dx, offset cMayor2
			int 21h
			
			mov ah, 02h
			mov dl, bh
			int 21h
			jmp eFinProg
		
		eIguales:
			mov ah, 09h
			mov dx, offset cIguales
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