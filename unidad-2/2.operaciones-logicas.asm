***************** OPERACIONES LOGICAS *****************
------------------- AND (and) -------------------------
debug
a
mov al,ae
mov bl 7b
and al,bl
and al,0f

---------------- OR (suma logica) ---------------------
debug
a
mov al,ae
mov bl,7b
or al,bl
or dx,96
or bh,al
----------------------- XOR ---------------------------
debug
a
mov al,ae
mov bl,7b
xor al,bl
xor dx,96
xor bh,al
---------------- NOT ----------------------------------
; se necesitan dos operandos
not cx
not ah
------------- complemento a 2 (neg) -------------------
neg cx