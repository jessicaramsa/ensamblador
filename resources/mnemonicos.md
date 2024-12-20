﻿# Mnemónicos Ensamblador

+ Ensambla el código - a
+ Desemsambla la línea (especificar dirección ip) - u 100
+ Operaciones aritméticas
  + Mover - mov
  + Suma – add
  + Resta – sub
  + Encender carry – stc
  + Suma con carry – adc
  + Incrementar – inc
  + Decrementar – dec
+ Operaciones lógicas
  + And – and
  + Or – or
  + Xor – xor
  + Not (se necesitan dos operandos) - not
  + Complemento a 2 – neg
+ Mnemónicos Hegemónicos
  + Corrimientos (más de 2 veces solamente con el contador)
    + Corrimiento a derecha – shr
    + Corrimiento a izquierda – shl
  + Rotaciones
    + Rotación derecha – ror
    + Rotación a izquierda – rol
    + Rotación con carry a izquierda – rcl
  + Comparar (necesito dos operandos) – cmp
    + Salta si no es igual – jne
    + Salta si es igual – je
+ Interrupciones
  + Fin del programa - int 20
  + Procede a ejecutar la interrupción - p
+ Guardar programa
  + Nombre (ruta, máx 8 caracteres para nombre) - `n c:\8caracte.com`
  + Indicar cuántos bits guardará más 1 – rcx
  + Escribe – w
  + Sal del debugger - q
+ Correr todo el programa (si tengo fin del programa indicado) - g
+ Índices
  + Modo de direccionamiento directo – mov si,200
  + Modo de direccionamiento indirecto- mov al,[si]
+ Guardar en memoria – eds:200 "12345"
+ Ajustes
  + Ajuste a ASCII de la Adición - aaa
  + Loop (especificar dirección ip, dec-cmp-jne) – loop 202
  + Ajuste a ASCII de la substracción - aas
---
### MASM y LINK

#### Procedimientos
+ Alineaciòn de segmento de datos
  + mov ax,@data
  + mov es,ax
  + ds,ax
+ Fin de programa
  + mov ax,4c00h
  + int 21h
+ Imprimir
  + mov ah,09
  + int 21h
  + ret - se utiliza para regresar al programa
+ Captura
  + mov cl,7 - cuantos datos va a capturar
  + lea si,captura - posicionarse en el segmento a guardar los datos
  + mov ah,0 - salto1
  + int 16h - interrupciòn de captura
  + mov [si],al - guarda
  + mov ah,02
  + mov dl,al
  + int 21h
  + loop salto1
  + ret
+ Cursor
  + Posicionar renglòn y columna
    + mov dh,20 - renglòn
    + mov dl,60 - columna
  + Procedimiento
    + mov ah,02 - cursor
    + mov bh,0 - pàgina 0
    + int 10h
    + ret
+ Posicionarse en mensaje
  + mov ah,09
  + lea dx,msj
+ Colores
  + mov ax,0600h - cambio de color pantalla
  + mov bh,90h - fondo morado,frente verde
  + add bh,50h
  + mov cx,0000h - renglòn y columna inicial
  + mov dx,184fh - renglòn y columna final
  + int 10h
+ Wait
  + mov dh,10
  + lea si,nombre - dato guardado en memoria
  + salto1: mov ah,02
  + mov dl,[si]
  + int 21h
  + inc si
  + mov cx,0fffh
  + salto2: mov bx,9fffh
  + salto3: dec bx
  + cmp bx,0
  + jne salto3
  + loop salto2
  + dec dl
  + cmp dl,0
  + loop salto1
+ Entrada e imprimir asterisco por cada caracter
  + lea si,capp
  + mov cl,4
  + salto1: mov ah,0
  + int 16h
  + mov [si],al
  + mov ah,02 - imprimir asterisco
  + mov dl,2ah
  + int 21h
  + inc si
  + loop salto1
  + ret
+ Comparar cadenas de caracteres
  + cld - limpiar bandera de direcciòn
  + mov cl,4
  + lea si,password
  + lea di,capturado
  + rep cmpsb - compara el byte, tambièn puede se 'repe'
  + cmp cx,0
    + je passwordCorrecto - si cx llega a 0
    + passwordIncorrrecto - si cx es mayor que 0
+ Cambiar a modo texto
  + mov ah,0
  + mov al,1
  + int 10h
  + mov al,3 - modo texto
  + int 10h
+ Cambiar a modo gràfico
  + mov ah,0
  + mov al,12 - cambiar a modo 12, 13 o 10 (modo de video)
  + int 10h
