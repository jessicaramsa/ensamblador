# Mnemónicos Ensamblador

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
  + Nombre (ruta, máx 8 caracteres para nombre) - n c:\8caracte.com
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
