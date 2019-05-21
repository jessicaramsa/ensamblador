.model small
.stack 64
.data
;----------------------------------------------------------
nombre db "Jose Julio Villegas Ayala"

;----------------------------------------------------------

.code
empezar proc far
	
	mov ax,@data
	mov ds,ax
	mov es,ax
	
	mov cl,25
	lea si,nombre
	mov ah,02
salto1: mov dl[si]
	int 21h
	inc si
	loop salto1
	


	mov ax,4c00h 	;fin del programa
	int 21h
empezar endp
end empezar