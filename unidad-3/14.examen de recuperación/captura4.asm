; RAMIREZ SANCHEZ JESSICA
; LENGUAJES DE INTERFAZ 12:15
; EXAMEN DE RECUPERACION 28 Mayo 2019

.Model small
.Stack 64
.Data


;---------------- Letreros, variables -----------------------------------------

msj0 db "Introduce tu nombre de usuario: ","$"

msj1 db "Introduce tu password: ","$"
incorrecto db "Password incorrecto","$"
usrIncorrecto db "Usuario no registrado","$"

soyAlumno db "BIENVENIDO ALUMNO",0dh,0ah,0dh,0ah
	  db "> Calificaciones",0dh,0ah
	  db "ALGEBRA 80",0dh,0ah
	  db "TUTORIA AC",0dh,0ah
	  db "ADMINISTRACION 90",0dh,0ah
	  db "$"
soyMaestro db "BIENVENIDO MAESTRO",0dh,0ah,0dh,0ah
	   db "1.- Registrar calificaciones",0dh,0ah
	   db "$"
soyAdmin db "BIENVENIDO ADMINISTRADOR",0dh,0ah,0dh,0ah
	 db "1.- Dar de alta maestro",0dh,0ah
	 db "2.- Dar de alta alumno",0dh,0ah
	 db "3.- Asignar a usuarios registrados"
	 db "$"

intMateria db "Introduce la opcion: ","$"
materia1 db 0dh,0ah,"ALGEBRA: ","$"
calf db "00","$"
opc db "0","$"

userAlumno db "jssca"
userMaestro db "laura"
userAdmin db "admin"
captura0 db "00000","$"

passAlumno db "123"
passMaestro db "246"
passAdmin db "111"
captura1 db "000","$"

;------------------------------------------------------------------------------

;------- Inicializar còdigo
.Code

inicio proc far
		mov ax,@data		;alineacion segmento datos
		mov es,ax
		mov ds,ax

;--------------------- PASSWORD
cmppass:	lea dx,msj1
		call imprimir
		call teclado

cmpAlumno:	cld
		mov cl,3
		lea si,passAlumno
		lea di,captura1
		rep cmpsb
		cmp cx,0
		je menuAlumno
		jmp cmpMaestro		;no es password de alumno

cmpMaestro:	cld
		mov cl,3
		lea si,passMaestro
		lea di,captura1
		rep cmpsb
		cmp cx,0
		je menuMaestro		;no es pasword de maestro
		jmp cmpAdmin

cmpAdmin:	cld
		mov cl,3
		lea si,passAdmin
		lea di,captura1
		rep cmpsb
		cmp cx,0
		je menuAdmin
		lea dx,incorrecto	;password incorrecto
		call imprimir
		jmp fin

menuAlumno:	call saltoLinea
		lea dx,soyAlumno
		call llamarImprimir
		jmp fin

menuMaestro:	call saltoLinea
		lea dx,soyMaestro
		call llamarImprimir
		lea dx,intMateria
		call imprimir
		call tecladoOpc
		cld
		cmp opc,31
		lea dx,materia1
		call imprimir
		call tecladoOpc
		jmp fin

menuAdmin:	call saltoLinea
		lea dx,soyAdmin
		call llamarImprimir
		jmp fin


fin:		mov ax,4c00h		;fin de programa
		int 21h

inicio endp

;------- Inicio de procedimientos
imprimir proc near
		mov ah,09h
		int 21h
		ret
imprimir endp

imprimir2 proc near
		mov ah,02h
		int 21h
		ret
imprimir2 endp

teclado0 proc near
		mov cl,5		;captura datos
		lea si,captura0
salto0:		mov ah,0
		int 16h
		mov [si],al		;GUARDA
		mov ah,02
		mov dl,al
		int 21h
		inc si
		loop salto0
		ret
teclado0 endp

teclado proc near
		mov cl,3		;captura datos
		lea si,captura1
salto1:		mov ah,0
		int 16h
		mov [si],al		;GUARDA
		mov ah,02
		mov dl,2ah
		int 21h
		inc si
		loop salto1
		ret
teclado endp

tecladoOpc proc near
		lea si,opc		;captura datos
		mov ah,0
		int 16h
		mov [si],al		;GUARDA
		mov ah,02
		mov dl,al
		int 21h
		ret
tecladoOpc endp

llamarImprimir proc near
		mov ah,09
		int 21h
		ret
llamarImprimir endp

saltoLinea proc near
		mov dl,0dh
		int 21h
		mov dl,0ah
		int 21h
		ret
saltoLinea endp

end inicio


;masm nombre.asm;
;link 090419;
;090419