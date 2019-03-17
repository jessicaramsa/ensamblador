**************** MNEMONICOS HEGEMONICOS ***************
--------------------- CORRIMIENTOS --------------------
shr al,;corrimiento hacia la derecha,cuantas veces
;mas de dos veces solamente con el contador


debug
a
mov al,b6
shr al,1 ; corrimiento a la derecha
mov cl,2
shr al,cl ; corrimiento a la izquierda
shl al,1
shl al,cl
ror al,1 ; rotacion a la derecha
ror al,cl
rol al,1 ; rotacion a la izquierda
rol al,cl
stc
rcr al,cl ; rotacion con carry a la derecha
stc
rcl al,1 ; rotacion con carry a la izquierda

----------------- Comparar (cmp) ----------------------
;internamente efectua una resta
;necesito dos operandos

debug
a
mov al,6
mov cl,3
dec al
cmp al,cl 	; comparar
jne 104 	; salta si no eres igual, jnz
je 100		; salta si eres igual, jz