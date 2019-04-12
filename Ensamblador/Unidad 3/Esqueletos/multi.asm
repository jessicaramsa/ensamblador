.model small
.stack 64
.data
;----------------------------------------------------------
num db "07F2"
op db 16 
res db 0000
op2 db "256"
var db 0
;----------------------------------------------------------

.code
empezar proc far
	
	mov ax,@data
	mov ds,ax
	mov es,ax
	
;	mov ah,2ah
;	int 21h
	lea si,num+2
	sub ax,ax	;Resta entre si mismos
	mov al,[si]
	mov bx,0ah
	aaa
	div bl
	or ax,3030h
	mov bx,dx
	mov dx,ax
	mov ah,02h
	int 21h
	xchg dh,dl	;intercambar valores
	mov ah,02h
	int 21h


	mov ax,4c00h 	;fin del programa
	int 21h
empezar endp
end empezar