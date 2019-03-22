------------------- Imprimir con signo ----------------
debug
a
mov al,39
mov bl,37
sbb al,bl
aas        ;ajuste para la resta
mov al,37
mov bl,39
sbb al,bl
aas
cmp ah,ff
;enviar mensaje n�mero negativo
cmp ah,00
;enviar mensaje n�mero positivo
    ;mensaje con resultado


;prueba imprimir con signo
debug
a
mov al,39
mov bl,37
sbb al,bl
aas         ;ajuste para la resta
mov al,37
mov bl,39
sbb al,bl
aas
cmp ah,00
jne 111     ;negativo, ve a s1
je 113      ;positivo, ve a s2
mov ah,2d   ;s1
mov ah,2b   ;s2
mov bx,ax
mov ah,02   ;s3
mov dx,ax
or dl,30
int 21
loop 117    ;ve a s3
int 20