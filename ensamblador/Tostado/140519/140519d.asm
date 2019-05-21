.Model small
.Stack 64
.Data


;---------------- Letreros, variables -------------------------------

reserva label byte			; reserva un byte
restriccion db 30
reales db ?				;cuantos voy a permitir
captura db 31 dup (' '),"$"		;dup pone uno menos
pregunta db "Inserta tu nombre:  ","$"

;--------------------------------------------------------------------

;------- Inicializar còdigo
.Code

inicio proc far
		mov ax,@data	;alineacion segmento datos
		mov es,ax
		mov ds,ax

inicioPregunta:	mov ax,0600h
		mov bh,17h		;azul y negro
		mov cx,0000h
		mov dx,184fh
		int 10h

		mov ah,02
		mov bh,0
		mov dh,0
		mov dl,0
		int 10h

		mov ah,09		;realiza la pregunta
		lea dx,pregunta
		int 21h

		mov ah,0ah		;capturar los 30 caracteres
		lea dx,reserva
		int 21h

		mov ax,0600h		;limpia e imprime lo que capturaste
		mov bh,40h		;color
		mov cx,0000h
		mov dx,184fh
		int 10h			;modo gràfico

		mov ah,02
		mov bh,0
		mov dh,12
		mov dl,40
		int 10h

		mov ah,09
		lea dx,captura
		int 21h

		mov ah,0		;esperate
		int 16h

		cmp reales,0
		je fin
		jmp inicioPregunta

fin:		mov ax,4c00h		;fin de programa
		int 21h

inicio endp
end inicio


;masm nombre.asm;
;link nombre;
;nombre