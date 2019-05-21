.model small
.stack 64
.data
;........................................................
nombre db "Josué Eduardo González"
;........................................................
.code
start	proc	far
		
		mov ax,@data
		mov ds, ax
		mov es,ax
		mov dl,30
		mov dh,12

		call cursor

		mov cl,5
		lea si,nombre
		call print

		mov dh,2
		mov dl,2
		cal cursor

		mov cl,7
		lea si,nombre+6
		call print

		mov cl,8
		lea si,nombre+14
		call print

		mov ah,02
jmp1:	mov dl,[si]
		int 21h
		inc si
		loop jmp1

	
start endp
;...................PROCEDIMIENTOS.......................

cursor proc near
		mov ah,02
		mov bh,0
		int 10h
		ret
cursor endp

print proc near
		mov ah,02
jmp2:	mov dl,[si]
		int 21h
		inc si
		loop jmp2
		ret
print endp

end start