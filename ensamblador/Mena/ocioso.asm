.model small
.stack 64
.data
;---------------------------DATOS-----------------------------
nombre	db	"00000"
mssg	db	"Introduce tu nombre: ","$"
numero	equ	5
;-------------------------FIN DATOS---------------------------
.code
;--------------------------CÓDIGO-----------------------------
start proc far
		mov ax,@data
		mov ds,ax
		mov es,ax

		mov ax,6000h
		mov bh,10h
		mov cx,0h
		mov dx,184fh
		int 10h

		mov ah,09
		lea dx,mssg
		int 21h

		lea si,nombre
		mov cl,numero
dat:	mov ah,01
		int 21h
		mov [si],al
		inc si
		loop dat

		mov dl,13
		call print
		mov dl,10
		call print

		mov bl,numero
		lea si,nombre
		mov ah,02
jmp1:	mov dl,[si]
		int 21h
		inc si
		mov cx,1ffh
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

print proc near
		mov ah,02
		int 21h
		ret
print endp

;--------------------FIN PROCEDIMIENTOS-----------------------
end start


		