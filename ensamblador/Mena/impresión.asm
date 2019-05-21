.model small
.stack 64
.data
;........................................................
name db "Josué Eduardo González Mena"
;........................................................
.code
start	proc	far
	
	mov ax,@data
	mov ds,ax
	mov es,ax

	mov cl,27
	lea si,name
	mov ah,02
jmp1:	mov dl,[si]
	int 21h
	inc si
	loop jmp1
	
	mov ax,4c00h	;end of program
	int 21h
start endp
end start
