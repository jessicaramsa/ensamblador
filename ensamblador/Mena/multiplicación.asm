debug
eds:200 "999"
eds:210 "99"
eds:220 "00000"
eds:230 "00000"
eds:240 "00000"
eds:250 "0"
a
mov cl, 3
mov si, 202
mov di, 211
mov bx, 224
mov al, [si] 	;salto 1
mov dl, [di]
and al, 0f
and dl, 0f
mul dl
aam
add al, [250]
aaa
mov [bx], al
mov [250], ah
dec si
dec bx
loop 10b 	;salto 1 
mov [bx], ah
mov dh, 0
mov ax, 0
mov [250], dh
dec di		;segundo multiplicador
mov cl, 3
mov si, 202
mov bx, 233
mov al, [si] 	;salto 2
mov dl, [di]
and al, 0f
and dl, 0f
mul dl
aam
add al, [250]
aaa
mov [bx], al
mov [250], ah
dec si
dec bx
loop 13b 	;salto 2 
mov [bx], ah
clc
mov cl, 5 	;suma resultado
mov si, 224
mov di, 234
mov bx, 244
mov al, [si]	;salto 3
mov dl, [di]
mov ah, 0
adc al, dl
aaa
mov [bx], al
dec si
dec di
dec bx
loop 165	;salto 3
mov [bx], ah
mov cl, 5	;imprimir resultado
mov si, 240
mov ah, 02
mov dl, [si]	;salto 4
or  dl, 30
int 21
inc si
loop 17e	;salto 4
int 20

g