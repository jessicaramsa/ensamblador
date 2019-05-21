.model small
.stack 64
.data
;---------------------------DATOS-----------------------------
num	db	81
den	db	9
ans	db	"00","$"
;-------------------------FIN DATOS---------------------------
.code
;--------------------------CÓDIGO-----------------------------
start proc far
		mov ax,@data
		mov ds,ax
		mov es,ax

		mov ax,num
		add ax,den
		mov ans,ax
		mov ah,09
		lea dx,ans
		int 21h

		mov ax,4c00h	;fin del programa
		int 21h
start endp
;------------------------FIN CÓDIGO---------------------------

;----------------------PROCEDIMIENTOS-------------------------

;--------------------FIN PROCEDIMIENTOS-----------------------
end start


		