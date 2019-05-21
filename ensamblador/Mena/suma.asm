debug
eds:200 "999"
eds:205 "999"
eds:210 "0000"
a
mov si, 202  	;primer operando
mov di, 207  	;segundo operando
mov bx, 213  	;reserva de memoria
mov al, [si]
mov cl, [di]
add al, cl
aaa				;ajuste ascii
mov [bx], al	;se guarda el primer numero en memoria
dec si
dec di
dec bx
mov al, [si]
mov cl, [di]
add al, ah
add al, cl
mov ah, 0
aaa	
mov [bx], al	;se guarda el segundo numero en memoria
dec si
dec di
dec bx
mov al, [si]
mov cl, [di]
add al, ah
add al, cl
mov ah, 0
aaa	
mov [bx], al	;se guarda el tercer numero en memoria
dec bx
mov [bx], ah	;se guarda el cuarto numero en memoria
mov cl, 4		;imprimir resultado
mov si, 210
mov ah, 02
mov dl, [si]	;salto 1
or dl, 30
int 21
inc si
dec cl
cmp cl, 0
jne 13c			;salto 1
int 20