;prog34.asm
;Programa que muestra el funcionamiento de los ciclos

.MODEL SMALL
.STACK 20h
.DATA
	cDescripcion DB 'Programa que muestra el funcionamiento de loop$'
	cIngresar 	 DB 10,10,13,'  Ingrese un digito de 2 cifras:  $',10,13
	cFinProg	 DB 10,10,13,'<FIN DE PROGRAMA, ENTER PARA SALIR>$'
	cSuma		 DB 10,10,13,'La suma de los numeros es $'
	cMensaje     DB 10, 13,'Mensaje$'
	vNum1		 DB 00h
	vNum2		 DB 00h
	vUniSuma     DB 00h
	vDecSuma     DB 00h
	vCenSuma     DB 00h
.CODE
	eInicio: 
		mov ax, @Data			;mov dx, @Data
		mov ds, ax
		
		
		mov ah, 09h
		mov dx, offset cDescripcion
		int 21h
		
		
		mov cx, 0005h
		
		eCiclo:
			mov ah, 09h
			mov dx, offset cMensaje
			int 21h
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