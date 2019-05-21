; ------ esqueleto con wait

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

		mov ax,0600h
		mov bh,4fh	;atributo
		mov cx,0000h
		mov dx,184fh
		int 10h

		mov ah,02
		mov bh,0
		mov dx,0c26h
		int 10h

		mov dh,10
		lea si,nombre
salto1:		mov ah,02
	 	mov dl,[si]
		int 21h
		inc si
		mov cx,0fffh
salto2:		mov bx,9fffh
salto3:		dec bx
		cmp bx,0
		jne salto3
		loop salto2
		dec dl
		cmp dl,0
		loop salto1

		mov ax,4c00h	;fin de programa
		int 21h
inicio endp
end inicio


;masm 090419.asm;
;link 090419;
;090419