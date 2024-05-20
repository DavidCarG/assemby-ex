;Programa en ensamblador, el cual lee tres numeros desde teclado para 
;posteriormente calcular la suma de los mismos y mostrarla en pantalla
;prog32.asm
;22/04/2024

.MODEL SMALL
.STACK 20h
.DATA
	cDescrip  DB 'Programa que lee dos numeros y muestra la suma de ellos$'
			  DB 'No funciona apropiadamente cuando la suma excede de 9$'
	cIngresar DB 10, 10, 13, 'Ingrese un digito: $'
	cFinProg  DB 10, 10, 13, '<Fin de programa, ENTER para terminar>$'
	cSuma	  DB 10, 10, 13, 'La suma de los numeros es $'
	
.CODE
	eInicio: 
		mov ax, @Data			;mov dx, @Data
		mov ds, ax
		
		mov ah, 09h
		mov dx, offset cDescrip
		int 21h
		
		mov ah, 09h
		mov dx, offset cIngresar
		int 21h

		mov ah, 01			
		int 21h	
		sub al, 30h
		mov bl, al
		
		mov ah, 09h
		mov dx, offset cIngresar
		int 21h

		mov ah, 01			
		int 21h	
		sub al, 30h
		
		mov ah, 00h
		add al, bl
		aaa
		mov bx, ax
		
;-------TERCER NUMERO-------------
		mov ah, 09h
		mov dx, offset cIngresar
		int 21h

		mov ah, 01			
		int 21h	
		sub al, 30h
		
		mov ah, bh
		add al, bl
		aaa
		
		mov bx, ax
		eSalida:		
			mov ah, 09h
			mov dx, offset cSuma
			int 21h
		
			mov ah, 02h			;se muestra la decena de la suma
			mov dl, bh
			add dl, 30h
			int 21h
		
			mov ah, 02h			;se muestra la unidad de la suma
			mov dl, bl
			add dl, 30h
			int 21h
					
		eFinProg:
			mov ah, 09h
			mov dx, offset cFinProg
			int 21h
			
		mov ah, 08h
		int 21h

		mov ax, 4c00h
		int 21h
	END eInicio