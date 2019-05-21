.Model small
.Stack 64
.Data


;------ Letreros, Variables ---------------------

nombre db "0000000"
espacio db " "
ms db "introduce tu nombre: ","$"

;----- INICIO DE PROGRAMA ----------------------


;Inicializar còdigo
.Code
empezar proc far
	
	mov ax,@data
	mov ds,ax
	mov es,ax

	mov ax,0600h	;atributo para cambio de color
	mov bh,30h	;fondo blanco frente negro
	mov cx,0000h	;renglon columna inicio
	mov dx,184fh	;renglon columna final
	int 10h
	
	mov ah,09	;Introducir nombre
	lea dx,ms
	int 21h

	lea si,nombre
	mov cl,7
dato:	mov ah,01
	int 21h
	mov [si],al
	inc si
	loop dato	;fin de introducir
	
	mov ax,0600h	;atributo para cambio de color
	mov bh,70h	;fondo blanco frente negro
	mov cx,0000h	;renglon columna inicio
	mov dx,184fh	;renglon columna final
	int 10h

	mov dh,09	;mover renglon
	mov dl,30	;mover columna
	call cursor	

	mov bl,7	;impresion de nombre
	lea si,nombre
	mov ah,02
salto:	mov dl,[si]
	int 21h
	inc si
	mov cx,3FFFh
salto2:	mov di,9fffh
	add di,6000h
salto1:	dec di
	cmp di,0
	jne salto1
	loop salto2
	
	dec bl
	cmp bl,0
	jne salto	;fin de impresion
	
;--------------- BAJAR T ---------------------

	mov dh,09	;mover renglon
	mov dl,30	;mover columna
	call cursor
	call imprimirES	

	mov dh,[09+1]	;mover renglon
	mov dl,30	;mover columna
	call cursor
	call imprimirT
	
	mov dh,[09+1]	;mover renglon
	mov dl,30	;mover columna
	call cursor
	call imprimirES
	
	mov dh,[09+2]	;mover renglon
	mov dl,30	;mover columna
	call cursor
	call imprimirT

	mov dh,[09+2]	;mover renglon
	mov dl,30	;mover columna
	call cursor
	call imprimirES

	mov dh,[09+3]	;mover renglon
	mov dl,30	;mover columna
	call cursor
	call imprimirT

	mov dh,[09+3]	;mover renglon
	mov dl,30	;mover columna
	call cursor
	call imprimirES

	mov dh,[09+4]	;mover renglon
	mov dl,30	;mover columna
	call cursor
	call imprimirT

	mov dh,[09+4]	;mover renglon
	mov dl,30	;mover columna
	call cursor
	call imprimirES

	mov dh,[09+5]	;mover renglon
	mov dl,30	;mover columna
	call cursor
	call imprimirT

	mov dh,[09+5]	;mover renglon
	mov dl,30	;mover columna
	call cursor
	call imprimirES

	mov dh,[09+6]	;mover renglon
	mov dl,30	;mover columna
	call cursor
	call imprimirT

	mov dh,[09+6]	;mover renglon
	mov dl,30	;mover columna
	call cursor
	call imprimirES

	mov dh,[09+7]	;mover renglon
	mov dl,30	;mover columna
	call cursor
	call imprimirT

;--------------- BAJAR O ----------------

	mov dh,09	;mover renglon
	mov dl,31	;mover columna
	call cursor
	call imprimirES	

	mov dh,[09+1]	;mover renglon
	mov dl,31	;mover columna
	call cursor
	call imprimirO
	
	mov dh,[09+1]	;mover renglon
	mov dl,31	;mover columna
	call cursor
	call imprimirES
	
	mov dh,[09+2]	;mover renglon
	mov dl,31	;mover columna
	call cursor
	call imprimirO

	mov dh,[09+2]	;mover renglon
	mov dl,31	;mover columna
	call cursor
	call imprimirES

	mov dh,[09+3]	;mover renglon
	mov dl,31	;mover columna
	call cursor
	call imprimirO

	mov dh,[09+3]	;mover renglon
	mov dl,31	;mover columna
	call cursor
	call imprimirES

	mov dh,[09+4]	;mover renglon
	mov dl,31	;mover columna
	call cursor
	call imprimirO

	mov dh,[09+4]	;mover renglon
	mov dl,31	;mover columna
	call cursor
	call imprimirES

	mov dh,[09+5]	;mover renglon
	mov dl,31	;mover columna
	call cursor
	call imprimirO

	mov dh,[09+5]	;mover renglon
	mov dl,31	;mover columna
	call cursor
	call imprimirES

	mov dh,[09+6]	;mover renglon
	mov dl,31	;mover columna
	call cursor
	call imprimirO

	mov dh,[09+6]	;mover renglon
	mov dl,31	;mover columna
	call cursor
	call imprimirES

	mov dh,[09+7]	;mover renglon
	mov dl,31	;mover columna
	call cursor
	call imprimirO

