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

       lea dx,msj
       call print

       call teclado
      
       mov dh,20	;renglon
       mov dl,50	;columna
       call cursor
       lea dx,captura
       call print

salto2:mov ah,0
       int 16h
       cmp al,13
       je fin       
       jne salto2

fin:   mov ax,4c00h   ;interrupciòn para fin de programa
       int 21h
inicio endp
;...procedimientos...

print proc near
       mov ah,09
       int 21h
       ret
print endp

teclado proc near
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
       ret
teclado endp

cursor proc near
       mov ah,02	;colocar cursor
       mov bh,0
       int 10h
       ret
cursor endp
end inicio







