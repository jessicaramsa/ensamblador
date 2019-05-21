.model small
.stack 64
.data
;---------------------------DATOS-----------------------------
dato1	dw	"Dame el dato","$"
;-------------------------FIN DATOS---------------------------
.code
;--------------------------CÓDIGO-----------------------------
start proc far
		mov ax,@data
		mov ds,ax
		mov es,ax
		
		lea dx,letrero
		call print

		mov ax,4c00h	;fin del programa
		int 21h
start endp
;------------------------FIN CÓDIGO---------------------------

;----------------------PROCEDIMIENTOS-------------------------
print proc near
	mov ah,09
	int 21h
	ret
print endp
;--------------------FIN PROCEDIMIENTOS-----------------------
end start