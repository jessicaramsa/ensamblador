debug
a
mov ah,0
mov al,12
int 10
mov ah,0c
mov al,0e
mov bh,0
mov cx,8	;Comienzo a hacer el cuadrado
mov dx,10
int 10		;salto1
inc cx	
cmp cx,258
jne 112		;salto1
int 10		;salto2
inc dx	
cmp dx,1c2
jne 11b		;salto2
int 10		;salto3
dec cx	
cmp cx,8
jne 124		;salto3
int 10		;salto4
dec dx	
cmp dx,10
jne 12c		;salto4
mov cx,190	;Comienzo a hacer el espacio de ID
mov dx,177
int 10		;salto5
inc cx
cmp cx,258
jne 13a		;salto5
mov cx,190
mov dx,1a4
int 10		;salto6
inc cx
cmp cx,258
jne	149		;salto6
mov cx,190
mov dx,177
int 10		;salto7
inc dx
cmp dx,1c2
jne 158		;salto7
mov cx,58	;Comienzo a hacer la J
mov dx,100
int 10		;salto8
inc cx
int 10
inc cx
int 10
dec dx
int 10
cmp cx,98 
jne 167		;salto8
inc cx		;salto9
inc dx
int 10
inc dx
int 10
cmp dx,130
jne 178 	;salto9
dec cx		;salto10
inc dx
int 10
inc dx
int 10
cmp dx,140
jne 185		;salto10
int 10		;salto11
dec cx
int 10
dec cx
int 10
inc dx
int 10
cmp cx,96 
jne 192		;salto11
int 10		;salto12
dec cx
int 10
dec cx
int 10 
dec cx
dec dx
cmp cx,81
jne 1a3 	;salto12
mov cx,bc	;Comienzo a hacer la E
mov dx,d0
int 10		;salto13
inc cx
int 10
inc cx
dec dx
int 10
cmp dx,b0
jne 1b9 	;salto 13
mov cx,bc
mov dx,d0
int 10		;salto14
inc cx
inc dx
int 10
inc dx
cmp dx,12a
jne 1ce		;salto14
int 10		;salto15
inc cx
int 10
inc cx
dec dx
int 10
cmp dx,10a 
jne 1db 	;salto 15
int 10
mov ah,0
int 16
mov ah,0
mov al,3
int 10
int 20

g
