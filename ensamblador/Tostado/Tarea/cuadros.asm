.MODEL SMALL 
.STACK 64
.DATA


;------------LETREROS Y VARIABLES ---------------

n1 db "1"

;------------ INICIO DE PROGRAMA ----------------
.CODE 
MAIN PROC FAR 
       MOV AX,@DATA 
       MOV DS,AX
	mov es,ax
	   
	   
	call imprimir1	   

	call imprimir2
	   
	call imprimir3
         
	call imprimir4

	call imprimir5
	   
	call imprimir6

	call imprimir7
        
	call imprimir8

	call imprimir9

	   ;PAUSA
	   MOV AH, 07H
	   INT 21H


salto200:	mov ah,0
	int 16h
	cmp al,13	;comparar si es enter para cerrar
	je fin
	jne salto200

fin:	mov ax,4c00h 	;fin del programa
	int 21h
MAIN   ENDP

;------------- METODOS -------------------------

imprimir1 proc near

	MOV AH,06H ;LIMPIEZA 1
	MOV AL,00H
	MOV BH,44H ;COLOR ROJO
	MOV CX,0000H ;PUNTO DE INICIO
	MOV DX,071bH ;PUNTO DE FINAL
	INT 10H

	mov bl,1	;impresion de nombre
	lea si,n1
	mov ah,02
salto1:	mov dl,[si]
	int 21h
	inc si
	mov cx,3FFFh
salto2:	mov di,9fffh
	add di,6000h
salto3:	dec di
	cmp di,0
	jne salto3
	loop salto2	
	dec bl
	cmp bl,0
	jne salto1	;fin de impresion
	ret
imprimir1 endp

;------------------------------------------------
imprimir2 proc near

	MOV AH,06H ;LIMPIEZA 2 
	MOV AL,00H
	MOV BH,99h ;COLOR NARANJA
	MOV CX,0800H ;PUNTO DE INICIO
	MOV DX,111bH ;PUNTO DEL FINAL
	INT 10H

	mov bl,1	;impresion de nombre
	lea si,n1
	mov ah,02
salto4:	mov dl,[si]
	int 21h
	inc si
	mov cx,3FFFh
salto5:	mov di,9fffh
	add di,6000h
salto6:	dec di
	cmp di,0
	jne salto6
	loop salto5	
	dec bl
	cmp bl,0
	jne salto4	;fin de impresion
	ret
imprimir2 endp

;-----------------------------------------------
imprimir3 proc near

	MOV AH,06H ;LIMPIEZA 3
	MOV AL,00H
	MOV BH,100D ;COLOR Azul
	MOV CX,1100H ;PUNTO DE INICIO
	MOV DX,241bH ;PUNTO DEL FINAL
	INT 10H

	mov bl,1	;impresion de nombre
	lea si,n1
	mov ah,02
salto7:	mov dl,[si]
	int 21h
	inc si
	mov cx,3FFFh
salto8:	mov di,9fffh
	add di,6000h
salto9:	dec di
	cmp di,0
	jne salto9
	loop salto8	
	dec bl
	cmp bl,0
	jne salto7	;fin de impresion
	ret
imprimir3 endp

;----------------------------------------------
imprimir4 proc near

	MOV AH,06H ;LIMPIEZA 4
	MOV AL,00H
	MOV BH,22h ;COLOR verde 
	MOV CX,001cH ;PUNTO DE INICIO
	MOV DX,0736H ;PUNTO DEL FINAL
	INT 10H

	mov bl,1	;impresion de nombre
	lea si,n1
	mov ah,02
salto10:	mov dl,[si]
	int 21h
	inc si
	mov cx,3FFFh
salto11:	mov di,9fffh
	add di,6000h
salto12:	dec di
	cmp di,0
	jne salto12
	loop salto11	
	dec bl
	cmp bl,0
	jne salto10	;fin de impresion
	ret
imprimir4 endp

;--------------------------------------------
imprimir5 proc near

	MOV AH,06H ;LIMPIEZA 5
	MOV AL,00H
	MOV BH,30h ;COLOR aqua
	MOV CX,081cH ;PUNTO DE INICIO
	MOV DX,1036H ;PUNTO DEL FINAL
	INT 10H

	mov bl,1	;impresion de nombre
	lea si,n1
	mov ah,02
salto13:	mov dl,[si]
	int 21h
	inc si
	mov cx,3FFFh
salto14:	mov di,9fffh
	add di,6000h
salto15:	dec di
	cmp di,0
	jne salto15
	loop salto14	
	dec bl
	cmp bl,0
	jne salto13	;fin de impresion
	ret
imprimir5 endp

;----------------------------------------------
imprimir6 proc near

	MOV AH,06H ;LIMPIEZA 6
	MOV AL,00H
	MOV BH,50H ;COLOR morado
	MOV CX,111cH ;PUNTO DE INICIO
	MOV DX,2436H ;PUNTO DEL FINAL
	INT 10H

	mov bl,1	;impresion de nombre
	lea si,n1
	mov ah,02
salto16:	mov dl,[si]
	int 21h
	inc si
	mov cx,3FFFh
salto17:	mov di,9fffh
	add di,6000h
salto18:	dec di
	cmp di,0
	jne salto18
	loop salto17	
	dec bl
	cmp bl,0
	jne salto16	;fin de impresion
	ret
imprimir6 endp

;----------------------------------------------
imprimir7 proc near

	MOV AH,06H ;LIMPIEZA 7
	MOV AL,00H
	MOV BH,10h ;COLOR cafe
	MOV CX,0037H ;PUNTO DE INICIO
	MOV DX,0751H ;PUNTO DEL FINAL
	INT 10H

	mov bl,1	;impresion de nombre
	lea si,n1
	mov ah,02
salto19:	mov dl,[si]
	int 21h
	inc si
	mov cx,3FFFh
salto20:	mov di,9fffh
	add di,6000h
salto21:	dec di
	cmp di,0
	jne salto21
	loop salto20	
	dec bl
	cmp bl,0
	jne salto19	;fin de impresion
	ret
imprimir7 endp

;-----------------------------------------------
imprimir8 proc near

	MOV AH,06H ;LIMPIEZA 8
	MOV AL,00H
	MOV BH,70h ;COLOR blanco
	MOV CX,0837H ;PUNTO DE INICIO
	MOV DX,1051H ;PUNTO DEL FINAL
	INT 10H

	mov bl,1	;impresion de nombre
	lea si,n1
	mov ah,02
salto22:	mov dl,[si]
	int 21h
	inc si
	mov cx,3FFFh
salto23:	mov di,9fffh
	add di,6000h
salto24:	dec di
	cmp di,0
	jne salto24
	loop salto23	
	dec bl
	cmp bl,0
	jne salto22	;fin de impresion
	ret
imprimir8 endp

;----------------------------------------------
imprimir9 proc near

	MOV AH,06H ;LIMPIEZA 9
	MOV AL,00H
	MOV BH,80h ;COLOR gris
	MOV CX,1137H ;PUNTO DE INICIO
	MOV DX,2451H ;PUNTO DEL FINAL
	INT 10H

	mov bl,1	;impresion de nombre
	lea si,n1
	mov ah,02
salto25:	mov dl,[si]
	int 21h
	inc si
	mov cx,3FFFh
salto26:	mov di,9fffh
	add di,6000h
salto27:	dec di
	cmp di,0
	jne salto27
	loop salto26	
	dec bl
	cmp bl,0
	jne salto25	;fin de impresion
	ret
imprimir9 endp

;------------ FIN DE PROGRAMA ------------------
end main	   