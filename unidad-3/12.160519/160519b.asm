;----------------------------------------------------------
; MACROS
; pueden ir fuera o dentro del programa
; parametros nulos
;----------------------------------------------------------

;------------------------- MACROS -------------------------
divide macro dividend,divisor,cocient
		mov ax,dividend
		mov bx,divisor
		sub cx,cx

cmpAXAX:	cmp ax,bx
		jb salir
		sub ax,bx
		inc cx
		jmp cmpAXAX
salir:		mov cocient,cx
endm
;-------------------- FIN DE MACROS -----------------------

.Model small
.Stack 64
.Data

;------------------ Letreros, variables -------------------

divdnd dw 250
divsor dw 27
cociente dw ?

;----------------------------------------------------------

;------- Inicializar còdigo
.Code

inicio proc far
		mov ax,@data		;alineacion segmento datos
		mov es,ax
		mov ds,ax
		
		divide divdnd,divsor,cociente
		lea si,cociente
		mov dl,[si]
		or dl,30h
		mov ah,02
		int 21h

		mov ax,4c00h		;fin de programa
		int 21h

inicio endp
end inicio


;masm nombre.asm;
;link nombre;
;nombre