.model small
.stack 64
.data
;----------------------------------------------------------

;----------------------------------------------------------

.code
empezar proc far
	
	mov ax,@data
	mov ds,ax
	mov es,ax
	
	
	mov ah,0
	mov al,1
	int 10h
	mov al,03
	int 10h
	


	mov ax,4c00h 	;fin del programa
	int 21h
empezar endp
end empezar





