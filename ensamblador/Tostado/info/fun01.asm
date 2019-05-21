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

       mov ah,02
       mov bh,0
       mov dh,12
       mov dl,30
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







