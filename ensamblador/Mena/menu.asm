imprimir macro dato 
		mov ah,09
		lea dx,dato
		int 21h
endm
		
mouse macro
		
endm

.model small
.stack 64
.data
;---------------------------DATOS-----------------------------
mn1 	db	"Nombres         ","$"
mn2		db	"Apellido M      ","$"
mn3		db	"Apellido P      ","$"
;-------------------------FIN DATOS---------------------------
.code
;--------------------------CÓDIGO-----------------------------
start proc far
		mov ax,@data
		mov ds,ax
		mov es,ax

		imprimir mn1
		imprimir mn2
		imprimir mn3

		mov ax,4c00h	;fin del programa
		int 21h
start endp
;------------------------FIN CÓDIGO---------------------------

;----------------------PROCEDIMIENTOS-------------------------

;--------------------FIN PROCEDIMIENTOS-----------------------
end start


		