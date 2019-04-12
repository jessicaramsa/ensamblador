.Model small
.Stack 64
.Data


;---------------- Letreros, variables ------------------

nombre db "Jessica",0dh,0ah,"Ramirez"

;-------------------------------------------------------

;------- Inicializar còdigo
.Code

inicio proc far
		mov ax,@data	;alineacion segmento datos
		mov es,ax
		mov ds,ax

		mov ah,09
		lea dx,nombre
		int 21h

		mov ax,4c00h		;fin de programa
		int 21h

inicio endp
end inicio


;masm 090419.asm;
;link 090419;
;090419