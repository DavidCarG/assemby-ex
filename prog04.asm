;Primer programa en ensamblador, el cual muestra una caden de caracteres en pantalla...
;Una cadena por cada renglo
.MODEL SMALL
.STACK 20h
.DATA
	cSaludo 	DB 'Hola chavos!',10,13,'$'
	cDespedida 	DB 'Adios chavos!',0Ah,0Dh,'$'
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