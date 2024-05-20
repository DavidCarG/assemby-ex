;prog21.asm
;Programa que lee 2 numeros desde el teclado y posteriormente
;calcula la suma de los mismos y la muestra en pantalla
;modificando restando 30h al leer y sumando 30h al mostrar

.MODEL SMALL
.STACK 20h
.DATA
	cDescripcion DB 'Programa que lee tres numeros y muestra la suma de ellos'
			     DB ' no funciona apropiadamente cuando la suma excede de 9$'
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
		int 21h
		sub al,30h
		
		add bl,al
		
;----------------------------------------------------
		cmp bl, 09h
		jbe eTercerNumero
		
		sub bl, 0Ah
		mov bh, 01h
;----------------------------------------------------
	
		eTercerNumero:
			mov ah, 09h
			mov dx, offset cIngresar
			int 21h
			
			mov ah, 01
			int 21h
			sub al,30h
			
			add bl,al	
			
			cmp bl, 09h
			jbe eSalida
			
			sub bl, 0Ah
			add bh, 01h
		
		eSalida:
			mov ah, 09h
			mov dx, offset cSuma
			int 21h
			
			mov ah, 02h			;con 02h se muestra el caracter
			mov dl, bh
			add dl,30h
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