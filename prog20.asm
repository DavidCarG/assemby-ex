;prog20.asm
;Programa que lee 2 numeros desde el teclado y determina cual
;de ellos es mayor con variables
;

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
	vNum1		 DB 00h
	vNum2		 DB 00h
	
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
		mov vNum1, al

		mov ah, 09h
		mov dx, offset cIngresar
		int 21h
		
		mov ah, 01
		int 21h
		mov vNum2, al
		
		cmp vNum1, al
		je eIguales;ja es >
		ja eMayor1
		jmp eMayor2
		
		eMayor1:
			mov ah, 09h
			mov dx, offset cMayor1
			int 21h
			
			mov ah, 02h
			mov dl, vNum1
			int 21h
			jmp eFinProg
			
		eMayor2:
			mov ah,09h
			mov dx, offset cMayor2
			int 21h
			
			mov ah, 02h
			mov dl, vNum2
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