imprimir macro dato 
		mov ah,09
		lea dx,dato
		int 21h
endm
		
.model small
.stack 64
.data
;---------------------------DATOS-----------------------------
success		db	"El programa se ejecuto correctamente","$"
error		db	"El programa fallo","$"
coordx		db	"00","$"
coordy		db 	"00","$"
mn1 	db	"Nombres         ","$"
mn2		db	"Apellido M      ","$"
mn3		db	"Apellido P      ","$"
mn4		db	"Josue Eduardo   ","$"
mn5		db	"                Gonzalez ","$"
mn6		db	"                                Mena","$"
;-------------------------FIN DATOS---------------------------
.code
;--------------------------CÓDIGO-----------------------------
start proc far
		mov ax,@data
		mov ds,ax
		mov es,ax

		mov ax,00h
		int 33h
		cmp ax,00h
		je asd1


menu0:	
		mov ax,03h
		int 33h
		mov dh,00
		mov dl,00
		call cursor

		mov bh,00h
		add bh,70h
		call color

		imprimir mn1
		imprimir mn2
		imprimir mn3

jmp1:	
		mov ax,03h
		int 33h
		cmp bx,01h
		je menu1
		cmp bx,02h
		je menu1
		jmp jmp1
asd1:	jne asd2 

menu1:	
		mov ax,03h
		int 33h
		mov dh,00
		mov dl,00
		call cursor

		mov bh,00h
		add bh,70h
		call color

		imprimir mn1
		imprimir mn2
		imprimir mn3
		call return
		imprimir mn4

jmp2:	
		mov ax,03h
		int 33h
		cmp bx,01h
		je menu2
		cmp bx,02h
		jmp jmp2
asd2:	jne asd3 

menu2:	
		mov ax,03h
		int 33h
		mov dh,00
		mov dl,00
		call cursor

		mov bh,00h
		add bh,70h
		call color

		imprimir mn1
		imprimir mn2
		imprimir mn3
		call return
		imprimir mn4

jmp3:	
		mov ax,03h
		int 33h
		cmp bx,01h
		je menu3
		cmp bx,02h
		je asd3
		jmp jmp3
asd3:	jne exits 

menu3:	
		mov ax,03h
		int 33h
		mov dh,00
		mov dl,00
		call cursor

		mov bh,00h
		add bh,70h
		call color

		imprimir mn1
		imprimir mn2
		imprimir mn3
		call return
		imprimir mn6

jmp4:	
		mov ax,03h
		int 33h
		cmp bx,01h
		je menu3
		cmp bx,02h
		je asd4
		jmp jmp4
asd4:	jne exits 

exite:	
exits:
		mov ax,4c00h	;fin del programa
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

color2 proc near
		mov ax,0600h
		mov cx,000fh
		mov dx,0000h
		int 10h
		ret
color2 endp

color3 proc near
		mov ax,0600h
		mov cx,000fh
		mov dx,0000h
		int 10h
		ret
color3 endp

color4 proc near
		mov ax,0600h
		mov cx,000fh
		mov dx,0000h
		int 10h
		ret
color4 endp

color5 proc near
		mov ax,0600h
		mov cx,000fh
		mov dx,0000h
		int 10h
		ret
color5 endp
return proc near
		mov dl,13
		call print
		mov dl,10
		call print
		ret
return endp
print proc near
		mov ah,02
		int 21h
		ret
print endp
;--------------------FIN PROCEDIMIENTOS-----------------------
end start


		