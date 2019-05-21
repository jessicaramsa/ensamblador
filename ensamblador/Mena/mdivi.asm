division macro dividendo, divisor, resultado
		mov ax,dividendo
		mov bx,divisor
		mov cx,1

jmp1:	cmp ax,bx
		je edivision
		sub ax,bx
		inc cx
		jmp jmp1
edivision:
endm
.model small
.stack 64
.data
;---------------------------DATOS-----------------------------
dividendo	dw	28
divisor		dw	2
resultado	dw	?
;-------------------------FIN DATOS---------------------------
.code
;--------------------------CÓDIGO-----------------------------
start proc far
		mov ax,@data
		mov ds,ax
		mov es,ax

		division dividendo,divisor,resultado
		sub ax,ax
		mov ax,cx
		aam
		or ax,3030h
		mov bx,ax
		mov ah,02
		mov dl,bh
		int 21h
		mov dl,bl
		int 21h

		mov ax,4c00h	;fin del programa
		int 21h
start endp
;------------------------FIN CÓDIGO---------------------------

;----------------------PROCEDIMIENTOS-------------------------

;--------------------FIN PROCEDIMIENTOS-----------------------
end start


		