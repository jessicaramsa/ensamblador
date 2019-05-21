;----------------------------------------------------------
; Menù de opciones que desplegarà la captura de datos para
; realizar las operaciones aritmèticas: suma, resta y
; multiplicaciòn
;----------------------------------------------------------

.model small
.stack 64
.data

;----------------- VARIABLES ------------------------------

color db "0"
c2 db "0"
c3 db "0"

suma1 db "Suma",0dh,0ah,"$"
resta1 db "Resta",0dh,0ah,"$"
mult1 db "Multiplicacion",0dh,0ah,"$"

op1 db "000","$"
op2 db "000","$"
result db "0000","$"


op11 db "000","$"
op22 db "000","$"
result1 db "0000","$"


numero1 db "0000","$"
numero2 db "00","$"
res1 db "000000","$"
resu2 db "000000","$"
res3 db "000000","$"
res2 db "00","$"


msj1 db "Primer dato: ","$"
msj2 db "Segundo dato:","$"
total db "Resultado: ","$"
total1 db "Resultado 1: ","$"
total2 db "Resultado 2: ","$"

espacio db 0ah,0dh, "$"

;---------------------- Inicio ----------------------------
.code

inicio proc far
	
	mov ax,@data
	mov ds,ax
	mov es,ax

	call boton1


	mov ax,4c00h 	;fin del programa
	int 21h
inicio endp

;---------------------- METODOS ---------------------------
color2 proc near
	 mov ah,0ch
	mov al,01h ;azul
	int 10h	
	ret
color2 endp

color3 proc near
	mov ah,0ch
	mov al,02h ;verda
	int 10h
	ret
color3 endp

color4 proc near
	mov ah,0ch
	mov al,01h ;verda
	int 10h
	ret
color4 endp

;--------------------------------------
;Cambio de linea
imprimir proc near
	mov ah,02
	int 21h
	ret
imprimir endp

;--------------------------------------
Capturar proc near
	mov ah,09h
	int 21h
	mov cl,4
sa1:	mov ah,0
	int 16h
	mov [si],al
	mov ah,02
	mov dl,al
	int 21h
	inc si
	loop sa1
	lea dx,espacio
	mov ah,09h
	int 21h
	ret
Capturar endp

Capturar2 proc near
	mov ah,09h
	int 21h
	mov cl,2
s200:	mov ah,0
	int 16h
	mov [si],al
	mov ah,02
	mov dl,al
	int 21h
	inc si
	loop s200
	lea dx,espacio
	mov ah,09h
	int 21h
	ret
Capturar2 endp
;--------------------------------------
llamarImprimir proc near
	mov ah,09
	int 21h
	ret
llamarImprimir endp

;--------------------------------------
imprimirOperacion proc near
	
	or dl,30h
	mov ah,02
	int 21h
	ret
imprimirOperacion endp

cursor proc near
	mov ah,02
	mov bh,0
	int 10h
	ret
cursor endp

introducir proc near
	mov ah,0
	int 16h
	ret
introducir endp

;--------------------------------------
boton1 proc near

	mov ax,0012h ;modo grafico
	int 10h
	
	mov bh,0
	mov cx,100	;BOTON 1
	mov dx,50
	
g:	inc cx
	cmp color,1
	je n
	jmp n1
n: 	call color3
	jmp n2
n1:	call color2
n2:	cmp cx,150
	je g1
	jmp g

g1:	inc dx
	mov cx,100
	cmp dx,100
	je b2
	jmp g		;FIN DE BOTON 1


b2:	mov cx,151	;BOTON 2
	mov dx,50
	
ga:	inc cx
	cmp color,1
	je na
	jmp n1a
na: 	call color3
	jmp n2a
n1a:	call color3
n2a:	cmp cx,200
	je g1a
	jmp ga

g1a:	inc dx
	mov cx,151
	cmp dx,100
	je b3
	jmp ga		;FIN DE BOTON 2

b3:	mov cx,201	;BOTON 3
	mov dx,50
	
ga3:	inc cx
	cmp color,1
	je na3
	jmp n1a3
na3: 	call color4
	jmp n2a3
n1a3:	call color4
n2a3:	cmp cx,250
	je g1a3
	jmp ga3

g1a3:	inc dx
	mov cx,201
	cmp dx,100
	je mouse
	jmp ga3		;FIN DE BOTON 3


