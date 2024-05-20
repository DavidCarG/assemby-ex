;prog29.asm
;Programa que lee 2 numeros de 2 cifras desde el teclado y posteriormente
;calcula la suma de los mismos y la muestra en pantalla
;A diferencia del anterior se van almacenar los datos en variables

.MODEL SMALL
.STACK 20h
.DATA
	cDescripcion DB 'Programa que lee tres numeros y muestra la suma de ellos'
			     DB ' no funciona apropiadamente cuando la suma excede de 9$'
	cIngresar 	 DB 10,10,13,'  Ingrese un digito de 2 cifras:  $',10,13
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
		
		mov ah, 01				;Leer el primer numero (decena)
		int 21h
		sub al, 30h
		mov bh, al

		mov ah, 01				;Leer el primer numero (unidad)
		int 21h
		sub al, 30h
		mov bl, al
		
;-----------------------------------
;LEER EL SEGUNDO NUMERO

		mov ah, 09h
		mov dx, offset cIngresar
		int 21h
		
		mov ah, 01				;Leer el segundo numero (decena)
		int 21h
		sub al, 30h
		mov ch, al

		mov ah, 01				;Leer el segundo numero (unidad)
		int 21h
		sub al, 30h
		mov cl, al
		
		add bh, ch
		add bl, cl
;----------------------------------
		mov ah, 00h ;Se hace ah = 0 para que las centenas de la suma no tengan basura
		mov al, ch
		add al, cl
		aaa
		
		
		
		cmp bl, 09h
		jbe eComparaDecena
		sub bl, 0Ah
		add bh, 01h
		
		eComparaDecena:
			cmp bh,09h
			jbe eSalida
			
			sub bh, 0Ah
			mov ch, 01h

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