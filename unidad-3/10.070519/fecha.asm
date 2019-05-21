.Model small
.Stack 64
.Data


;---------------- Letreros, variables ------------------

domingo db "Domingo",20h,20h,"$"
lunes db "Lunes",20h,20h,"$"
martes db "Martes",20h,20h,"$"
miercoles db "Miercoles",20h,20h,"$"
jueves db "Jueves",20h,20h,"$"
viernes db "Viernes",20h,20h,"$"
sabado db "Sabado",20h,20h,"$"

enero db "Enero",20h,20h,"$"
febrero db "Febrero",20h,20h,"$"
marzo db "Marzo",20h,20h,"$"
abril db "Abril",20h,20h,"$"
mayo db "Mayo",20h,20h,"$"
junio db "Junio",20h,20h,"$"
julio db "Julio",20h,20h,"$"
agosto db "Agosto",20h,20h,"$"
septiembre db "Septiembre",20h,20h,"$"
octubre db "Octubre",20h,20h,"$"
noviembre db "Noviembre",20h,20h,"$"
diciembre db "Diciembre",20h,20h,"$"

;-------------------------------------------------------

;------- Inicializar còdigo
.Code

inicio proc far
		mov ax,@data		;alineacion segmento datos
		mov es,ax
		mov ds,ax

		call fecha
		cmp al,0		;soy domingo
		je impDomingo		;ve a imprimir
		cmp al,1		;lunes
		je impLunes
		cmp al,2		;martes
		je impMartes
		cmp al,3
		je impMiercoles		;miercoles
		cmp al,4
		je impJueves		;jueves
		cmp al,5
		je impViernes		;viernes
		cmp al,6
		je impSabado		;sabado

impDomingo:	lea dx,domingo
		call imprimir
		jmp dia
impLunes:	lea dx,lunes
		call imprimir
		jmp dia
impMartes:	lea dx,martes
		call imprimir
		jmp dia
impMiercoles:	lea dx,miercoles
		call imprimir
		jmp dia
impJueves:	lea dx,jueves
		call imprimir
		jmp dia
impViernes:	lea dx,viernes
		call imprimir
		jmp dia
impSabado:	lea dx,sabado
		call imprimir
		jmp dia

dia:		call fecha
		mov al,dl
		aam
		mov cx,ax
		mov ah,02
		mov dl,ch
		or dl,30
		int 21h
		mov dl,cl
		or dl,30
		int 21h
		mov dl,20h
		int 21h
		mov dl,20h
		int 21h
		jmp mes

mes:		call fecha
		cmp dh,1
		je impEnero
		cmp dh,2
		je impFebrero
		cmp dh,3
		je impMarzo
		cmp dh,4
		je impAbril
		cmp dh,5
		je impMayo
		cmp dh,6
		je impJunio
		cmp dh,7
		je impJulio
		cmp dh,8
		je impAgosto
		cmp dh,9
		je impSeptiembre
		cmp dh,ah
		je impOctubre
		cmp dh,bh
		je impNoviembre
		cmp dh,ch
		je impDiciembre

impEnero:	lea dx,enero
		call imprimir
		jmp anio
impFebrero:	lea dx,febrero
		call imprimir
		jmp anio
impMarzo:	lea dx,marzo
		call imprimir
		jmp anio
impAbril:	lea dx,abril
		call imprimir
		jmp anio
impMayo:	lea dx,mayo
		call imprimir
		jmp anio
impJunio:	lea dx,junio
		call imprimir
		jmp anio
impJulio:	lea dx,julio
		call imprimir
		jmp anio
impAgosto:	lea dx,agosto
		call imprimir
		jmp anio
impSeptiembre:	lea dx,septiembre
		call imprimir
		jmp anio
impOctubre:	lea dx,octubre
		call imprimir
		jmp anio
impNoviembre:	lea dx,noviembre
		call imprimir
		jmp anio
impDiciembre:	lea dx,diciembre
		call imprimir
		jmp anio

anio:		call fecha
		jmp fin

fin:		mov ax,4c00h		;fin de programa
		int 21h

inicio endp

;------- Procedimientos
fecha proc near
		mov ah,2ah
		int 21h
		ret
fecha endp

imprimir proc near
		mov ah,09
		int 21h
		ret
imprimir endp
end inicio


;masm nombre.asm;
;link nombre;
;nombre