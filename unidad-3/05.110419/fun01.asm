;--- 11 Abril 2019

.Model small
.Stack 64
.Data

;---------------- Letreros, variables ---------------------

msj db "Dame tu nombre: ","$"

;----------------------------------------------------------

;------- Inicializar c�digo
.Code

inicio proc far
		mov ax,@data	;alineacion segmento datos
		mov es,ax
		mov ds,ax

		mov ax,0600h	;cambio de color pantalla
		mov bh,52h	;fondo morado, frente verde
		mov cx,0000h	;rengl�n y columna inicial
		mov dx,184fh	;rengl�n y columna final
		mov 

		mov ah,02
		mov bh,0	;p�gina
		mov dh,12	;rengl�n
		mov dl,30
		int 10h
		lea dx,msj
		mov ah,09
		int 21h
		mov cl,7
		mov ah,01
salto1:		int 21h
		loop salto1


		mov ax,4c00h	;fin de programa
		int 21h
inicio endp
end inicio




;masm 090419.asm;
;link 090419;
;090419