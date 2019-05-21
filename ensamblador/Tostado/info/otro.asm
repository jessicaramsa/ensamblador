.Model small
.Stack 64
.Data


;...Letreros, Variables ........

nombre db "Jasiel"

;......Fin de mensajes..........


;Inicializar còdigo
.Code

inicio proc far
       mov ax,@data   ;alineacion del segmento de datos
       mov es,ax
       mov ds,ax

       mov ax,0600h
       mov bh, 4fh
       mov cx,0000h
       mov dx,184fh
       int 10h

       mov ah,02
       mov bh,0
       mov dx,0c26h
       int 10h

       mov dh,6
       lea si,nombre
salto1:mov ah,02
       mov dl,[si]
       int 21h
       mov cx,2fffh
salto3:mov bx,9fffh
salto2:dec bx
       cmp bx,0
       jne salto2
       loop salto3
       inc si
       dec dh
       cmp dh,0
       jne salto1
       mov ax,4c00h   ;interrupciòn para fin de programa
       int 21h
inicio endp
end inicio







