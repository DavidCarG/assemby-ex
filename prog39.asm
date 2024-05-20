;prog39.asm
;Programa en ensamblador el cual muestra una tabla de multiplicar del
;numero 2

.MODEL SMALL
.STACK 20h
.DATA
	cDescripcion DB 'Programa que muestra la tabla de multiplicar del num 2',10,13,'$'
	;cIngresar 	 DB 10,10,13,'  Ingrese un digito de 2 cifras:  $',10,13
	cDosPor		 DB 10,13,'2 X $'
	cIgual       DB ' = $'
	cFinProg	 DB 10,10,13,'<FIN DE PROGRAMA, ENTER PARA SALIR>$'


.CODE
	eInicio: 
		mov ax, @Data			;mov dx, @Data
		mov ds, ax
		
		mov ah, 09h
		mov dx, offset cDescripcion
		int 21h
		
		mov bh, 01h
		mov ax, 0002h
		eCiclo:
			mov cx, ax
			
			mov ah, 09h
			mov dx, offset cDosPor
			int 21h
			
			mov ah, 02h			;Muestra la decena de la secuencia
			mov dl, bh
			add dl,30h
			int 21h
			
			mov ah, 09h
			mov dx, offset cIgual
			int 21h
			
			mov ah, 02h			;Muestra la decena de la secuencia
			mov dl, ch
			add dl,30h
			int 21h
			
			mov ah, 02h			;Muestra la unidad de la secuencia
			mov dl, cl
			add dl,30h
			int 21h
			
			add bh, 01h
			mov ax, cx
			add al, 02h
			aaa
			
			cmp bh, 10
			jbe eCiclo
			
		eFinProg:
			mov ah, 09h
			mov dx, offset cFinProg
			int 21h
			mov ah, 08h				;ConsoleReadKey();	
			int 21h		
			mov ax, 4c00h
			int 21h
			
	END eInicio