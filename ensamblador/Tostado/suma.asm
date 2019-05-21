.model small
.stack 64
.data

;---------------- MENSAJES Y VARIABLES -----------------------

	mensaje1 db "Ingresa el primer numero: ", "$"
	mensaje2 db "Ingresa el segundo numero: ", "$"
	mensaje3 db "El resultado de la suma es: ", "$"

	numero1 db "000", "$"
	numero2 db "000", "$"
	resultado db "0000", "$"
	espacio db 0ah,0dh, "$"

;---------------- INICIO DE PROGRAMA -------------------------

.code
Empezar proc near
	mov ax,@data
	mov ds,ax
	mov es,ax

	
	mov dh,18	;mover renglon
	mov dl,25	;mover columna
	call cursor

	lea si,numero1	;captura del primer numero
	lea dx,mensaje1
	call Capturar

	mov dh,19	;mover renglon
	mov dl,25	;mover columna
	call cursor

	lea si,numero2	;captura del segundo numero
	lea dx,mensaje2
	call Capturar

	lea si,numero1	;hacer la suma
	lea di,numero2
	lea bx,resultado
	call Sumar

	mov dh,20	;mover renglon
	mov dl,25	;mover columna
	call cursor

	lea si,resultado
	lea dx,mensaje3
	call Imprimir

	mov ax,4c00h
	int 21h
Empezar endp

;----------------- METODOS ------------------------------------

;Captura un numero de tres digitos con un mensaje en dx y lo guarda en si
Capturar proc near
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
Capturar endp

;Imprime el numero que este en si y el mensaje que este en dx
Imprimir proc near
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
Imprimir endp

;Suma los numeros que esten en el registro si y di, y los guarda en bx
Sumar proc near
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
Sumar endp

cursor proc near
	mov ah,02
	mov bh,0
	int 10h
	ret
cursor endp


;----------------- FIN DE PROGRAMA -----------------------
end Empezar