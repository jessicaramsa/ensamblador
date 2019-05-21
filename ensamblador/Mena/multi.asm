.model small
.stack 64
.data
;---------------------------DATOS-----------------------------
dato1		dw	9h
dato2		dw	20h
dato3		dw	60h
dato4		dw	24h
dato5		dw	?
;-------------------------FIN DATOS---------------------------
.code
;--------------------------CÓDIGO-----------------------------
start proc far
		mov ax,@data
		mov ds,ax
		mov es,ax

		mov ax,dato1
		mov dx,dato2
		mul dx
		mov bx,ax
		mov dx,dato3
		div dx

		mov cx,ax
		mov dato5,cx
		call year

		mov ax,4c00h	;fin del programa
		int 21h
start endp
;------------------------FIN CÓDIGO---------------------------

;----------------------PROCEDIMIENTOS-------------------------
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
print2 proc near 
		mov ah,09
		int 21h
		ret
print2 endp
year proc near
		sub ax,ax
		sub bx,bx
		sub dx,dx
		
		mov ax,dato5
		mov bx,0ah
		div bx
		or dx,3030h
		push dx
		sub dx,dx
		div bx
		or dx,3030h
		push dx
		sub dx,dx
		div bx
		or dx,3030h
		push dx
		or ax,3030h
		push ax
		pop dx
		mov ah,02h
		int 21h
		pop dx
		mov ah,02h
		int 21h
		pop dx
		mov ah,02h
		int 21h
		pop dx
		mov ah,02h
		int 21h
		mov dl,32
		mov ah,02h
		int 21h
		ret
year endp
;--------------------FIN PROCEDIMIENTOS-----------------------
end start


		