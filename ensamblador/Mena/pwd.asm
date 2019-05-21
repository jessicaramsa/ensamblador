.model small
.stack 64
.data
;........................................................
pwdrq 	db "Introduce tu password: ","$"
pwdfl	db "Password incorrecto",0dh,0ah,"$"
pwdtr 	db "12345"
pwdc	db "00000"
menu	db "Teclea la opcion que deseas realizar:",0dh,0ah,0dh,0ah,"1.Suma",0dh,0ah,"2.Resta",0dh,0ah,"3.Multiplicacion",0dh,0ah,"4.Division",0dh,0ah,"$"
suma1	db "Suma",0dh,0ah,"$"
ops1	db "000"
ops2	db "000"
anss	db "000"
resta1	db "Resta",0dh,0ah,"$"
multi1	db "Multiplicacion",0dh,0ah,"$"
divi1	db "Division",0dh,0ah,"$"

;.......................CÓDIGO...........................
.code
start	proc	far
		
		mov ax,@data
		mov ds, ax
		mov es,ax

		mov bh,3fh
		call color

		mov dh,12
		mov dl,20
		call cursor

		lea dx,pwdrq
		call pwdlbl

		mov cl,5
		lea si,pwdc
jmp1:	call keybrd
		mov [si],al
		mov ah,02
		mov dl,2ah
		call print
		inc si
		loop jmp1

		mov dl,13
		call print
		mov dl,10
		call print

		mov cl,5
		lea si,pwdtr
		lea di,pwdc
		repe cmpsb
		je menu1

		lea dx,pwdfl
		call pwdlbl
		jmp enda

menu1:	call keybrd
		mov bh,17h
		call color

		lea dx,menu
		call pwdlbl

		call keybrd
		mov dh,al
		call print

		mov dl,0dh
		call print
		mov dl,0ah
		call print

		mov al,dh
		cmp al,31h
		je suma 
		cmp al,32h
		je resta
		cmp al,33h
		je multi 
		cmp al,34h
		je divi
		jmp enda

suma:	call sumap
		jmp enda
resta:	call restap
		jmp enda
multi:	call multip
		jmp enda
divi:	call divip
		jmp enda

enda:	mov ax, 4c00h
		int 21h

start endp
;...................PROCEDIMIENTOS.......................

pwdlbl proc near
		mov ah,09
		int 21h
		ret
pwdlbl endp

keybrd proc near
		mov ah,0
		int 16h
		ret
keybrd endp

print proc near
		mov ah,02
		int 21h
		ret
print endp

cursor proc near
		mov ah,02
		mov bh,0
		int 10h
		ret
cursor endp

color proc near
		mov ah,06h
		mov cx,0
		mov dx,184fh
		int 10h
		ret
color endp

sumap proc near
		lea dx,suma1
		call pwdlbl
		mov cl, 3
		mov si, 202  	;primer operando
		mov di, 207  	;segundo operando
		mov bx, 213  	;reserva de memoria
		mov al, [si]	;salto 2
		mov dl, [di]
		mov ah, 0
		adc al, dl
		aaa				;ajuste ascii
		mov [bx], al	;se guarda el primer numero en memoria
		dec si
		dec di
		dec bx
		loop 10b		;salto 2
		mov [bx], ah
		mov cl, 4		;imprimir resultado
		mov si, 210
		mov ah, 02
		mov dl, [si]	;salto 1
		or dl, 30
		int 21
		inc si
		loop 124			;salto 1
		int 20
		ret
sumap endp

restap proc near
		lea dx,resta1
		call pwdlbl
		ret
restap endp

multip proc near
		lea dx,multi1
		call pwdlbl
		ret
multip endp

divip proc near
		lea dx,divi1
		call pwdlbl
		ret
divip endp

end start