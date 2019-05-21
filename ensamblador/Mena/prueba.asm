debug
a
mov ah,2a
int 21
mov bx,0
mov bx,cx 
and bx,000f
mov al,1
mul bl
aam
mov bp,ax
mov bx,0
mov bx,cx
and bx,00f0
mov cl,4
shr bl,cl
mov al,10
mul bl
aam
adc ax,bp
aaa
mov bp,ax
mov bx,0
mov bx,cx
and bx,0f00
mov cl,4
shr bx,cl
shr bx,cl
mov ax,100
mul bx
aam
adc ax,bp
aaa
or ax,3030
int 20

r
