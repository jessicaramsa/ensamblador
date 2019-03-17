*******************************************************
Suma (solo con mnemónicos ya vistos)
-------------------------------------------------------
debug
a
mov al,3
mov bl,2
inc al		;salto 1
dec bl
cmp bl,0
jne 104		;salto 1
int 20


debug
a
mov al,33
mov bl,38
add al,bl
aaa        ;ajuste ascii
mov al,34
add al,bl
aaa

------------- AAA (Ajuste a ASCII de la Adición) ------
;El valor para modificarse debe estar en el registro
;al y regresa el numero en un códido BCD descompactado


debug
eds:200 "242"
eds:210 "424"
eds:220 "0000"
a
mov si,202
mov di,212
mov bx,223
mov al,[si]
mov dl,[di]
and al,0f
and dl,0f
add al,dh
add al,dl
aaa        ;aplicar el ajuste
mov [bx],al
mov dh,ah
mov ah,0    ;resultado primer operando
dec si
dec di
dec bx
mov al,[si]
mov dl,[di]
and al,0f
and dl,0f
add al,dh
adc al,dl
aaa
mov [bx],al
mov dh,ah
mov ah,0    ;resultado segundo operando
dec si
dec di
dec bx
mov al,[si]
mov dl,[di]
and al,0f
and dl,0f
add al,dh
adc al,dl
aaa
mov [bx],al    ;resultado tercer operando
dec bx
mov [bx],ah
mov cl,4    ;imprimir dato
mov ah,02    ;funci�n
mov si,220
mov dl,[si]    ;salto 1
or dl,30
int 21
inc si
dec cl
cmp cl,0
jne 151        ;salto 1
int 20


-------- primera simplificacion de suma ---------------
debug
eds:200 "999"
eds:210 "999"
eds:220 "0000"
a
mov cl,3
mov si,202
mov di,212
mov bx,223
mov al,[si]    ;salto 1
mov dl,[di]
and al,0f
and dl,0f
add al,dh
add al,dl
mov ah,0    ;limpiar
aaa        ;aplicar el ajuste
mov [bx],al
mov dh,ah
dec si
dec di
dec bx
dec cl
cmp cl,0
jne 10b        ;salto 1
mov [bx],ah
mov cl,4    ;imprimir dato
mov ah,02    ;funci�n
mov si,220
mov dl,[si]    ;salto 2
or dl,30
int 21
inc si
dec cl
cmp cl,0
jne 132        ;salto 2
int 20


----------- segunda simplificacion de suma ------------
debug
eds:200 "999"
eds:210 "999"
eds:220 "0000"
a
mov cl,3
mov si,202
mov di,212
mov bx,223
mov al,[si]    ;salto 1
mov dl,[di]
adc al,dl    ;suma con acarreo
mov ah,0    ;limpiar
aaa        ;aplicar el ajuste
mov [bx],al
dec si
dec di
dec bx
loop 10b    ;salto 1, dec-cmp-jne
mov [bx],ah
mov cl,4    ;imprimir dato
mov ah,02    ;funci�n
mov si,220
mov dl,[si]    ;salto 2
or dl,30
int 21
inc si
loop 124    ;salto 2
int 20


------------------------ Loop -------------------------
debug
a
mov cl,3
inc al
loop 102


------- AAS (Ajuste ASCII de la subtracci�n) ----------
debug
eds:200 "777"
eds:210 "999"
eds:220 "0000"
a
mov cl,3
mov si,202
mov di,212
mov bx,223
mov al,[si]    ;salto 1
mov dl,[di]
sbb al,dl    ;resta con acarreo
mov ah,0    ;limpiar
aas        ;aplicar el ajuste
mov [bx],al
dec si
dec di
dec bx
loop 10b    ;salto 1, dec-cmp-jne
mov [bx],ah
mov cl,4    ;imprimir dato
mov ah,02    ;funci�n
mov si,220
mov dl,[si]    ;salto 2
or dl,30
int 21
inc si
loop 124    ;salto 2
int 20
