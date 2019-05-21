.model small
.stack 64
.data
;---------------------------DATOS-----------------------------
num	db	"81","$"
den	db	"9","$"
ans	db	"00","$"
;-------------------------FIN DATOS---------------------------
.code
;--------------------------CÓDIGO-----------------------------
start proc far
		mov ax,@data
		mov ds,ax
		mov es,ax

		lea si,num
		lea di,den
		lea bx,ans
		mov cl,0
		mov al,[si]
		mov dl,[di]
subs:	sub al,dl
		inc cl
		cmp al,dl
		jge subs
		mov [bx],cl

		lea si,ans
		mov ah,02
		mov dl,[si]
		or dl,30h
		int 21	


		mov ax,4c00h	;fin del programa
		int 21h
start endp
;------------------------FIN CÓDIGO---------------------------

;----------------------PROCEDIMIENTOS-------------------------

;--------------------FIN PROCEDIMIENTOS-----------------------
end start


		