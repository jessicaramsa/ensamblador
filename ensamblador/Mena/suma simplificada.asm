debug
eds:200 "999"
eds:205 "999"
eds:210 "0000"
a
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