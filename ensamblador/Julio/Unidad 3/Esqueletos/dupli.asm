.model small
.stack 64
.data
;----------------------------------------------------------

param label byte	;255 caracteres
max db 20
captura db ?
duplicar db 21 dup(" ")
ms db "Dame tu nombre: ","$"

;----------------------------------------------------------

.code
empezar proc far
	
	mov ax,@data
	mov ds,ax
	mov es,ax

	mov dh,12
	mov dl,25
	call cursor
	
	mov bh,90h	
	add bh,50h
	call color

	lea dx,ms
	call imprimir

	call insertar

	mov bh,20h
	call color
	cmp captura,0
	je fin
	call compara
	call centrar


fin:	mov ax,4c00h 	;fin del programa
	int 21h
empezar endp

;***********************PROCEDIMIENTOS***************
cursor proc near
	mov ah,02h
	mov bh,0h
	int 10h
	ret 
cursor endp
color proc near 
	mov ax,0600h
	mov cx,0h
	mov dx,184fh
	int 10h
	ret
color endp
imprimir proc near
	mov ah,09h
	int 21h
	ret 
imprimir endp 
insertar proc near
	mov ah,0ah
	lea dx,param
	int 21h
	
	ret
insertar endp

compara proc near
	mov bh,0
	mov bl,captura
	mov duplicar[bx],07
	mov duplicar[bx+1],'$'
	ret
compara endp 
centrar proc near
	
	mov dl,captura
	shr dl,1h
	neg dl
	add dl,40h
	mov dh,12h
	call cursor
	lea dx,duplicar
	call imprimir
	ret
centrar endp
end empezar