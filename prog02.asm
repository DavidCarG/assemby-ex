;Primer programa en ensamblador, el cual muestra una cadena
;de caracteres en pantalla...
.MODEL SMALL
.STACK 20h
.DATA
	cSaludo DB 'Hola chavos!$'
	
.CODE
	eInicio: 
		mov ax, @Data			;mov dx, @Data
		mov ds, ax
		
		mov dx, offset cSaludo
		mov ah, 09h
		int 21h

		mov ah, 08h				
		int 21h		

		mov ax, 4c00h
		int 21h
	END eInicio