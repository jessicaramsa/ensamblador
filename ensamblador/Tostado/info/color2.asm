.Model small
.Stack 64
.Data


;...Letreros, Variables ........

msj db "Dame tu nombre: ", "$"

;......Fin de mensajes..........


;Inicializar còdigo
.Code

inicio proc far
       mov ax,@data   ;alineacion del segmento de datos
       mov es,ax
       mov ds,ax

       mov ax,0600h	;cambio de color de pantalla
       mov bh,90h       ;fondo morado frente verde
       add bh,50h
       mov cx,0000h     ;renglon y columna inicial
       mov dx,184fh     ;renglon y columna final
       int 10h

       mov ah,02
       mov bh,0
       mov dx,0c1eh
       int 10h
       lea dx,msj
       mov ah,09
       int 21h
       mov cl,6
       mov ah,01
salto1:int 21h
       loop salto1

       mov ax,4c00h   ;interrupciòn para fin de programa
       int 21h
inicio endp
end inicio







