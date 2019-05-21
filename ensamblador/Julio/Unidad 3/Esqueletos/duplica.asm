.model small
.stack 64
.data
;----------------------------------------------------------
duplica db 5 dup("a"),"$"
;----------------------------------------------------------

.code
empezar proc far
	
	mov ax,@data
	mov ds,ax
	mov es,ax
	
	mov ah,09
	lea dx,duplica
	int 21h


	mov ax,4c00h 	;fin del programa
	int 21h
empezar endp
end empezar

;-----mov ah,2a y int 21	fecha
;-----mov ah,2c y int 21	horario
:-----mov ah,2b y int 21	fecha