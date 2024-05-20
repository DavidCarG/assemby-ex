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
	vUniNum1	 DB 00h
	vDecNum1	 DB 00h
	vUniNum2	 DB 00h
	vDecNum2	 DB 00h
	vUniSuma     DB 00h
	vDecSuma     DB 00h
	vCenSuma 	 DB 00h
	
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
		mov vDecNum1, al

		mov ah, 01				;Leer el primer numero (unidad)
		int 21h
		sub al, 30h
		mov vUniNum1, al
		
;-----------------------------------
;LEER EL SEGUNDO NUMERO

		mov ah, 09h
		mov dx, offset cIngresar
		int 21h
		
		mov ah, 01				;Leer el segundo numero (decena)
		int 21h
		sub al, 30h
		mov vDecNum2, al

		mov ah, 01				;Leer el segundo numero (unidad)
		int 21h
		sub al, 30h
		mov vUniNum2, al
		
		mov al, vDecNum1
		add vDecNum2, al
		
		mov al, vUniNum1
		add vUniNum2, al
		
		mov al, vUniNum2
		mov vUniSuma, al
		
		mov al, vDecNum2
		mov vDecSuma, al
		
		cmp vUniSuma, 09h
		jbe eComparaDecena
		
		sub vUniSuma, 0Ah
		add vDecSuma, 01h
		
		eComparaDecena:
			cmp vDecSuma,09h
			jbe eSalida
			
			sub vDecSuma, 0Ah
			mov vCenSuma, 01h

		eSalida:
			mov ah, 09h
			mov dx, offset cSuma
			int 21h

			mov ah, 02h			;con 02h se muestra el caracter
			mov dl, vCenSuma
			add dl,30h
			int 21h
			
			mov ah, 02h			;con 02h se muestra el caracter
			mov dl, vDecSuma
			add dl,30h
			int 21h
			
			mov ah, 02h			;con 02h se muestra el caracter
			mov dl, vUniSuma
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