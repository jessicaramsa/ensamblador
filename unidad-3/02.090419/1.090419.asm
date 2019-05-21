.Model small
.Stack 64
.Data


;---------------- Letreros, variables ------------------

nombre db "Jessica"

;-------------------------------------------------------

;------- Inicializar còdigo

.Code

inicio proc far
		;tab
		mov cl,7
		mov si,nombre
		mov ah,02
salto1: 	mov dl,[si]
		int 21h			;h
		inc si
		loop salto1
		mov ax,4c00h		;fin de programa
		int 21h

inicio endp
end inicio

