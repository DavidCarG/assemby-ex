;prog44.asm
;08/05/2024
;Programa en ensamblador el cual hace uso de procedimientos
;informacion

.MODEL SMALL
.STACK 20h
.DATA
	cDescripcion DB 'Programa que hace el uso de procedimientos',10,13,'$'
	cIngresar 	 DB 10,10,13,'<Ingrese que tabla quiere>:  $',10,13
	cFinProg	 DB 10,10,13,'<FIN DE PROGRAMA, ENTER PARA SALIR>$'

.CODE
	eInicio: 
		mov ax, @Data			;mov dx, @Data
		mov ds, ax
		
		call Mensaje
		
		;mov ax, 1234h
		;mov bx, 5678h
		;mov cx, 1357h
		;mov dx, 2468h
		
		;push ax
		;push bx
		;push cx
		;push dx
		
		eFinProg:
			mov ah, 09h
			mov dx, offset cFinProg
			int 21h
			mov ah, 08h				;ConsoleReadKey();	
			int 21h		
			mov ax, 4c00h
			int 21h
		
;DECLARACION DE PROCEDIMIENTOS	
	Mensaje PROC Near
		mov ah,09h
		mov dx, offset cDescripcion
		int 21h
		ret
	Mensaje ENDP
	
	END eInicio