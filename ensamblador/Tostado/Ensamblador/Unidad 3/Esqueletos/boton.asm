.model small
.stack 64
.data
;----------------------------------------------
nombre db "Nombre","$"
apellido1 db "Apellido Materno","$"
apellido db "Apellido Paterno","$"
nom db "Julio",0dh,0ah,"$"
app db "Villegas",0dh,0ah,"$"
apm db "Ayala",0dh,0ah,"$"
;---------------------------------------------

.code
empezar proc far
	
	mov ax,@data
	mov ds,ax
	mov es,ax

	mov bh,30h
	call Color
;***********Imprimir nombre
	mov dh,12h
	mov dl,10h
	call cursor
	lea dx,nombre
	call llamarImprimir
	lea bp,nombre
	mov dl,10h
	mov cx,6
	call colorLetra

;***************Imrpimir app con color
	lea bp,apellido
	mov dl,18h
	mov cx,16
	call colorLetra

;***************Imprimir apm con color
	
	lea bp,apellido1
	mov dl,2ah
	mov cx,16
	call colorLetra
;**************Salto de linea
	mov dl,0dh
	call imprimir
	mov dl,10h
	call imprimir
;*************Activar raton
	call Activarmouse
	call botonPres

terP:	mov ax,4c00h 	;fin del programa
	int 21h
empezar endp
colorLetra proc near
	mov ah,19
	mov dh,12h
	mov al,1
	mov bl,70h
	int 10h
	ret
colorLetra endp
colorLetra1 proc near
	mov ah,19
	mov dh,13h
	mov al,1
	mov bl,74h
	int 10h
	ret
colorLetra1 endp
cursor proc near
	mov ah,02
	mov bh,0
	int 10h
	ret
cursor endp
imprimir proc near
	mov ah,02
	int 21h
	ret
imprimir endp
llamarImprimir proc near
	mov ah,09
	int 21h
	ret
llamarImprimir endp
Color proc near
	mov ax,0600h
	mov cx,0
	mov dx,184fh
	int 10h
	ret
Color endp
Activarmouse proc near 
	mov ax,0000h
	int 33h
	cmp ax,00
	je terP
	mov ax,01h
	int 33h
	ret 
Activarmouse endp
botonPres proc near
fin1:	sub ax,ax
	sub dx,dx
	sub cx,cx
	mov ax,3
	int 33h
	cmp bx,1
	je izq1
	cmp bx,2
	je der1
	cmp bx,4
	je fin2
	jmp fin1

izq1: 	sar cx,1
	sar cx,1
	sar cx,1
	sar dx,1
	sar dx,1
	sar dx,1

;*******Comparar si el click es en nombre

	cmp dx,00010010b
	je s
	jne fin1
s:	cmp cx,00010000b
	jge s1
	jbe fin1
s1:	cmp cx,00010110b
	jle nomb
	jg ssx
nomb:	lea bp,nom
	mov dl,10h
	mov cx,5
	call colorLetra1
	jmp fin1
;********Comparar si el click es en apellido P

ssx:	cmp cx,00011000b
	jge ss1
	jbe fin1
ss1:	cmp cx,00101000b
	jle apel
	jg sss
apel:	lea bp,app
	mov dl,18h
	mov cx,8
	call colorLetra1
	jmp fin1	
;********Comparar si el click es en apellido P

sss:	cmp cx,00101010b
	jge sss1
	jbe fin1
sss1:	cmp cx,00111010b
	jle apel1
	jg fin1
apel1:	lea bp,apm
	mov dl,2ah
	mov cx,5
	call colorLetra1
	jmp fin1
der1:	
	jmp fin2
fin2:	
	ret
botonPres endp
end empezar