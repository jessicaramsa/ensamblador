debug
a
jmp 116

eds:102 "josue gonzalez mena"
a116
mov cl,13
mov si,102
mov ah,02
mov dl,[si]
cmp dl,60
jb 127
and dl,df
int 21
inc si
loop 11d
int 20

g 