;--------------- BAJAR S ----------------------

	mov dh,09	;mover renglon
	mov dl,32	;mover columna
	call cursor
	call imprimirES	

	mov dh,[09+1]	;mover renglon
	mov dl,32	;mover columna
	call cursor
	call imprimirS
	
	mov dh,[09+1]	;mover renglon
	mov dl,32	;mover columna
	call cursor
	call imprimirES
	
	mov dh,[09+2]	;mover renglon
	mov dl,32	;mover columna
	call cursor
	call imprimirS

	mov dh,[09+2]	;mover renglon
	mov dl,32	;mover columna
	call cursor
	call imprimirES

	mov dh,[09+3]	;mover renglon
	mov dl,32	;mover columna
	call cursor
	call imprimirS

	mov dh,[09+3]	;mover renglon
	mov dl,32	;mover columna
	call cursor
	call imprimirES

	mov dh,[09+4]	;mover renglon
	mov dl,32	;mover columna
	call cursor
	call imprimirS

	mov dh,[09+4]	;mover renglon
	mov dl,32	;mover columna
	call cursor
	call imprimirES

	mov dh,[09+5]	;mover renglon
	mov dl,32	;mover columna
	call cursor
	call imprimirS

	mov dh,[09+5]	;mover renglon
	mov dl,32	;mover columna
	call cursor
	call imprimirES

	mov dh,[09+6]	;mover renglon
	mov dl,32	;mover columna
	call cursor
	call imprimirS

	mov dh,[09+6]	;mover renglon
	mov dl,32	;mover columna
	call cursor
	call imprimirES

	mov dh,[09+7]	;mover renglon
	mov dl,32	;mover columna
	call cursor
	call imprimirS

;--------------- BAJAR SEGUNDA T ---------------

	mov dh,09	;mover renglon
	mov dl,33	;mover columna
	call cursor
	call imprimirES	

	mov dh,[09+1]	;mover renglon
	mov dl,33	;mover columna
	call cursor
	call imprimirT2
	
	mov dh,[09+1]	;mover renglon
	mov dl,33	;mover columna
	call cursor
	call imprimirES
	
	mov dh,[09+2]	;mover renglon
	mov dl,33	;mover columna
	call cursor
	call imprimirT2

	mov dh,[09+2]	;mover renglon
	mov dl,33	;mover columna
	call cursor
	call imprimirES

	mov dh,[09+3]	;mover renglon
	mov dl,33	;mover columna
	call cursor
	call imprimirT2

	mov dh,[09+3]	;mover renglon
	mov dl,33	;mover columna
	call cursor
	call imprimirES

	mov dh,[09+4]	;mover renglon
	mov dl,33	;mover columna
	call cursor
	call imprimirT2

	mov dh,[09+4]	;mover renglon
	mov dl,33	;mover columna
	call cursor
	call imprimirES

	mov dh,[09+5]	;mover renglon
	mov dl,33	;mover columna
	call cursor
	call imprimirT2

	mov dh,[09+5]	;mover renglon
	mov dl,33	;mover columna
	call cursor
	call imprimirES

	mov dh,[09+6]	;mover renglon
	mov dl,33	;mover columna
	call cursor
	call imprimirT2

	mov dh,[09+6]	;mover renglon
	mov dl,33	;mover columna
	call cursor
	call imprimirES

	mov dh,[09+7]	;mover renglon
	mov dl,33	;mover columna
	call cursor
	call imprimirT2