mouse:	mov ax,0	;activa/desactiva mouse
	int 33h
	mov ax,1	;ver puntero
	int 33h
	mov ax,4	;fija posicion
	mov cx,100
	mov dx,100
	int 33h
	mov ax,5	;lee la informacion
	int 33h


validar: mov ax,3	;validar boton 1
	 int 33h
	 cmp dx, 50
	 jge s
s: 	 cmp dx,100
	 jle s1
	 jmp validar
s1:	 cmp cx,100
	 jge s2
s2:	 cmp cx,150
	 jle s3
	 jnle sb2
sb2:	 cmp cx, 151
	 jge sa3
sa3: 	 cmp cx,200
	 jle s3a
	 jnle s1a3
s1a3:	 cmp cx, 250
	 jge sa
sa: 	 cmp cx,300
	 jle s3a3
	 jmp validar
s3:	 cmp bx,1	;click izq
	 
	 je ju
	 jmp validar
ju: call operacionSuma	;FIN VALIDAR BOTON 1

;--------------------------------------
s3a:	 cmp bx,1	;click izq
	 
	 je jua
	 jmp validar
jua: call operacionResta	;FIN VALIDAR BOTON

;--------------------------------------
s3a3:	 cmp bx,1	;click izq
	 je jua3
	 jmp validar
jua3: call operacionMult	;FIN VALIDAR BOTON


;--------------------------------------
mov ah,0	;EXIT
int 16h
mov ah,0h
mov al,3
int 10h
	ret
boton1 endp

;--------------- SUMA -----------------
operacionSuma proc near
	mov dh,13
	mov dl,25
	call cursor
	
	lea dx,suma1
	call llamarImprimir
	mov dl,0dh
	call imprimir
	mov dl,10
	call imprimir
	

	mov dh,16
	mov dl,25
	call cursor

	lea dx,msj1
	call llamarImprimir
	mov dl,0dh
	call imprimir
	mov dl,10
	call imprimir

	mov dh,16
	mov dl,40
	call cursor
	mov cl,3
	lea si,op1
salto2:	call introducir
	mov [si],al
	mov dl,al
	call imprimir

	inc si
	loop salto2

	mov dl,0dh
	call imprimir
	mov dl,10
	call imprimir


	mov dh,17
	mov dl,25
	call cursor
	
	lea dx,msj2
	call llamarImprimir
	mov dl,0dh
	call imprimir
	mov dl,10
	call imprimir

	
	mov dh,17
	mov dl,40
	call cursor
	mov cl,3
	lea si,op2
salto3:	call introducir
	mov [si],al
	mov dl,al
	call imprimir

	inc si
	loop salto3

	mov dl,0dh
	call imprimir
	mov dl,10
	call imprimir

        mov dx,0
	mov ax,0
	mov cl,3
	lea si,op1+2	;Primer operando
	lea di,op2+2	;segudo operando
	lea bx,result+3	;Reservo de memoria
salto4:	mov al,[si]	;salto 2
	mov dl,[di]
	adc al,dl
	mov ah,0
	aaa 		;Ajuste ASCII
	mov [bx],al
	dec si
	dec di
	dec bx
	loop salto4		;salto 2
	mov [bx],ah
	
	mov dh,18
	mov dl,25
	call cursor

	lea dx,total
	call llamarImprimir
	mov dl,0dh
	call imprimir
	mov dl,10
	call imprimir

	mov dh,18
	mov dl,39
	call cursor
	mov cl,4
        lea si,result
xx:	mov dl,[si]        
	call imprimirOperacion
	inc si 
	loop xx

	ret
operacionSuma endp

;---------------- RESTA ---------------
operacionResta proc near
	mov dh,13
	mov dl,25
	call cursor

	lea dx,resta1
	call llamarImprimir
	mov dl,0dh
	call imprimir
	mov dl,10
	call imprimir


	mov dh,16
	mov dl,25
	call cursor

	lea dx,msj1
	call llamarImprimir
	mov dl,0dh
	call imprimir
	mov dl,10
	call imprimir

	mov dh,16
	mov dl,40
	call cursor
	mov cl,3
	lea si,op11
salto22:	call introducir
	mov [si],al
	mov dl,al
	call imprimir

	inc si
	loop salto22

	mov dl,0dh
	call imprimir
	mov dl,10
	call imprimir


	mov dh,17
	mov dl,25
	call cursor

	lea dx,msj2
	call llamarImprimir
	mov dl,0dh
	call imprimir
	mov dl,10
	call imprimir


	mov dh,17
	mov dl,40
	call cursor
	mov cl,3
	lea si,op22
