.model small
.stack 64
.data
;----------------------------------------------------------
numero dw ?
numero1 dw ?
;----------------------------------------------------------

.code
empezar proc far
	
	mov ax,@data
	mov ds,ax
	mov es,ax
	
	mov numero,40
	mov numero1,45
	mov cl,40
	mov dl,45
	
reg:	inc cx
	call color
	cmp cx,80
	je fin
	jmp reg
fin:mov ah,0
	int 16
	mov ah,0
	mov al,3
	int 10

	
	mov ax,4c00h 	;fin del programa
	int 21h
empezar endp
color proc near
	mov ah,0ch
	mov al,09h
	int 10h
	ret
color endp
end empezar