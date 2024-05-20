;prog48.asm
;08/05/2024
;Programa en ensamblador el cual hace uso de macros con parametros
;informacion

;-------MACROS SIN PARAMETROS----------
Datos MACRO
	mov ax, @Data			;mov dx, @Data
	mov ds, ax
ENDM

ReadKey MACRO
	mov ah,08h				;ConsoleReadKey();	
	int 21h	
ENDM

ControlDos MACRO
	mov ax,4c00h
	int 21h
ENDM
;--------MACROS CON PARAMETROS----------
Mensaje MACRO msj
	mov ah,09h
	mov dx, offset msj
	int 21h
ENDM

.MODEL SMALL
.STACK 20h
.DATA
	cDescripcion DB 'Programa que hace el uso de macros con parametros',10,13,'$'
	cIngresar 	 DB 10,10,13,'<>:  $',10,13
	cFinProg	 DB 10,10,13,'<FIN DE PROGRAMA, ENTER PARA SALIR>$'

.CODE
	eInicio: 
		Datos
		Mensaje cDescripcion
		Mensaje cFinProg
		ReadKey
		ControlDos
	
	
	END eInicio