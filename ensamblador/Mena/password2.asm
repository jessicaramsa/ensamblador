.model small
.stack 64
.data
;........................................................
pwdrq db "Introduce tu password","$"
;........................................................
.code
start	proc	far
		
		mov ax,@data
		mov ds, ax
		mov es,ax

		lea dx,password
		call pwdlbl

		mov ax, 4c00h
		int 21h
start endp
;...................PROCEDIMIENTOS.......................

pwdlbl proc near
		mov ah,09
		int 21h
pwdlbl endp

end start