.model small
.stack 64
.data
;----------------------------------------------------------
nombre db "Jose Julio Villegas"
;----------------------------------------------------------

.code
empezar proc far
	
	mov ax,@data
	mov ds,ax
	mov es,ax
	
	mov bh,90h;Colocar color
	add bh,50h
	call color

	mov dl,30
	mov dh,12
	call cursor
	
	mov cl,4
	lea si,nombre
	call imprimir

	mov dh,2
	mov dl,2
	call cursor
	
	mov cl,5
	lea si,nombre+5
	call imprimir

	mov dh,2
	mov dl,60
	call cursor
	
	mov cl,8
	lea si,nombre+11
	call imprimir
	

	mov ax,4c00h 	;fin del programa
	int 21h
empezar endp

;..........Procedimientos.......

cursor proc near
	mov ah,02
	mov bh,0
	int 10h
	ret
cursor endp

imprimir proc near
	mov ah,02
salto1:	mov dl,[si]
	int 21h
	inc si
	loop salto1
	ret
imprimir endp

color proc near
	mov ah,06
	mov cx,0
	mov dx,184fh
	int 10h
	ret
color endp
	

end empezar