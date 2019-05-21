debug
eds:200 "12345"
eds:210 "00000"
a
cld
mov cl,5
lea di,[210]
lea si,[200]
rep movsw
int 20

g