+ Dibujar
  + mov ah,0c
  + mov al,0e - color a manejar
  + mov bh,0 - pàgina 0
  + mov cx,20 - parte horizontal,LINEA SUPERIOR
  + mov dx,20 - parte vertical
  + int 10 - s1
  + inc cx
  + cmp cx,70 - tamaño de linea
  + jne 112 - ve a s1
+ Fecha
  + mov ah,2ah
    + al - muestra el nùmero de dìa de la semana (cmp al,0)
      + 0 - domingo
      + 1 - lunes
      + 2 - martes
      + 3 - miercoles
      + 4 - jueves
      + 5 - viernes
      + 6 - sabado
    + cx - muestra el anio en curso en hexadecimal
      + Hay que ir dividirendo entre 10 el registro 'al' para guardar digito
        por digito y guardarlo en variables separadas para aplicar un 'or'
        3030h y obtener el ASCII
        + mov bx,offset anio
        + mov ax,[bx]
        + mov cl,10
        + div cl
        + mov dig1,ah
        + mov ah,0
        + mov cl,10
        + div cl
        + mov dig2,ah
        + mov ah,0
        + mov cl,10
        + div cl
        + mov dig3,ah
        + mov ah,0
        + mov cl,10
        + div cl
        + mov dig4, ah
        + or dig4,30h
        + or dig3,30h
        + or dig2,30h
        + or dig1,30h
    + dh - muestra el mes (cmp dh,1)
    + dl - muestra el dia
      + mov al,dl
      + aam - ajuste para que lo muestre descompactado
      + mov cx,ax
      + mov ah,02
      + mov dl,ch - solo por si hay decenas
      + or dl,30
      + int 21h
      + mov dl,cl
      + or dl,30
      + int 21h
      + mov dl,20h
      + int 21h
  + int 21h
  + ret
+ Mover un byte (va y almacena lo que hay en al, 's' cadena, 'b' byte, 'w' palabra)
  + cld
  + mov ax,2a - asterisco
  + mov cl,3
  + lea di,[200]
  + rep stosb - mover un byte
+ Cargar una cadena del tamanio de un byte
  + cld
  + mov cl,5
  + lea si,[200]
  + lea di.[210]
  + lodsw - cargar una cadena del tamnio de un byte
  + mov [di],ax
  + inc di
  + loop 10b - ve a lodsw
+ Divisiòn
  + mov cx,4
  + sub ah,ah
  + lea si,[200]
  + lodsb - salto1
  + and al,0f
  + aad
  + lea si,[210]
  + lea di,[220]
  + mov bl,[si]
  + and bl,0f
  + div bl
  + stosb
  + inc di
  + loop 109 - ve a salto1
+ Macros (pueden ir fuera {.lib} o dentro {arriba de todo el còdigo} del programa)
  + Macro fuera del programa
    + Còdigo en .lib
      + imprimir macro msjImprimir
      + mov ah,09
      + lea dx,msjImprimir
      + int 21h
      + endm
    + Incluir en el programa (include c:\imp.lib)
  + Macro dentro del programa
    + Còdigo de macro
      + divide macro dividend,divisor,cocient
      + mov ax,dividend
      + mov bx,divisor
      + sub cx,cx
      + cmpAXAX: cmp ax,bx
      + jb salir
      + sub ax,bx
      + inc cx
      + jmp cmpAXAX
      + salir: mov cocient,cx
      + endm
    + Incluir macro en el programa (divide divdnd,divisor,cociente)

#### Instrucciones
+ Limpiar carry - clc
+ Comparar con enter - cmp al,13
+ Imprimir asterisco - mov dl,2ah
+ Limpiar bandera de direcciòn - cld
+ Mover un byte - rep movsb, 's' es de cadena y 'b' de byte
+ Compara el byte - repe cmpsb
+ Nùmeros (igualdad de caracteres) - numero equ 7
+ Duplicar caracteres (dup pone 1 menos) - espacio db 2*8 dup (20h),"$"
+ Cuàntos caracteres voy a permitir - reales db ?
+ Mover un byte - rep stosb
---
### Colores (Intensidad Rojo Verde Azul IRVA)
+ Negro            0000
+ Azul             0001
+ Verde            0010
+ Cian             0011
+ Rojo             0100
+ Morado           0101
+ cafe             0110
+ Blanco           0111
+ Gris             1000
+ Azul claro       1001
+ Verde claro      1010
+ Cian             1011
+ Naranja          1100
+ Lila             1101
+ Amarillo         1110
+ Blanco brillante 1111
---
