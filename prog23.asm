;prog24.asm
;Programa que lee 2 numeros desde el teclado y posteriormente
;calcula la suma de los mismos y la muestra en pantalla
;La intencion es comprender que cada que se lea un numero como dato
;de entrada, se le resten 30h para poderlo manejar como dato numerico
;Y cuando llegue el momento de mostrarlo sumarle 30h para su correcta 
;aparicion en pantalla

.MODEL SMALL
.STACK 20h
.DATA
	cDescripcion DB 'Programa que lee dos numeros y muestra la suma de ellos$'
	cIngresar 	 DB 10,10,13,'  Ingrese un digito:  $',10,13
	cFinProg	 DB 10,10,13,'<FIN DE PROGRAMA, ENTER PARA SALIR>$'
	cSuma		 DB 10,10,13,'La suma de los numeros es $'
	vNum1		 DB 00h
	vNum2		 DB 00h
	
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
		
		mov ah, 01				;Leer un caracter desde el teclado	
		int 21h
		sub al, 30h
		mov bl, al

		mov ah, 09h
		mov dx, offset cIngresar
		int 21h
		
		mov ah, 01
		sub bl, 30h
		int 21h
		
		add bl,al
		
		mov ah, 09h
		mov dx, offset cIngresar
		int 21h
		
		mov ah, 01
		int 21h
		sub al, 30h
		
		add bl,al
		
		mov ah, 09h
		mov dx, offset cSuma
		int 21h
		
		mov ah, 02h			;con 02h se muestra el caracter
		mov dl, bl
		add dl,30h
		int 21h
		
		eFinProg:
			mov ah, 09h
			mov dx, offset cFinProg
			int 21h
			mov ah, 08h				;ConsoleReadKey();	
			int 21h		
			mov ax, 4c00h
			int 21h
	END eInicio