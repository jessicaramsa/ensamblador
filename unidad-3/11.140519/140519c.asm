.Model small
.Stack 64
.Data


;---------------- Letreros, variables ------------------

nombre db "Jessica","$"
apellido db "Ramirez","$"
espacio db 2*8 dup (20h),"$"
; duplicar 2 veces, *8 multiplicarlo 8 veces

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
		mov ah,09
		lea dx,espacio
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