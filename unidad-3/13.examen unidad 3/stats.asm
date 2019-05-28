;--------------------------------------------------------------------
; EXAMEN UNIDAD 3
; Jèssica Ramirez Sanchez
; 21 Mayo 2019
;--------------------------------------------------------------------
;
;
;--------------------------- MACROS ---------------------------------
;
;------------------------ FIN DE MACROS -----------------------------


.Model small
.Stack 64
.Data

;----------------------- LETREROS Y VARIABLES ---------------------------------

espacios db 20h,20h,"$"
saltoLinea db 0ah,0ah,"$"

pregunta db "Cuantos minutos fumas al dia (5 digitos)?:  "
cigarrillos db "cigarrillos *  ","$"
igual db "=","$"
diagonal db "/  60  =  ","$"
diagonal2 db "/  24  =  ","$"
dias db "dias","$"
anio1 db "365  *","$"
anio db "anio","$"
alAnio db "al anio","$"
hrDiarias db "  horas diarias  ","$"
minDiarios db "  min. diarios  ","$"

capturaMinutos db "00000","$"
minutosMenos db "9","$"

minutosHora equ 60
diasAnio equ 365
anioDias equ 24
resultado1 db "000000","$"
resultado2 db "000000","$"
resultado3 db "000000","$"
resultado4 db "000000","$"
res1 db "000000","$"
res2 db "000000","$"
res3 db "000000","$"

;-------------------- FIN DE LETREROS Y VARIABLES -----------------------------
;----------------------- INICIALIZAR CÒDIGO -----------------------------------
.Code

inicio proc far
		mov ax,@data		;alineacion segmento datos
		mov es,ax
		mov ds,ax
		include c:\imp.lib	; macro para imprimir

		imprimir pregunta
		call capturar

		lea si,capturaMinutos+4
		lea di,minutosMenos
		lea bx,resultado1+5
		call multiplicar
		imprimir saltoLinea
		imprimir cigarrillos
		imprimir capturaMinutos
		imprimir espacios
		imprimir igual
		imprimir espacios
		imprimir resultado1
		imprimir minDiarios

		imprimir saltoLinea
		lea si,resultado1+4
		lea di,minutosHora+1
		lea bx,resultado2+5
		call multiplicar
		imprimir resultado1
		imprimir minDiarios
		imprimir diagonal
		imprimir resultado2
		imprimir hrDiarias

		imprimir saltoLinea
		lea si,resultado2+4
		lea di,diasAnio+2
		lea bx,resultado3+5
		call multiplicar
		imprimir anio1
		imprimir resultado2
		imprimir hrDiarias
		imprimir igual
		imprimir espacios
		imprimir resultado3
		imprimir espacios
		imprimir alAnio

		imprimir saltoLinea
		lea si,resultado3+4
		lea di,anioDias+1
		lea bx,resultado4+5
		call multiplicar
		imprimir resultado3
		imprimir espacios
		imprimir anio
		imprimir espacios
		imprimir diagonal2
		imprimir resultado4
		imprimir dias

fin:		mov ax,4c00h		;fin de programa
		int 21h
inicio endp
;------------------------ FIN DE CÒDIGO ---------------------------------------
;------------------------- PROCEDIMIENTOS -------------------------------------
capturar proc near
		lea si,capturaMinutos
		mov cl,5
saltoCAPT:	mov ah,0
		int 16h
		mov [si],al		;GUARDA
		mov ah,02
		mov dl,al
		int 21h
		inc si
		loop saltoCAPT
		ret
capturar endp

multiplicar proc near
		mov ax,0
		mov dx,0
saltoM1:	mov al,[si]
		mov dl,[di]
		and al,0fh
		and dl,0fh
		mul dl
		aam
		add al,dh
		aaa
		mov dh,ah
		dec si
		dec bx
		loop saltoM1
		mov [bx],ah
		ret
multiplicar endp

;----------------------- FIN DE PROCEDIMIENTOS --------------------------------
end inicio
;--------------------------- FIN DE PROGRAMA ----------------------------------