salto33:	call introducir
	mov [si],al
	mov dl,al
	call imprimir

	inc si
	loop salto33

	mov dl,0dh
	call imprimir
	mov dl,10
	call imprimir

        mov dx,0
	mov ax,0
	mov cl,3
	lea si,op11+2	;Primer operando
	lea di,op22+2	;segudo operando
	lea bx,result1+3	;Reservo de memoria
salto44:	mov al,[si]	;salto 2
	mov dl,[di]
	sbb al,dl
	mov ah,0
	aas 		;Ajuste ASCII
	mov [bx],al
	dec si
	dec di
	dec bx
	loop salto44		;salto 2
	mov [bx],ah


	mov dh,18
	mov dl,25
	call cursor

	lea dx,total
	call llamarImprimir
	mov dl,0dh
	call imprimir
	mov dl,10
	call imprimir

	mov dh,18
	mov dl,39
	call cursor
	mov cl,4
        lea si,result1
xxx:	mov dl,[si]        
	call imprimirOperacion
	inc si 
	loop xxx
	ret
operacionResta endp

;------------ MULTIPLICACION ----------
operacionMult proc near
	mov dh,13
	mov dl,25
	call cursor

	lea dx,mult1
	call llamarImprimir
	mov dl,0dh
	call imprimir
	mov dl,10
	call imprimir
	
	mov dh,16
	mov dl,25
	call cursor

	lea si,numero1	;captura del primer numero
	lea dx,msj1
	call Capturar


	mov dh,17
	mov dl,25
	call cursor

	lea si,numero2	;captura del segundo numero
	lea dx,msj2
	call Capturar2

        mov dx,0
	mov ax,0

	mov cl,4
	mov dh,00
	lea si,numero1+3
	lea di,numero2+1
	lea bx,res1+5
saltoM:	mov al,[si]	;salto 1
	mov dl,[di]
	and al,0fh
	and dl,0fh
	mul dl
	aam
	add al,dh
	aaa
	mov [bx],al
	mov dh,ah
	dec si
	dec bx
	loop saltoM
	mov [bx],ah
	mov dx,0
	mov ax,0
	dec di		;segunda multiplicacion
	mov cl,4
	mov dh,00
	lea si,numero1+3
	lea di,numero2
	lea bx,resu2+4
saltoMM:mov al,[si]	;salto 2
	mov dl,[di]
	and al,0fh
	and dl,0fh
	mul dl
	aam
	add al,dh
	aaa
	mov [bx],al
	mov dh,ah
	dec si
	dec bx
	loop saltoMM 	;Salto 2
	mov [bx],ah

	clc		;Limpiar carry
	mov cl,6	;INICIO DE SUMA DE RESULTADOS
	lea si,[res1+5]
	lea di,[resu2+5]
	lea bx,[res3+5]
s1E5:	mov al,[si]	;AQUI VA EL SALTO 1
	mov dl,[di]
	mov ah,0
	adc al,dl
	aaa 		;ajuste de suma
	mov [bx],al
	mov dh,ah
	dec si
	dec di
	dec bx
	loop s1E5		;SALTO 1
	mov [bx],dh


	mov dh,19
	mov dl,25
	call cursor

	lea dx,total1
	call llamarImprimir
	mov dl,0dh
	call imprimir
	mov dl,10
	call imprimir

	mov dh,19
	mov dl,38
	call cursor
	mov cl,6
        lea si,res1
saltoxx:	mov dl,[si]        
	call imprimirOperacion
	inc si 
	loop saltoxx

	mov dh,20
	mov dl,25
	call cursor

	lea dx,total2
	call llamarImprimir
	mov dl,0dh
	call imprimir
	mov dl,10
	call imprimir

	mov dh,20
	mov dl,38
	call cursor
	mov cl,6
        lea si,resu2
salton2:	mov dl,[si]        
	call imprimirOperacion
	inc si 
	loop salton2


	mov dh,22
	mov dl,25
	call cursor

	lea dx,total
	call llamarImprimir
	mov dl,0dh
	call imprimir
	mov dl,10
	call imprimir
	
	mov dh,22	;SOLO PARA VER QUE NUMEROS
	mov dl,38
	call cursor
	mov cl,6
        lea si,res3
salton1:	mov dl,[si]        
	call imprimirOperacion
	inc si 
	loop salton1

	ret
operacionMult endp

;-------------------- FIN DE PROGRAMA ---------------------
end inicio