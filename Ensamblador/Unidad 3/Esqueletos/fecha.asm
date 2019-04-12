


.model small
.stack 64
.data
;----------------------------------------------------------
;------------------dias-------------
dom db "Domingo, ","$"
lun db "Lunes, ","$"
mar db "Martes, ","$"
mie db "Miercoles, ","$"
jue db "Jueves, ","$"
vie db "Viernes, ","$"
sab db "Sabado, ","$"
;-------------------meses-----------
ene db "Enero ","$"
feb db "Febrero ","$"
ma db "Marzo ","$"
abr db "Abril ","$"
may db "Mayo ","$"
jun db "Junio ","$"
jul db "Julio ","$"
ago db "Agosto ","$"
sep db "Septiembre ","$"
oct db "Octubre ","$"
nov db "Noviembre ","$"
dic db "Diciembre ","$"
;-----------------Año---------------
year dw ? 
;----------------------------------------------------------

.code
empezar proc far
	
	mov ax,@data
	mov ds,ax
	mov es,ax
	
	mov ah,2ah
	int 21h
	mov bx,dx
	mov year,cx
	
	mov bh,30h
	call color
	
	call Dia
	call Mes
	call Ano
	
	mov ah,02h
	mov dl,0dh
	int 21h
	mov ah,02h
	mov dl,0ah	
	int 21h

	mov ah,2ch
	int 21h
	call hora

	mov ax,4c00h 	;fin del programa
	int 21h

empezar endp

;****************Procedimientos**************
;-------------DIA-------------------------
Dia proc near 
	cmp al,0
	je domingo
	cmp al,1
	je lunes
	cmp al,2
	je martes
	cmp al,3
	je miercoles
	cmp al,4
	je jueves
	cmp al,5
	je viernes 
	cmp al,6
	je sabado
domingo: lea dx,dom
	call Imprimir
	jmp siguiente
lunes:	lea dx,lun
	call Imprimir
	jmp siguiente
martes:	lea dx,mar
	call Imprimir
	jmp siguiente
miercoles: lea dx,mie
	call Imprimir
	jmp siguiente
jueves:lea dx,jue
	call Imprimir
	jmp siguiente	
viernes:lea dx,vie
	call Imprimir
	jmp siguiente	
sabado:lea dx,sab
	call Imprimir
	jmp siguiente
siguiente:mov dh,ah
	call imprimirDia
	ret
Dia endp
;------------Imprimir---------------
Imprimir proc near
	mov ah,09
	int 21h
	ret
Imprimir endp
;-------------Imprimir dia del mes------------------
imprimirDia proc near
	sub ax,ax	;Resta entre si mismos
	mov dx,bx
	mov al,bl
	mov bx,0ah
	div bl
	or ax,3030h
	mov bx,dx
	mov dx,ax
	mov ah,02h
	int 21h
	xchg dh,dl	;intercambar valores
	mov ah,02h
	int 21h
	mov dl,32
	mov ah,02h
	int 21h
	ret
imprimirDia endp
;---------------MES----------------------
Mes proc near 
	sub ax,ax
	mov al,bh 
	cmp al,1
	je enero
	cmp al,2
	je febrero
	cmp al,3
	je marzo
	cmp al,4
	je abril
	cmp al,5
	je mayo
	cmp al,6
	je juni
	cmp al,7
	je juli
	cmp al,8
	je Agos
	cmp al,9h
	je septi
	cmp al,Ah
	je octu
	cmp al,Bh
	je novi
	cmp al,Ch
	jE dici
	jne año
enero:	lea dx,ene
	call Imprimir
	jmp año
febrero:lea dx,feb
	call Imprimir
	jmp año
marzo: lea dx,ma
	call Imprimir
	jmp año
abril:	lea dx,abr
	call Imprimir
	jmp año
mayo: 	lea dx,may
	call Imprimir
	jmp año
juni:	lea dx,jun
	call Imprimir
	jmp año
juli:	lea dx,jul
	call Imprimir
	jmp año
Agos:	lea dx,ago
	call Imprimir
	jmp año
septi:  lea dx,sep
	call Imprimir
	jmp año
octu:  	lea dx,oct
	call Imprimir
	jmp año
novi:	lea dx,nov
	call Imprimir
	jmp año
dici:	lea dx,dic
	call Imprimir
	jmp año
año:	sub ax,ax
	sub dx,dx
	ret
Mes endp

;--------------------AÑO----------------------
Ano proc near 
	sub ax,ax
	sub bx,bx
	sub dx,dx

	mov ax,year
	mov bx,0ah
	div bx
	or dx,3030h
	push dx
	sub dx,dx
	div bx
	or dx,3030h
	push dx
	sub dx,dx
	div bx
	or dx,3030h
	push dx
	or ax,3030h
	push ax
	pop dx
	mov ah,02h
	int 21h
	pop dx
	mov ah,02h
	int 21h
	pop dx
	mov ah,02h
	int 21h
	pop dx
	mov ah,02h
	int 21h
	mov dl,32
	mov ah,02h
	int 21h
	ret
Ano endp
hora proc near 
	mov bx,dx
	sub ax,ax	;Resta entre si mismos
	mov dx,bx
	mov al,ch
	mov bx,0ah
	div bl
	or ax,3030h
	mov bx,dx
	mov dx,ax
	mov ah,02h
	int 21h
	xchg dh,dl	;intercambar valores
	mov ah,02h
	int 21h

	mov dl,58
	mov ah,02h
	int 21h

	sub ax,ax	;Resta entre si mismos
	mov dx,bx
	mov al,cl
	mov bx,0ah
	div bl
	or ax,3030h
	mov bx,dx
	mov dx,ax
	mov ah,02h
	int 21h
	xchg dh,dl	;intercambar valores
	mov ah,02h
	int 21h

	mov dl,58
	mov ah,02h
	int 21h

	sub ax,ax	;Resta entre si mismos
	mov dx,bx
	mov al,dh
	mov bx,0ah
	div bl
	or ax,3030h
	mov bx,dx
	mov dx,ax
	mov ah,02h
	int 21h
	xchg dh,dl	;intercambar valores
	mov ah,02h
	int 21h

	mov dl,58
	mov ah,02h
	int 21h

	sub ax,ax	;Resta entre si mismos
	mov dx,bx
	mov al,dl
	mov bx,0ah
	div bl
	or ax,3030h
	mov bx,dx
	mov dx,ax
	mov ah,02h
	int 21h
	xchg dh,dl	;intercambar valores
	mov ah,02h
	int 21h
	ret 
hora endp 
Color proc near
	mov ax,0600h
	mov cx,0
	mov dx,184fh
	int 10h
	ret
Color endp

end empezar

;-----mov ah,2a y int 21	fecha
;-----mov ah,2c y int 21	horario
:-----mov ah,2b y int 21	fecha
;--------FECHA-----
;al=Dia de la semana
;cx=año
;dh=mes
;dl=dia del mes
;--------HORA------58 dos puntos
;ch = hora
;cl=minutos
;dh=segundos
;dl=Milisegundos