;--------------- BAJAR A --------------------

	mov dh,09	;mover renglon
	mov dl,34	;mover columna
	call cursor
	call imprimirES	

	mov dh,[09+1]	;mover renglon
	mov dl,34	;mover columna
	call cursor
	call imprimirA
	
	mov dh,[09+1]	;mover renglon
	mov dl,34	;mover columna
	call cursor
	call imprimirES
	
	mov dh,[09+2]	;mover renglon
	mov dl,34	;mover columna
	call cursor
	call imprimirA

	mov dh,[09+2]	;mover renglon
	mov dl,34	;mover columna
	call cursor
	call imprimirES

	mov dh,[09+3]	;mover renglon
	mov dl,34	;mover columna
	call cursor
	call imprimirA

	mov dh,[09+3]	;mover renglon
	mov dl,34	;mover columna
	call cursor
	call imprimirES

	mov dh,[09+4]	;mover renglon
	mov dl,34	;mover columna
	call cursor
	call imprimirA

	mov dh,[09+4]	;mover renglon
	mov dl,34	;mover columna
	call cursor
	call imprimirES

	mov dh,[09+5]	;mover renglon
	mov dl,34	;mover columna
	call cursor
	call imprimirA

	mov dh,[09+5]	;mover renglon
	mov dl,34	;mover columna
	call cursor
	call imprimirES

	mov dh,[09+6]	;mover renglon
	mov dl,34	;mover columna
	call cursor
	call imprimirA

	mov dh,[09+6]	;mover renglon
	mov dl,34	;mover columna
	call cursor
	call imprimirES

	mov dh,[09+7]	;mover renglon
	mov dl,34	;mover columna
	call cursor
	call imprimirA

;--------------- BAJAR D ---------------

	mov dh,09	;mover renglon
	mov dl,35	;mover columna
	call cursor
	call imprimirES	

	mov dh,[09+1]	;mover renglon
	mov dl,35	;mover columna
	call cursor
	call imprimirD
	
	mov dh,[09+1]	;mover renglon
	mov dl,35	;mover columna
	call cursor
	call imprimirES
	
	mov dh,[09+2]	;mover renglon
	mov dl,35	;mover columna
	call cursor
	call imprimirD

	mov dh,[09+2]	;mover renglon
	mov dl,35	;mover columna
	call cursor
	call imprimirES

	mov dh,[09+3]	;mover renglon
	mov dl,35	;mover columna
	call cursor
	call imprimirD

	mov dh,[09+3]	;mover renglon
	mov dl,35	;mover columna
	call cursor
	call imprimirES

	mov dh,[09+4]	;mover renglon
	mov dl,35	;mover columna
	call cursor
	call imprimirD

	mov dh,[09+4]	;mover renglon
	mov dl,35	;mover columna
	call cursor
	call imprimirES

	mov dh,[09+5]	;mover renglon
	mov dl,35	;mover columna
	call cursor
	call imprimirD

	mov dh,[09+5]	;mover renglon
	mov dl,35	;mover columna
	call cursor
	call imprimirES

	mov dh,[09+6]	;mover renglon
	mov dl,35	;mover columna
	call cursor
	call imprimirD

	mov dh,[09+6]	;mover renglon
	mov dl,35	;mover columna
	call cursor
	call imprimirES

	mov dh,[09+7]	;mover renglon
	mov dl,35	;mover columna
	call cursor
	call imprimirD

;--------------- BAJAR SEGUNDA O --------------

	mov dh,09	;mover renglon
	mov dl,36	;mover columna
	call cursor
	call imprimirES	

	mov dh,[09+1]	;mover renglon
	mov dl,36	;mover columna
	call cursor
	call imprimirO2
	
	mov dh,[09+1]	;mover renglon
	mov dl,36	;mover columna
	call cursor
	call imprimirES
	
	mov dh,[09+2]	;mover renglon
	mov dl,36	;mover columna
	call cursor
	call imprimirO2

	mov dh,[09+2]	;mover renglon
	mov dl,36	;mover columna
	call cursor
	call imprimirES

	mov dh,[09+3]	;mover renglon
	mov dl,36	;mover columna
	call cursor
	call imprimirO2

	mov dh,[09+3]	;mover renglon
	mov dl,36	;mover columna
	call cursor
	call imprimirES

	mov dh,[09+4]	;mover renglon
	mov dl,36	;mover columna
	call cursor
	call imprimirO2

	mov dh,[09+4]	;mover renglon
	mov dl,36	;mover columna
	call cursor
	call imprimirES

	mov dh,[09+5]	;mover renglon
	mov dl,36	;mover columna
	call cursor
	call imprimirO2

	mov dh,[09+5]	;mover renglon
	mov dl,36	;mover columna
	call cursor
	call imprimirES

	mov dh,[09+6]	;mover renglon
	mov dl,36	;mover columna
	call cursor
	call imprimirO2

	mov dh,[09+6]	;mover renglon
	mov dl,36	;mover columna
	call cursor
	call imprimirES

	mov dh,[09+7]	;mover renglon
	mov dl,36	;mover columna
	call cursor
	call imprimirO2

