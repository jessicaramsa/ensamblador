debug
eds:200 "12345"
eds:210 "00000"
a
cld
mov cl,5
mov al,2a
lea si,[200]
lea di,[214]
lodsb	;salto 1
mov [di],al
dec di
loop 10d	;salto 1
int 20

g
dds:200
