.model small
.stack 64
.data
;---------------------------DATOS-----------------------------

;-------------------------FIN DATOS---------------------------
.code
;--------------------------CÓDIGO-----------------------------
start proc far
		mov ax,@data
		mov ds,ax
		mov es,ax

		mov ah,0
		mov al,12h
		int 10h
		mov ah,0ch
		mov al,0eh
		mov bh,0
		mov cx,50
		mov bx,50
		int 10h
		mov ah,0
		int 16
		mov ah,0
		mov al,3
		int 10

		mov ax,4c00h	;fin del programa
		int 21h
start endp
;------------------------FIN CÓDIGO---------------------------

;----------------------PROCEDIMIENTOS-------------------------

;--------------------FIN PROCEDIMIENTOS-----------------------
end start


		