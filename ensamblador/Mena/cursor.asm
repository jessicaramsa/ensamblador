.model small
.stack 64
.data
;........................................................
nombre db "Josue Eduardo Gonzalez"
;........................................................
.code
start	proc	far
		
		mov ax,@data
		mov ds, ax
		mov es,ax

		mov bh,90h
		add bh,50h
		call color

		mov dl,30
		mov dh,12
		call cursor

		mov cl,5
		lea si,nombre
		call print

		mov dh,2
		mov dl,2
		call cursor

		mov cl,7
		lea si,nombre+6
		call print

		mov cl,8
		lea si,nombre+14
		call print

		mov ax, 4c00h
		int 21h
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

color proc near
		mov ah,06
		mov cx,0
		mov dx,184fh
		int 10h
color endp

end start