.Model small
.Stack 64
.Data


;...Letreros, Variables ........

nombre db "Jasiel",0dh,0ah,"Galvan"

;......Fin de mensajes..........


;Inicializar c�digo
.Code

inicio proc far
       mov ax,@data   ;alineacion del segmento de datos
       mov es,ax
       mov ds,ax


       mov ax,4c00h   ;interrupci�n para fin de programa
       int 21h
inicio endp
end inicio







