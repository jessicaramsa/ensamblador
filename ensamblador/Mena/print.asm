.model small
.stack 64
.data
;........................................................
message db "Dame tu nombre: "
save db "00000000000000"
;........................................................
.code
start	proc	far
	
	mov ax,@data
	mov ds,ax
	mov es,ax

	mov cl,27
	lea si,message
	mov ah,02
jmp1:	mov dl,[si]
	int 21h
	inc si
	loop jmp1

	lea si,save
	mov cl,10
jmp2:	mov ah,0
	int 16h
	mov [si],al
	
	mov ah,02
	mov dl,al
	int 21h
	inc si
	loop jmp2

	mov ah,20
	mov dl,0dh
	int 21h
	mov dl,10
	int 21h

	mov cl,14
	lea si,save
	mov ah,03

jmp3:	mov dl,[si]
	int 21h
	inc si
	loop jmp3
	
	mov ax,4c00h	;end of program
	int 21h
start endp
end start
