.Model small
.Stack 64
.Data


;---------------- Letreros, variables ------------------

nombre db "Jessica","$"
apellido db "Ramirez","$"
espacio equ 20h

;-------------------------------------------------------

;------- Inicializar c�digo
.Code

inicio proc far
		mov ax,@data	;alineacion segmento datos
		mov es,ax
		mov ds,ax

		mov ah,09
		lea dx,nombre
		int 21h
		mov ah,02
		mov dl,espacio
		int 21h
		mov ah,09
		lea dx,apellido
		int 21h

		mov ax,4c00h		;fin de programa
		int 21h

inicio endp
end inicio


;--------------------------------------------------------------------
; masm nombre.asm;
; link nombre;
; nombre