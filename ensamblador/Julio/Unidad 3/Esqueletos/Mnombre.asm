
;**********programa***************
.model small
.stack 64
.data
;----------------------------------------------------------
dividendo1 dw 180
divisor1 dw 60
res dw ?,"$"
msj db "El resultado de la division es :",0dh,0ah,"$"
;----------------------------------------------------------
.code
empezar proc far
	
	mov ax,@data
	mov ds,ax
	mov es,ax

	include C:\divmacro.lib
	include C:\mac2.lib

	imprimir msj
	division dividendo1,divisor1
	sub ax,ax
	mov ax,cx
	aam
	mov cx,ax
	mov dl,ch
	mov ah,02h
	or dl,30h
	int 21h
	mov dl,cl
	or dl,30h
	int 21h	
		
	mov ax,4c00h 	;fin del programa
	int 21h
empezar endp
end empezar