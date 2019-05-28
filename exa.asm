;--------------------------------------------------------------------
; DESCRIPCIÒN
;--------------------------------------------------------------------
;
;
;--------------------------- MACROS ---------------------------------
division macro dividendo, divisor, resultado 
		mov ax,dividendo
		mov bx,divisor
		sub cx,cx

salto2:		cmp ax,bx
		jb fin
		sub ax,bx
		inc cx
		jmp salto2
fin:		mov resultado,cx
endm


multiplicar macro cantidad
		mov cl,2
		lea si,cantidad+1
		lea bx,minDiarios+2
		mov dh,9
		mov dl,0	
saltoM:		mov al,[si]
		and al,0fh
		and dh,0fh
		mul dh
		aam
		add al,dl
		aaa
		mov [bx],al
		mov dl,ah
		dec si
		dec bx
		loop saltoM
		mov [bx],ah
endm

;------------------------ FIN DE MACROS -----------------------------


.Model small
.Stack 64
.Data

;----------------------- LETREROS Y VARIABLES -----------------------

nombre db "Jessica",0dh,0ah,"Ramirez"
cant dw 00,"$"

;-------------------- FIN DE LETREROS Y VARIABLES -------------------
;----------------------- INICIALIZAR CÒDIGO -------------------------
.Code

inicio proc far
		mov ax,@data	;alineacion segmento datos
		mov es,ax
		mov ds,ax

		mov cl,10
		lea si,nombre
		mov ah,02
salto1: 	mov dl,[si]
		int 21h			;h
		inc si
		loop salto1

		lea dx,nombre
		mov ah,09
		int 21h
		;call imprimir

		mov dl,0ah
		call imprimir
		mov dl,0dh
		call imprimir

		mov ax,4c00h		;fin de programa
		int 21h
inicio endp
;------------------------ FIN DE CÒDIGO -----------------------------
;------------------------- PROCEDIMIENTOS ---------------------------
imprimir proc near
		mov ah,02
		int 21h
		ret
imprimir endp

imprimirSalto proc near
		mov ah,02
		int 21h
		mov dl,0ah
		int 21h
		mov ah,02
		mov dl,0dh
		int 21h
		ret
imprimirSalto endp

captura proc near
		mov cl,2
		lea si,cant
saltoC:		mov ah,0
		int 16h	
		mov [si],al
		mov ah,02
		mov dl,al
		call imprimir
		inc si
		loop saltoC
		ret
captura endp


resta proc near
	call saltar
	call letrerito

	mov cl, 3	;captura num1
	lea si, num1
an5:	mov ah, 0
	int 16h
	mov [si], al
	mov ah, 02
	mov dl, al
	int 21h
	inc si
	loop an5
	
	call saltar
	call letrerito
	
	mov cl, 3	;captura num2
	lea si, num2
an6:	mov ah, 0
	int 16h
	mov [si], al
	mov ah, 02
	mov dl, al
	int 21h
	inc si
	loop an6

	mov ah,02h
	mov dl,0ah
	int 21h
	mov ah,02h
	mov dl,0dh
	int 21h

;----- COMIENZA IMPRESION DE RESULTADO---
	mov ah,09
	lea dx,num1
	int 21h

	mov ah,09
	lea dx,men3
	int 21h

	mov ah,09
	lea dx,num2
	int 21h

	mov ah,09
	lea dx,men2
	int 21h

	lea si,num1+2	;hacer la resta
	lea di,num2+2
	lea bx,total+3
	mov cl,3
an7:	mov al,[si]
	mov dl,[di]
	mov ah,0
	sbb al,dl
	aaa
	mov [bx],al
	mov dh,ah
	dec si
	dec di
	dec bx
	loop an7
	mov [bx],dh
	
	lea si,total
	mov ah,02
	mov cl,4
an8:	mov dl,[si]
	or dl,30h
	int 21h
	inc si
	loop an8
	ret
resta endp


suma proc near
	call saltar
	call letrerito

	mov cl, 3	;captura num1
	lea si, num1
an1:	mov ah, 0
	int 16h
	mov [si], al
	mov ah, 02
	mov dl, al
	int 21h
	inc si
	loop an1
	
	call saltar
	call letrerito
	
	mov cl, 3	;captura num2
	lea si, num2
an2:	mov ah, 0
	int 16h
	mov [si], al
	mov ah, 02
	mov dl, al
	int 21h
	inc si
	loop an2

	mov ah,02h
	mov dl,0ah
	int 21h
	mov ah,02h
	mov dl,0dh
	int 21h

;----- COMIENZA IMPRESION DE RESULTADO---
	mov ah,09
	lea dx,num1
	int 21h

	mov ah,09
	lea dx,men1
	int 21h

	mov ah,09
	lea dx,num2
	int 21h

	mov ah,09
	lea dx,men2
	int 21h

	lea si,num1+2	;hacer la suma
	lea di,num2+2
	lea bx,total+3
	mov cl,3
an3:	mov al,[si]
	mov dl,[di]
	mov ah,0
	adc al,dl
	aaa
	mov [bx],al
	mov dh,ah
	dec si
	dec di
	dec bx
	loop an3
	mov [bx],dh
	
	lea si,total
	mov ah,02
	mov cl,4
an4:	mov dl,[si]
	or dl,30h
	int 21h
	inc si
	loop an4
	ret
suma endp

;----------------------- FIN DE PROCEDIMIENTOS ----------------------
end inicio
;--------------------------- FIN DE PROGRAMA ------------------------

; masm program.asm;
; link program;
; program