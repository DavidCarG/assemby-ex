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
		call Datos
		call Mensaje
		call Mensaje2
		call ReadKey
		call ControlDos

;DECLARACION DE PROCEDIMIENTOS	
	Datos PROC Near
		mov ax, @Data			;mov dx, @Data
		mov ds, ax
		ret
	Datos ENDP
	
	Mensaje PROC Near
		mov ah,09h
		mov dx, offset cDescripcion
		int 21h
		ret
	Mensaje ENDP
	
	Mensaje2 PROC Near
		mov ah,09h
		mov dx, offset cFinProg
		int 21h
		ret
	Mensaje2 ENDP
	
	ReadKey PROC Near
		mov ah,08h				;ConsoleReadKey();	
		int 21h	
		ret		
	ReadKey ENDP
	
	ControlDos PROC Near
		mov ax,4c00h
		int 21h
		ret
	ControlDos ENDP
	
	END eInicio