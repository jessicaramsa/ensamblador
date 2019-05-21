.model small
.stack 64
.data
;---------------------------DATOS-----------------------------
parametro label byte 
maximo db 20
captura db ?
duplica db 21 dup (' ')
msj1 db "Dame Tu Nombre: ","$"
;-------------------------FIN DATOS---------------------------
.code
;--------------------------CÓDIGO-----------------------------
start proc far
		mov ax,@data
		mov ds,ax
		mov es,ax

		mov ax,@data
        mov ds,ax
        mov es,ax

		mov dh,12
		mov dl,25
		call cursor

		mov bh,90h
		add bh,50h
		call color

		lea dx,msj1	
		call imprimir 

		call insertar
	  	
		mov bh,20h
		call color 
		
		cmp captura,0
		je fin	
		call compara
		call centrar

fin:	mov ax,4c00h	;fin del programa
		int 21h
start endp
;------------------------FIN CÓDIGO---------------------------

;----------------------PROCEDIMIENTOS-------------------------
cursor proc near
		mov ah,02h
		mov bh,0h
		int 10h
		ret
cursor endp
color proc near
		mov ax,0600h
		mov cx,0000h
		mov dx,184fh
		int 10h
		ret
color endp
imprimir proc near
		mov ah,09
		int 21h
		ret
imprimir endp
insertar proc near
		mov ah,0ah
		lea dx,parametro
		int 21h
		ret
insertar endp
compara proc near 
		mov bh,0
		mov bl,captura
		mov duplica[bx],07
		mov duplica[bx+1],'$'
		ret
compara endp
centrar proc near
		mov dl, captura
		shr dl,1
		neg dl
		add dl,40h
		mov dl,6
		call cursor
		lea dx,duplica
		call imprimir 
		ret
centrar endp
;--------------------FIN PROCEDIMIENTOS-----------------------
end start


		