;-----------------------------------------------

salto200:	mov ah,0
	int 16h
	cmp al,13	;comparar si es enter para cerrar
	je fin
	jne salto200

fin:	mov ax,4c00h 	;fin del programa
	int 21h
empezar endp

;------------------- METODOS --------------------

cursor proc near
	mov ah,02
	mov bh,0
	int 10h
	ret
cursor endp

;-------------------------------------------
imprimirES proc near
	mov bl,1	;impresion de nombre
	lea si,espacio
	mov ah,02
salto2001:	mov dl,[si]
	int 21h
	inc si
	mov cx,3FFFh
salto201:	mov di,9fffh
	add di,6000h
salto202:	dec di
	cmp di,0
	jne salto202
	loop salto201	
	dec bl
	cmp bl,0
	jne salto2001	;fin de impresion
	ret
imprimirES endp

;-------------------------------------------
imprimirT proc near
	mov bl,1	;impresion de nombre
	lea si,nombre
	mov ah,02
salto3:	mov dl,[si]
	int 21h
	inc si
	mov cx,3FFFh
salto4:	mov di,9fffh
	add di,6000h
salto5:	dec di
	cmp di,0
	jne salto5
	loop salto4	
	dec bl
	cmp bl,0
	jne salto3	;fin de impresion
	ret
imprimirT endp

;------------------------------------------
imprimirO proc near

	mov bl,1	;impresion de nombre
	lea si,[nombre+1]
	mov ah,02
salto6:	mov dl,[si]
	int 21h
	inc si
	mov cx,3FFFh
salto7:	mov di,9fffh
	add di,6000h
salto8:	dec di
	cmp di,0
	jne salto8
	loop salto7	
	dec bl
	cmp bl,0
	jne salto6	;fin de impresion
	ret
imprimirO endp

;---------------------------------------------
imprimirS proc near

	mov bl,1	;impresion de nombre
	lea si,[nombre+2]
	mov ah,02
salto9:	mov dl,[si]
	int 21h
	inc si
	mov cx,3FFFh
salto10:	mov di,9fffh
	add di,6000h
salto11:	dec di
	cmp di,0
	jne salto11
	loop salto10	
	dec bl
	cmp bl,0
	jne salto9	;fin de impresion
	ret
imprimirS endp

;---------------------------------------------
imprimirT2 proc near

	mov bl,1	;impresion de nombre
	lea si,[nombre+3]
	mov ah,02
salto12:	mov dl,[si]
	int 21h
	inc si
	mov cx,3FFFh
salto13:	mov di,9fffh
	add di,6000h
salto14:	dec di
	cmp di,0
	jne salto5
	loop salto13	
	dec bl
	cmp bl,0
	jne salto12	;fin de impresion
	ret
imprimirt2 endp

;--------------------------------------------
imprimirA proc near

	mov bl,1	;impresion de nombre
	lea si,[nombre+4]
	mov ah,02
salto15:	mov dl,[si]
	int 21h
	inc si
	mov cx,3FFFh
salto16:	mov di,9fffh
	add di,6000h
salto17:	dec di
	cmp di,0
	jne salto17
	loop salto16	
	dec bl
	cmp bl,0
	jne salto15	;fin de impresion
	ret
imprimirA endp

;-------------------------------------------
imprimirD proc near

	mov bl,1	;impresion de nombre
	lea si,[nombre+5]
	mov ah,02
salto18:	mov dl,[si]
	int 21h
	inc si
	mov cx,3FFFh
salto19:	mov di,9fffh
	add di,6000h
salto20:	dec di
	cmp di,0
	jne salto20
	loop salto19	
	dec bl
	cmp bl,0
	jne salto18	;fin de impresion
	ret
imprimirD endp

;--------------------------------------------
imprimirO2 proc near

	mov bl,1	;impresion de nombre
	lea si,[nombre+6]
	mov ah,02
salto21:	mov dl,[si]
	int 21h
	inc si
	mov cx,3FFFh
salto22:	mov di,9fffh
	add di,6000h
salto23:	dec di
	cmp di,0
	jne salto23
	loop salto22	
	dec bl
	cmp bl,0
	jne salto21	;fin de impresion
	ret
imprimirO2 endp

;------------- FIN DE PROGRAMA -----------------
end empezar






