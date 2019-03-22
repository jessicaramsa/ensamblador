;19 Marzo 2019
--- funciòn con interrupciòn que permitir acceso
--- del teclado
int 16h

debug
a
int 16
mov ah,0
int 16

mov ah,02 ;funcion int
mod dl,dato
int 21h