.model small
.stack 64
.data
;---------------------------DATOS-----------------------------
dom	db	"Hoy es domingo ","$"
lun	db	"Hoy es lunes ","$"
mar	db	"Hoy es martes ","$"
mie	db	"Hoy es miercoles ","$"
jue	db	"Hoy es jueves ","$"
vie	db	"Hoy es viernes ","$"
sab	db	"Hoy es sabado ","$"

ene	db	" de enero del ","$"
feb	db	" de febrero del ","$"
mch	db	" de marzo del ","$"
abr	db	" de abril del ","$"
may	db	" de mayo del ","$"
jun	db	" de junio del ","$"
jul	db	" de julio del ","$"
ago	db	" de agosto del ","$"
sep	db	" de septiembre del ","$"
oct	db	" de octubre del ","$"
nov	db	" de noviembre del ","$"
dic	db	" de diciembre del ","$"

var3	db 	"... Hora: ","$"

day	db 	"00","$"	;contained in dl
yr	dw 	?			;contained in cx
hou	db 	"00:","$"	;contained in ch
min	db 	"00:","$"	;contained in cl
sec	db 	"00:","$"	;contained in dh
mil db 	"00","$"	;contained in dl

var1	db 	"1","$"
var2	db 	"16","$"


err	db 	"No se pudo completar la peticion...","$"

;-------------------------FIN DATOS---------------------------
.code
;--------------------------CÓDIGO-----------------------------
start proc far
		mov ax,@data
		mov ds,ax
		mov es,ax

		call fecha
		call hora

		mov ax,4c00h	;fin del programa
		int 21h
start endp
;------------------------FIN CÓDIGO---------------------------

;----------------------PROCEDIMIENTOS-------------------------
fecha proc near
		mov ah,2ah
		int 21h

		cmp al,00h
		je pdom
		cmp al,01h
		je plun
		cmp al,02h
		je pmar
		cmp al,03h
		je pmie
		cmp al,04h
		je pjue
		cmp al,05h
		je pvie
		cmp al,06h
		je psab
		jmp enda

pdom:	lea dx,dom
		call print2
		jmp enda
plun:	lea dx,lun
		call print2
		jmp enda
pmar:	lea dx,mar
		call print2
		jmp enda
pmie:	lea dx,mie
		call print2
		jmp enda
pjue:	lea dx,jue
		call print2
		jmp enda
pvie:	lea dx,vie
		call print2
		jmp enda
psab:	lea dx,sab
		call print2
		jmp enda

enda:	call numday
		lea dx,day
		call print2

		mov ah,2ah
		int 21h


		cmp dh,00h
		je pen
		cmp dh,01h
		je pfeb
		cmp dh,02h
		je pmch
		cmp dh,03h
		je pabr
		cmp dh,04h
		je pmay
		cmp dh,05h
		je pjul
		cmp dh,06h
		je pjun
		cmp dh,07h
		je pjul
		cmp dh,08h
		je pago
		cmp dh,09h
		je psep
		cmp dh,0ah
		je poct
		cmp dh,0bh
		je pnov
		cmp dh,0ch
		je pdic
		jmp endb

pen:	lea dx,ene
		call print2
		jmp endb
pfeb:	lea dx,feb
		call print2
		jmp endb
pmch:	lea dx,mch
		call print2
		jmp endb
pabr:	lea dx,abr
		call print2
		jmp endb
pmay:	lea dx,may
		call print2
		jmp endb
pjun:	lea dx,jun
		call print2
		jmp endb
pjul:	lea dx,jul
		call print2
		jmp endb
pago:	lea dx,ago
		call print2
		jmp endb
psep:	lea dx,sep
		call print2
		jmp endb
poct:	lea dx,oct
		call print2
		jmp endb
pnov:	lea dx,nov
		call print2
		jmp endb
pdic:	lea dx,dic
		call print2
		jmp endb


endb:	mov yr,cx
		call year

		lea dx,var3
		call print2

		ret
fecha endp

hora proc near
		mov ah,2ch
		int 21h

		mov bx,0
		mov bl,ch 
		and bl,0fh
		mov al,1
		mul bl
		aam
		mov bp,ax
		mov bx,0
		mov bl,ch
		and bl,240
		mov cl,4
		shr bl,cl
		mov al,10h
		mul bl
		aam
		add ax,bp
		aaa
		or ax,3030h
		mov bh,al 
		mov bl,ah
		lea si,hou
		mov [si],bx
		lea dx,hou
		call print2

		mov ah,2ch
		int 21h

		mov bx,0
		mov bl,cl 
		and bl,0fh
		mov al,1
		mul bl
		aam
		mov bp,ax
		mov bx,0
		mov bl,cl
		and bl,240
		mov cl,4
		shr bl,cl
		mov al,10h
		mul bl
		aam
		add ax,bp
		aaa
		or ax,3030h
		mov bh,al 
		mov bl,ah
		lea si,min
		mov [si],bx
		lea dx,min
		call print2

		mov ah,2ch
		int 21h

		mov bx,0
		mov bl,dh 
		and bl,0fh
		mov al,1
		mul bl
		aam
		mov bp,ax
		mov bx,0
		mov bl,dh
		and bl,240
		mov cl,4
		shr bl,cl
		mov al,10h
		mul bl
		aam
		add ax,bp
		aaa
		or ax,3030h
		mov bh,al 
		mov bl,ah
		lea si,sec
		mov [si],bx
		lea dx,sec
		call print2

		ret
hora endp

return proc near
		mov dl,13
		call print
		mov dl,10
		call print
		ret
return endp

print proc near
		mov ah,02
		int 21h
		ret
print endp

print2 proc near
		mov ah,09
		int 21h
		ret
print2 endp

numday proc near
		mov ah,2ah
		int 21h
		mov bx,0
		mov bl,dl 
		and bl,0fh
		mov al,1
		mul bl
		aam
		mov bp,ax
		mov bx,0
		mov bl,dl
		and bl,240
		mov cl,4
		shr bl,cl
		mov al,10h
		mul bl
		aam
		add ax,bp
		aaa
		or ax,3030h
		mov bh,al 
		mov bl,ah
		lea si,day
		mov [si],bx
		ret
numday endp

year proc near
		sub ax,ax
		sub bx,bx
		sub dx,dx
		
		mov ax,yr
		mov bx,0ah
		div bx
		or dx,3030h
		push dx
		sub dx,dx
		div bx
		or dx,3030h
		push dx
		sub dx,dx
		div bx
		or dx,3030h
		push dx
		or ax,3030h
		push ax
		pop dx
		mov ah,02h
		int 21h
		pop dx
		mov ah,02h
		int 21h
		pop dx
		mov ah,02h
		int 21h
		pop dx
		mov ah,02h
		int 21h
		mov dl,32
		mov ah,02h
		int 21h
		ret
year endp

;--------------------FIN PROCEDIMIENTOS-----------------------
end start