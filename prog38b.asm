;prog38.asm
;Programa en ensamblador el cual muestra una secuencia de numeros del 1 al 98
;el 10 lo muestra como un dos puntos ':' 
.MODEL SMALL
.STACK 20h
.DATA
	cDescripcion DB 'Programa que muestra los numeros del 1 al 98',10,13,'$'
	cIngresar 	 DB 10,10,13,'  Ingrese un digito de 2 cifras:  $',10,13
	cFinProg	 DB 10,10,13,'<FIN DE PROGRAMA, ENTER PARA SALIR>$'
	cSuma		 DB 10,10,13,'La suma de los numeros es $'
	cMensaje     DB ' Mensaje',10,13,'$'

.CODE
	eInicio: 
		mov ax, @Data			;mov dx, @Data
		mov ds, ax
		
		mov ah, 09h
		mov dx, offset cDescripcion
		int 21h
		
		mov bh, 02h
		mov ax, 0002h
		eCiclo:
			mov cx, ax
			
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
			
			add bh, 02h
			mov ax, cx
			add al, 02h
			aaa
			
			cmp bh, 98
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