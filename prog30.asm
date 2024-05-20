;Programa en ensamblador, el cual lee dos numeros de dos cifras desde 
;teclado para posteriormente calcular la suma de los mismos y mostrarla 
;en pantalla
;prog30.asm
;18/04/2024

.MODEL SMALL
.STACK 20h
.DATA
	cDescrip  DB 'Programa que lee dos numeros de dos cifras y muestra '
			  DB 'la suma de ellos. $'
	cFinProg  DB 10, 10, 13, '<Fin de programa, ENTER para terminar>$'
	
.CODE
	eInicio: 
		mov ax, @Data			;mov dx, @Data
		mov ds, ax
		
		mov ah, 09h
		mov dx, offset cDescrip
		int 21h
		
		mov ax, 0007h
		add al, 05h
		aaa
		
		mov ax, 0205h
		add al, 09h
		aaa
		
		mov ax, 0000h
		add al, 09h
		aaa
		
		mov ax, 0109h
		add al, 0Ah
		aaa
					
		eFinProg:
			mov ah, 09h
			mov dx, offset cFinProg
			int 21h
			
		mov ah, 08h
		int 21h

		mov ax, 4c00h
		int 21h
	END eInicio