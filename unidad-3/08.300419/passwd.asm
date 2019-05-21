.Model small
.Stack 64
.Data


;---------------- Letreros, variables ------------------

msj db "Introduce tu password: ",0dh,0ah,"$"
pass db "1234"
capp db "0000","$"
menu db "Teclea la operacion que deseas realizar",0dh,0ah,0dh,0ah
	 db "1.- Suma",0dh,0ah
	 db "2.- Resta",0dh,0ah
	 db "3.- Multipllicacion",0dh,0ah,"$"
incorrecto db "Password incorrecto","$"

;-------------------------------------------------------

;------- Inicializar còdigo
.Code

inicio proc far
		mov ax,@data		;alineacion segmento datos
		mov es,ax
		mov ds,ax

		mov bh,57h		;morado con blanco
		call color

		mov dx,0c27h		;coord de cursor
		call cursor

		lea dx,msj		;mensaje de captura
		call imprimir

		call entrada

		cld
		mov cl,4
		lea si,pass
		lea di,capp
		rep cmpsb

		cmp cx,0
		je salto2
		lea dx,incorrecto	;pass incorrecto
		call imprimir
		jmp fin

salto2:		mov bh,17h		;pass correcto
		call color
		lea dx,menu
		call imprimir

fin:		mov ax,4c00h		;fin de programa
		int 21h

inicio endp

;---------------- Procedimientos -----------------------

color proc near
		mov ax,0600h
		mov cx,184fh
		mov dx,0000h
		int 10h
		ret
color endp

cursor proc near
		mov ah,02
		mov bh,0
		int 10h
		ret
cursor endp

imprimir proc near
		mov ah,09h
		int 21h
		ret
imprimir endp

entrada proc near
		lea si,capp
		mov cl,4
salto1:		mov ah,0
		int 16h
		mov [si],al
		mov ah,02		;imprimir asterisco
		mov dl,2ah
		int 21h
		inc si
		loop salto1
		ret
entrada endp

end inicio


;masm nombre.asm;
;link nombre;
;nombre