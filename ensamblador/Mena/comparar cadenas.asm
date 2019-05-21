debug
eds:200 "12345"
eds:210 "12300"
a
cld
mov cl,5
lea di,[210]
lea si,[200]
repe cmpsb
int 20

g
dds:200