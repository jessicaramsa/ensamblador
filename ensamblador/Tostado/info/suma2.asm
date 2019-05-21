.Model small
.Stack 64
.Data


;...Letreros, Variables ........
welcom  db "Suma dos numeros de tres digitos", "$"
msj     db 0dh,0ah, "Primer numero: ",  "$"
msj2    db 0dh,0ah, "Segundo numero: ", "$"
msjRes  db 0dh,0ah, "La suma es: ",     "$"
num1 db "000", "$"
num2 db "000", "$"
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
       lea si,num1
       call input

       lea dx,msj2
       call print
       mov cl,3
       lea si,num2
       call input

       lea dx,msjRes
       call print

       ;lea dx,num1
       ;call print
       ;lea dx,num2
       ;call print

       call suma

       lea dx,res
       call print

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
        and al,0fh
	mov dl,[di]
        and dl,0fh
	mov ah,00
	adc al,dl
	aaa
        add al,dh
        or al,30h
	mov [bx],al
	dec si
	dec di
	dec bx
        mov dh,ah
	loop salto2
        or ah,30h
	mov [bx],ah
        ret
suma endp

end inicio







