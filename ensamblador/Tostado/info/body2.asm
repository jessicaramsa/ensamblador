.Model small
.Stack 64
.Data


;...Letreros, Variables ........

nombre db "Jasiel",0dh,0ah,"Galvan"

;......Fin de mensajes..........


;Inicializar còdigo
.Code

inicio proc far
       mov ax,@data   ;alineacion del segmento de datos
       mov es,ax
       mov ds,ax

       mov cl,6
       lea si,nombre
       mov ah,02
salto1:mov dl,[si]
       int 21h
       inc si
       loop salto1

       mov cl,8	     ;apellido
       lea si,nombre+6
       mov ah,02
salto2:mov dl,[si]
       int 21h
       inc si
       loop salto2
       mov ax,4c00h   ;interrupciòn para fin de programa
       int 21h
inicio endp
end inicio







