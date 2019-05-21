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


menu0:	mov dh,00
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
		je ad
		cmp bx,02h
		je jmp1
		jmp jmp1
ad:
		sar cx,1
		sar cx,1
		sar cx,1
		sar dx,1
		sar dx,1
		sar dx,1
		cmp cx,00000000b
		jge m
m:		cmp cx,00010000b
		jl printj
		jne x
x:		cmp cx,00010001b
		jge y
y:		cmp cx,00100000b
		jl printg
		jne z
z:		cmp cx,00100001b
		jge r
r:		cmp cx,01000000b
		jl printm

printj:	mov dh,00
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
		jmp jmp1


printg:	mov dh,00
		mov dl,00
		call cursor

		mov bh,00h
		add bh,70h
		call color

		imprimir mn1
		imprimir mn2
		imprimir mn3
		call return
		imprimir mn5
		jmp jmp1

printm:	mov dh,00
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
		jmp jmp1



exite:	imprimir error
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
		mov cx,0000h
		mov dx,0000h
		int 10h
		ret
color2 endp
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


		