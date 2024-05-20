;prog48.asm
;08/05/2024
;Programa en ensamblador el cual hace uso de procedimientos
;informacion

Datos MACRO
	mov ax, @Data			;mov dx, @Data
	mov ds, ax
ENDM

Mensaje MACRO
	mov ah,09h
	int 21h
ENDM

.MODEL SMALL
.STACK 20h
.DATA
	cDescripcion DB 'Programa que hace el uso de macros y procedimientos',10,13,'$'
	cIngresar 	 DB 10,10,13,'<>:  $',10,13
	cFinProg	 DB 10,10,13,'<FIN DE PROGRAMA, ENTER PARA SALIR>$'

.CODE
	eInicio: 
		Datos
		mov dx, offset cDescripcion
		Mensaje
		call Mensaje2
		call ReadKey
		call ControlDos
	
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