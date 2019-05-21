.model small
.stack 64
.data
;----------------------------------------------------------
dia db "10"
mdia db "1"
res db "00"
mdia2 db "16"
res2 db "00"
suma db "00"
ac db "0"

;----------------------------------------------------------

.code
empezar proc far
	
	mov ax,@data
	mov ds,ax
	mov es,ax
	
	mov cl,2
	lea si,mdia2
	lea di,dia+0
	lea bx,res2+1
salto:	mov al,[si]
	mov dl,[di]
	and al,0fh
	and dl,0fh
	mul dl
	aam
	add al,ac
	aaa
	mov [bx],al
	mov ac,ah
	dec si
	dec bx
	loop salto

	mov [bx],ah
	mov dh,0
	mov ax,0
	mov ac,dh
	lea si,mdia
	lea di,dia+1
	lea bx,res+1
	mov al,[si]
	mov dl,[di]
	and al,0fh
	and dl,0fh
	mul dl
	aam
	add al,ac
	aaa
	mov [bx],al
	mov [bx],ah
	
	clc
	lea si,res+1
	lea di,res2+1
	lea bx,suma+1
salto1:	mov al,[si]	;salto3
	mov dl,[di]
	mov ah,0
	adc al,dl
	aaa
	mov [bx],al
	dec si
	dec di
	dec bx
	loop salto1
	mov [bx],ah

	mov cl,2	;IMPRIMIR PRRO
	lea si,suma	
	mov ah,02
salto2:	mov dl,[si]	;SALTO 4
	or dl,30
	int 21
	inc si
	loop salto2	;SALTO 4	

	mov ax,4c00h 	;fin del programa
	int 21h
empezar endp
end empezar