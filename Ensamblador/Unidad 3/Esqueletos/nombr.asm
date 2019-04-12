.model small
.stack 64
.data
;----------------------------------------------------------
mensaje db "Dame tu nombre"
guardar db "0000000000"

;----------------------------------------------------------

.code
empezar proc far
	
	mov ax,@data
	mov ds,ax
	mov es,ax
	
	mov cl,16
	lea si,mensaje
	mov ah,02
salto1: mov dl[si]
	int 21h
	inc si
	loop salto1
	
	lea si,guardar
	mov cl,10
salto2: mov ah,0
	int 16h
	mov [si],al
	mov ah,02
	mov dl,al
	int 21h
	inc si
	loop salto2
	 
	mov ah,02
	mov dl,0dh
	


	mov ax,4c00h 	;fin del programa
	int 21h
empezar endp
end empezar