**************** OPERACIONES ARITMETICAS **************
------------------ Suma (add) -------------------------
debug
a
mov al,3
mov bl,5
add al,bl
mov dh,4
mov ch,3
add dh,ch
add bl,dh
add al,[200]
add [200],a
add 3,4
add [200],[201]
add 4,al

-------------------- Resta (sub) ----------------------
debug
a
mov al,3
mov bl,5
sub al,bl
mov dh,4
mov ch,3
sub dh,ch
sub bl,dh
sub al,[200]
sub [200],a
sub 3,4
sub [200],[201]
sub 4,al

-------------------- Suma con acarreo (adc) -----------
debug
a
stc		;encender bandera de carry
mov al,3
adc al,2
adc al,bl

------------------- Resta con acarreo (sbb) -----------
debug
a
stc
mov al,6
sbb al,2

------------------ Incrementar (inc) ------------------
inc cl
------------------ Decrementar (dec) ------------------
debug
a
dec al
dec dh
dec ah
dec ax