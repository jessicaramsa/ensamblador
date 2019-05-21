debug
eds:400 "Dame el multiplicando de 5 dígitos: "
eds:430 "Dame el multiplicador de 3 dígitos: "
eds:460 "00000"	
eds:466 "000"	
eds:470 "00000000"	
eds:480 "00000000"	
eds:490 "00000000"	
eds:500 "00000000"	
eds:510 "0"	
a
mov cl,24	;pedir el multiplicando
mov si,400	
mov ah,02	;salto 1
mov dl,[si]
int 21
inc si
loop 107	;salto 1
mov cl,5	;asignar el multiplicando a la memoria
mov si,460
mov ah,0	;salto 2
int 16
mov ah, 02
mov dl, al
int 21
mov [si],al
inc si
loop 113	;salto 2
mov ah,02
mov dl,0d 	
int 21	
mov dl,0a
int 21
mov cl,24	;pedir el multiplicador
mov si,430
mov ah,02	;salto 3
mov dl,[si]
int 21
inc si
loop 131	;salto 3
mov cl,3	;asignar el multiplicador a la memoria
mov si,466
mov ah,0	;salto 4
int 16
mov ah, 02
mov dl, al
int 21
mov [si],al
inc si
loop 13f	;salto 4
mov ax,0
mov bx,0
mov dx,0
mov cx,0
mov cl,5	;comienzo de la multiplicación
mov si,464
mov di,468
mov bx,477
mov al,[si]	;salto 5
mov dl,[di]
and al,0f
and dl,0f
mul dl
aam
add al,[510]
aaa
mov [bx],al
mov [510],ah
dec si
dec bx
loop 165	;salto 5
mov [bx], ah
mov dh,0
mov ax,0
mov [510],dh
mov cl,5	;segundo multiplicador
mov si,464
mov di,467
mov bx,486
mov al,[si]	;salto 6
mov dl,[di]
and al,0f
and dl,0f
mul dl
aam
add al,[510]
aaa
mov [bx],al
mov [510],ah
dec si
dec bx
loop 197	;salto 6
mov [bx], ah
mov dh,0
mov ax,0
mov [510],dh
mov cl,5	;tercer multiplicador
mov si,464
mov di,466
mov bx,495
mov al,[si]	;salto 7
mov dl,[di]
and al,0f
and dl,0f
mul dl
aam
add al,[510]
aaa
mov [bx],al
mov [510],ah
dec si
dec bx
loop 1c9	;salto 7
mov [bx], ah
mov dh,0
mov ax,0
mov [510],dh
mov cl,8
mov bx,[477]
mov dx,[487]
mov sp,[497]
mov bp,[507]
mov al,[bx]
adc al,[dx]
adc al,[sp]
aaa
mov [bp],al
mov [510],ah
int 20

g
