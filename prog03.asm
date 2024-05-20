;Primer programa en ensamblador, el cual muestra una cadena
;de caracteres en pantalla...
;Debemos utilizar un registro auxiliar para guardar datos si o si
.MODEL SMALL
.STACK 20h
.DATA
	cSaludo 	DB 'Hola chavos!$'
	cDespedida 	DB 'Adios chavos!$'
.CODE
	eInicio: 
		mov ax, @Data			;mov dx, @Data
		mov ds, ax
		
		mov dx, offset cSaludo
		mov ah, 09h
		int 21h

		mov ah, 09h
		mov dx, offset cDespedida
		int 21h
		
		mov ah, 08h				;ConsoleReadKey();	
		int 21h		

		mov ax, 4c00h
		int 21h
	END eInicio