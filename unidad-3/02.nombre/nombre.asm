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

		mov cl,7		;NOMBRE
		lea si,nombre
		mov ah,02
salto1: 	mov dl,[si]
		int 21h			;h
		inc si
		loop salto1

		mov cl,9		;APELLIDO
		lea si,nombre+7
		mov ah,02
salto2: 	mov dl,[si]
		int 21h			;h
		inc si
		loop salto2
		mov ax,4c00h		;fin de programa
		int 21h

inicio endp
end inicio


;masm nombre.asm;
;link nombre;
;nombre