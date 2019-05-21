.model small
.stack 64
.data
;----------------------------------------------------------

numerador db "81"
denominador db "9"
resultado db "00","$"

;----------------------------------------------------------

.code
empezar proc far
	
	mov ax,@data
	mov ds,ax
	mov es,ax


	mov cl,0
	lea si,numerador
	lea di,denominador
	lea bx,resultado
	mov al,[si]
	mov dl,[di]
salto:	sub al,dl
	inc cl
	cmp al,dl
	jge salto
	
	mov resultado,cl
	
	lea si,resultado
	mov ah,02h
	mov dl,[si]
	or dl,30h
	int 21h

	

	mov ax,4c00h 	;fin del programa
	int 21h
empezar endp
;************Procedimientos************
end empezar