debug
eds:600 "1: "
eds:603 "2: "
eds:606 "00"
eds:608 "0"
eds:610 "000"
eds:615 "0"
a
mov cl,3
mov si,600
mov ah,02	;salto 1
mov dl,[si]
int 21
inc si
loop 105	;salto 1
mov cl,2
mov si,606
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
mov cl,3
mov si,603
mov ah,02	;salto 3
mov dl,[si]
int 21
inc si
loop 131	;salto 3
mov cl,1
mov si,608
mov ah,0	;salto 4
int 16
mov ah, 02
mov dl, al
int 21
mov [si],al
inc si
loop 13f	;salto 4
mov cl,2
mov si,607
mov di,608
mov bx,612
mov al,[si]	;salto 5
mov dl,[di]
and al,0f
and dl,0f
mul dl
aam
add al,[615]
aaa
mov [bx],al
mov [615],ah
dec si
dec bx
loop 159	;salto 5
mov [bx],ah
mov ah,02
mov dl,0d
int 21
mov dl,0a
int 21
mov cl,3
mov si,610
mov ah,02	;salto 6
mov dl,[si]
or dl,30
int 21
inc si
loop 186	;salto 6
int 20

g
