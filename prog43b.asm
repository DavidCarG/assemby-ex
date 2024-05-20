;prog39.asm
;Programa en ensamblador el cual muestra una tabla de multiplicar del
;numero ingresado por el usuario

.MODEL SMALL
.STACK 20h
.DATA
	cDescripcion DB 'Programa que muestra la tabla de multiplicar del num 7',10,13,'$'
	cIngresar 	 DB 10,10,13,'<Ingrese que tabla quiere>:  $',10,13
	cPor	     DB ' X $'
	cIgual       DB ' = $'
	cFinProg	 DB 10,10,13,'<FIN DE PROGRAMA, ENTER PARA SALIR>$'
	cLimite		 DB 10,13,'INGRESE EL LIMITE DE LA TABLA$'
	vNum		 DB 00h
	vLim		 DB 00h
	vDecLim		 DB 00h
	vUnLim		 DB 00h

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
		
		mov ah, 02h
		mov dx, 0Ah
		int 21h
		
		mov ah, 01h
		int 21h
		sub al, 30h
		mov vNum, al
		
		;---------LEER EL LIMITE
		mov ah, 09h
		mov dx, offset cLimite
		int 21h
		
		mov ah, 01h
		int 21h
		sub al, 30h
		mov vDecLim, al
		
		mov ah, 01h
		int 21h
		sub al, 30h
		mov vUnLim, al
		
		mov ah, 02h
		mov dx, 0Ah
		int 21h
		
		
		mov bh, 01h
		mov ah, 00h
		mov al, vNum
		
		eCiclo:
			mov cx, ax

			mov ah, 02h
			mov dl, vNum
			add dl, 30h
			int 21h
			
			mov ah, 09h
			mov dx, offset cPor
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
			
			mov ah, 02h
			mov dl, 0Ah
			int 21h
			
			add bh, 01h
			mov ax, cx
			add al, vNum
			aaa
			
			cmp bh, vUnLim
			jbe eCiclo
			
			mov bh, vDecLim
			cmp bh, 00h
			je eFinProg
			
			sub bh, 01h
			mov vDecLim, bh
			mov vUnLim, 0Ah
			mov bh, 01h
		    jmp eCiclo
			
		eFinProg:
			mov ah, 09h
			mov dx, offset cFinProg
			int 21h
			mov ah, 08h				;ConsoleReadKey();	
			int 21h		
			mov ax, 4c00h
			int 21h
			
	END eInicio