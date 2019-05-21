.Model small
.Stack 64
.Data


;...Letreros, Variables ........
welcom  db "Suma dos numeros de tres digitos", "$"
msj     db 0dh,0ah, "Primer numero: ",  "$"
msj2    db 0dh,0ah, "Segundo numero: ", "$"
msjRes  db 0dh,0ah, "La suma es: ",     "$"
num1 db "333"
num2 db "666"
res  db "0000", "$"	;Resultado
;......Fin de mensajes..........


;.......Inicializar còdigo......
.Code

inicio proc far
       mov ax,@data   ;alineacion del segmento de datos
       mov es,ax
       mov ds,ax

       lea dx,welcom
       call print

       lea dx,msj
       call print
       mov cl,3
       ;lea si,num1
       ;call input

       lea dx,msj2
       call print
       mov cl,3
       ;lea si,num1
       ;call input

       lea dx,msjRes
       call print
       call suma

        mov cl,4
	lea bx,res
	mov ah,02
salto3:	mov dl,[bx]
	or dl,30h
	int 21h
	inc bx
	loop salto3

       mov ax,4c00h   ;interrupciòn para fin de programa
       int 21h
inicio endp

print proc near     ;procedimiento para imprimir
       mov ah,09
       int 21h
       ret
print endp

input proc near     ;procedimiento para ingresar
salto1:mov ah,0
       int 16h
       mov [si],al
       mov ah,02
       mov dl,al
       int 21h
       inc si
       loop salto1
       ret
input endp

suma proc near      ;procedimiento para sumar
        mov cl,3
	lea si,num1+2
	lea di,num2+2
	lea bx,res+3
salto2:	mov al,[si]
	mov dl,[di]
	mov ah,00
	adc al,dl
	aaa
	mov [bx],al
	dec si
	dec di
	dec bx
	loop salto2
	mov [bx],ah
        ret
suma endp

end inicio







