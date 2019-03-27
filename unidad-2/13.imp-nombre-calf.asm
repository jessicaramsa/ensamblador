;--------------------------------------------------------
;Imprimir nombre y calificacion (abajo izquierdo)
;Imprimir
;	0-6 Reprobado
;	7-9 Aprobado
;	Mayor Fuera de rango
;	Centrar letrero
;--------------------------------------------------------

debug
a
jmp 139

eds:102 "Jessica"
eds:109 "Calificacion:  "
eds:118 "9"
eds:11a "Fuera de rango"
eds:128 "Reprobado"
eds:131 "Aprobado"
a 139
mov ah,02
mov cl,b
mov dl,0d		;s1
int 21
mov dl,0a
int 21
loop 13d		;ve a s1
mov cl,25
mov dl,20		;s12
int 21
loop 149		;ve a s12
mov si,118		;PROCESO DE COMPARACION
mov bl,[si]
cmp bl,37
jb 160			;ve a s8, si es menor
cmp bl,39
jg 180			;ve a s9, si es mayor
jmp 170			;ve a s10
mov si,128		;SI CALF REPROBADO, s8
mov cl,9
mov ah,02
mov dl,[si]		;s2
int 21
inc si
loop 167		;ve a s2
jmp 18e			;ve a s11
mov si,131		;SI CALF APROBADO, s10
mov cl,8
mov ah,02
mov dl,[si]		;s3
int 21
inc si
loop 177		;ve a s3
jmp 18e			;ve a s11
mov si,11a		;SI CALF FUERA DE RANGO, s9
mov cl,e
mov ah,02
mov dl,[si]		;s4
int 21
inc si
loop 187		;ve a s4
mov ah,02		;s11
mov cl,d		;CENTRADO DE NOMBRE
mov dl,0d		;s5
int 21
mov dl,0a
int 21
loop 192		;ve a s5
mov cl,7		;IMPRIMIR NOMBRE
mov si,102
mov dl,[si]		;s6
int 21
inc si
loop 1a1		;ve a s6
mov dl,0d		;IMPRIMIR CALIFICACION
int 21
mov dl,0a
int 21
mov cl,10
mov si,109
mov dl,[si]		;s7
int 21
inc si
loop 1b5		;ve a s7
mov ah,0
int 16
int 20


g
n c:\nombre.com
rcx
139
w

eds:118 "5"

