.model small
.stack 64
.data
;---------------------------DATOS-----------------------------
;Variables para guardar los valores en hexadecimal
horas DB ?, '$'
minutos DB ?, '$'
segundos DB ?, '$'
dia_semana DB ?, '$'
dia_mes DB ?, '$'
mes DB ?, '$'
anio DB ?, ?, '$'
formato DB ?

;Variables convertidas a ASCII
dia_mes_conv DB ?, ?, " de ", '$'
anio_conv DB ?, ?, '$'
horas_conv DB ?, ?, '$'
min_conv DB ?, ?, '$'
seg_conv DB ?, ?, '$'

dig1 DB ?, '$'
dig2 DB ?, '$'
dig3 DB ?, '$'
dig4 DB ?, '$'

;Variables que contienen cadena de caracteres
;msj_dia_semana = 10 caracteres por casilla
;msj_dia_semana = 11 caracteres por casilla
msj_hora DB "Hora: ",'$'
msj_separador DB " :",'$'
msj_dia_semana DB "Domingo $","Lunes $","Martes $","Miercoles$","Jueves $","Viernes $","Sabado $"
msj_mes DB "Enero $","Febrero $","Marzo $","Abril $","Mayo $","Junio $",
DB "Julio $", "Agosto $","Septiembre$","Octubre $","Noviembre $","Diciembre $"
tipo_formato DB " am$", " pm$"
salto_linea DB 0Ah, 0Dh,'$'
;-------------------------FIN DATOS---------------------------
.code
;--------------------------CÓDIGO-----------------------------
start proc far
		mov ax,@data
		mov ds,ax
		mov es,ax

		

		mov ax,4c00h	;fin del programa
		int 21h
start endp
;------------------------FIN CÓDIGO---------------------------

;----------------------PROCEDIMIENTOS-------------------------
proc1 proc near
		mov ah, 2Ch
		int 21h

		mov offset horas, ch
		mov offset minutos, cl
		mov offset segundos, dh

		mov ah, 2Ah
		int 21h

		mov offset dia_semana, al
		mov offset anio, cx
		mov offset mes, dh
		mov offset dia_mes, dl
		jmp Mostrar_Dia_Semana

;Ciclo infinito de refrescamiento
refrescar:
		mov ah, 2Ch
		int 21h
		mov offset horas, ch
		mov offset minutos, cl
		mov offset segundos, dh
		jmp Mostrar_Hora

		ret
proc1 endp

Mostrar_Dia_Semana proc near
		;Obtener el número del día de la semana, y guardarlo en CX
		mov cl, [dia_semana]
		mov ch, 0
;Obtener la dirección de memoria del vector de días
;Y le sumamos el día de la semana multiplicado por 10
;Para obtener la dirección exacta del día en el vector
		mov bx, offset msj_dia_semana
		mov ax, cx
		mov cl, 0Ah
		mul cx
		add bx, ax
		mov ah, 09
		mov dx, bx
		int 21h
Mostrar_Dia:
;Obtener el número del día del mes
;Dividimos entre 10 para obtener el número en decimal
;Luego lo transformamos a ASCII
		mov al, [dia_mes]
		mov cl, 10
		mov ah, 0
		div cl
		or ax, 3030h
		mov bx, offset dia_mes_conv
		mov [bx], al
		inc bx
		mov [bx], ah
		mov ah, 09
		mov dx, offset dia_mes_conv
		int 21h
Mostrar_Dia_Semana endp

Mostrar_Mes proc near
;Obtener el número del mes, y guardarlo en CX
		mov cl, [mes]
		mov ch, 0
;Obtener la dirección de memoria del vector de mes
;Y le sumamos el numero del mes multiplicado por 12
;Para obtener la dirección exacta del mes
		mov bx, offset msj_mes
		mov ax, cx
		mov cl, 0Bh
		mul cx
		add bx, ax
		sub bx, 0Bh
		mov ah, 09
		mov dx, bx
		int 21h
Mostrar_Mes endp

Mostrar_Anio proc near
;Obtener el número del año actual
;AL = 201 | AH = 1
;Hay que ir dividiendo entre 10 el registro AL para ir guardando
;dígito por dígito y así guardarlo en variables separadas
;para que posteriormente se le pueda hacer un OR 3030h y obtener el ASCII
		mov bx, offset anio
		mov ax, [bx]
		mov cl, 10
		div cl
		mov dig1, ah
		mov ah, 0
		mov cl, 10
		div cl
		mov dig2, ah
		mov ah, 0
		mov cl, 10
		div cl
		mov dig3, ah
		mov ah, 0
		mov cl, 10
		div cl
		mov dig4, ah
		or dig4, 30h
		or dig3, 30h
		or dig2, 30h
		or dig1, 30h
;Imprimimos año numero por numero
		mov ah, 09
		mov dx, offset dig4
		int 21h
		mov dx, offset dig3
		int 21h
		mov dx, offset dig2
		int 21h
		mov dx, offset dig1
		int 21h
		mov dx, offset salto_linea
		int 21h
		jmp Mostrar_Hora
Mostrar_Anio endp

Mostrar_Hora proc near
;Obtener el número de la hora
;Comparamos si es mayor o igual a 12 para cambiar formato
		mov ah, 09
		mov dx, offset msj_hora
		int 21h
		mov al, [horas]
		cmp al, 0Ch
		jae cambia_formato
formato_normal:
		mov tipo_formato, 0 ;El formato es "AM"
		mov cl, 10
		mov ah, 0
		div cl
		or ax, 3030h
		mov bx, offset horas_conv
		mov [bx], al
		inc bx
		mov [bx], ah
		mov ah, 09
		mov dx, offset horas_conv
		int 21h
Mostrar_Hora endp
;--------------------FIN PROCEDIMIENTOS-----------------------
end start


		