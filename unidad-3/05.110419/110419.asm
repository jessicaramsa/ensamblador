;--- 11 Abril 2019

.Model small
.Stack 64
.Data

;---------------- Letreros, variables ---------------------

msj db "Dame tu nombre: ","$"

;----------------------------------------------------------

;------- Inicializar còdigo
.Code

inicio proc far
		mov ax,@data	;alineacion segmento datos
		mov es,ax
		mov ds,ax

		mov ah,02
		mov bh,0	;pàgina
		mov dh,12	;renglòn
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