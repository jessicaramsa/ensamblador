.model smal
.stack 64
.data
;---------------------------DATOS-----------------------------
nombre	db	"Josue"
;-------------------------FIN DATOS---------------------------
.code
;--------------------------CÓDIGO-----------------------------
start proc far
		mov ax,@data
		mov ds,ax
		mov es,ax

		mov bl,5
		lea si,nombre
		mov ah,02
jmp1:	mov dl,[si]
		int 21h
		inc si
		mov cx,ffh
jmp2:	mov di,9fffh
		add di,6000h
jmp3:	dec di
		cmp di,0
		jne jmp3
		loop jmp2
		dec bl
		cmp bl,0
		jne jmp1

		mov ax,4c00h	;fin del programa
		int 21h
start endp
;------------------------FIN CÓDIGO---------------------------

;----------------------PROCEDIMIENTOS-------------------------

;--------------------FIN PROCEDIMIENTOS-----------------------
end start


		