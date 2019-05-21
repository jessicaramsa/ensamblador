.Model small
.Stack 64
.Data


;...Letreros, Variables ........

msj db "Dame tu nombre: ","$"
captura db "000000","$"

;......Fin de mensajes..........


;Inicializar còdigo
.Code

inicio proc far
       mov ax,@data   ;alineacion del segmento de datos
       mov es,ax
       mov ds,ax

       mov ah,09
       lea dx,msj
       int 21h
       mov cl,6		;captura de datos
       lea si,captura
salto1:mov ah,0
       int 16h
       mov [si],al
       mov ah,02
       mov dl,al
       int 21h
       inc si
       loop salto1

       mov ah,02	;colocar cursor
       mov bh,0
       mov dh,20	;renglon
       mov dl,50	;columna
       int 10h

       mov ah,09
       lea dx,captura
       int 21h


       mov ax,4c00h   ;interrupciòn para fin de programa
       int 21h
inicio endp
end inicio







