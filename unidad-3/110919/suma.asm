.Model small
.Stack 64
.Data
;---------------------- LETREROS, VARIABLES ---------------
	mensaje1 db "PRIMER NUMERO:  ","$"
	mensaje2 db "SEGUNDO NUMERO:  ","$"
	mensaje3 db "RESULTADO DE SUMA:  ","$"

	numero1 db "000","$"
	numero2 db "000","$"
	resultado db "0000","$"
	espacio db 0ah,0dh,"$"
;----------------------------------------------------------
;---------------- INICIALIZAR CÒDIGO ----------------------
.Code
inicio proc near
	mov ax,@data
	mov ds,ax
	mov es,ax

	lea si,numero1		;PRIMER NÙMERO
	lea dx,mensaje1
	call Capturar

	lea si,numero2		;SEGUNDO NÙMERO
	lea dx,mensaje2
	call Capturar

	lea si,numero1		;SUMA
	lea di,numero2
	lea bx,resultado
	call Sumar

	lea si,resultado	;RESULTADO
	lea dx,mensaje3
	call Imprimir

	mov ax,4c00h
	int 21h
inicio endp

;------------------ PROCEDIMIENTOS ------------------------
;--- capturar un nùmero de 3 dìgitos
capturar proc near
	mov ah,09h
	int 21h
	mov cl,3
salto1:	mov ah,0
	int 16h
	mov [si],al
	mov ah,02
	mov dl,al
	int 21h
	inc si
	loop salto1
	lea dx,espacio
	mov ah,09h
	int 21h
	ret
capturar endp

;--- imprimir el nùmero en 'si'
imprimir proc near
	mov ah,09h
	int 21h
	mov cl,4
	mov ah,02h
salto3:	mov dl,[si]
	or dl,30h
	int 21h
	inc si
	loop salto3	
	mov ah,09h
	lea dx,espacio
	int 21h
	ret
imprimir endp

;--- sumar los nùmeros en 'si' y 'di'
sumar proc near
	add si,2
	add di,2
	add bx,3
	mov cl,3
salto2:	mov al,[si]
	mov dl,[di]
	mov ah,0
	adc al,dl
	aaa
	mov [bx],al
	mov dh,ah
	dec si
	dec di
	dec bx
	loop salto2
	mov [bx],dh
	ret
sumar endp

end inicio