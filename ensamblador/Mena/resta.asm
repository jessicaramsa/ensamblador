debug
eds:200 "423"
eds:205 "967"
eds:210 "0000"
a
mov dl, 3
mov si, 202  	;direccion del ultimo numero del primer operando
mov di, 207  	;direccion del ultimo numero del segundo operando
mov bx, 213  	;reserva de memoria para el resultado
mov al, [si]	;salto 2 : final
mov cl, [di]
cmp ah, ff
jne 119	;salto 3 : inicio
and ah, 0
mov ah, 1
sub al, ah	;salto 3 : final
sub al, cl
mov ah, 0
aas		;ajuste ascii
mov [bx], al	;se guarda el primer numero en memoria
dec si
dec di
dec bx
dec dl
cmp dl, 0
jne 10b	;salto 2 : inicio
mov [bx], ah
mov cl, 4	;imprimir resultado
mov si, 210
mov ah, 02
mov dl, [si]	;salto 1 : final
or dl, 30
int 21
inc si
dec cl
cmp cl, 0
jne 135	;salto 1 : inicio
int 20