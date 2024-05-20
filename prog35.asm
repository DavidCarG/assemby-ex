;prog35.asm
;Programa que muestra el funcionamiento de los ciclos

.MODEL SMALL
.STACK 20h
.DATA
	cDescripcion DB 'Programa que muestra el funcionamiento de loop',10,13,'$'
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
		
		mov cx, 0005h
		mov bh, 01h
		eCiclo:
			mov ah, 02h
			mov dl, bh
			add dl,30h
			int 21h
			
			mov ah, 09h
			mov dx, offset cMensaje
			int 21h
			inc bh
			loop eCiclo
			
		eFinProg:
			mov ah, 09h
			mov dx, offset cFinProg
			int 21h
			mov ah, 08h				;ConsoleReadKey();	
			int 21h		
			mov ax, 4c00h
			int 21h
			
	END eInicio