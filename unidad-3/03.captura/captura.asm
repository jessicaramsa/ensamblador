.Model small
.Stack 64
.Data


;---------------- Letreros, variables ------------------

msj db "Dame tu nombre: ","$"
captura db "0000000","$"

;-------------------------------------------------------

;------- Inicializar còdigo
.Code

inicio proc far
		mov ax,@data	;alineacion segmento datos
		mov es,ax
		mov ds,ax

		lea dx,msj
		call print
		call teclado

		mov dh,20		;RENGLÒN
		mov dl,60		;COLUMNA
		call cursor
		lea dx,captura
		call print

salto2:		mov ah,0
		int 16h
		cmp al,13		;compara con enter
		je fin
		jne salto2

fin:		mov ax,4c00h		;fin de programa
		int 21h

inicio endp

;------- Inicio de procedimientos

print proc near
		mov ah,09
		int 21h
		ret
print endp

teclado proc near
		mov cl,7		;captura datos
		lea si,captura
salto1:		mov ah,0
		int 16h
		mov [si],al		;GUARDA
		mov ah,02
		mov dl,al
		int 21h
		inc si
		loop salto1
		ret
teclado endp

cursor proc near
		mov ah,02		;cursor
		mov bh,0		;pagina 0
		int 10h
		ret
cursor endp



end inicio


;masm nombre.asm;
;link 090419;
;090419