;----------------------------------------------------------
; MACROS
; pueden ir fuera o dentro del programa
; parametros nulos
;----------------------------------------------------------

;-------------------- FIN DE MACROS -----------------------

.Model small
.Stack 64
.Data

;------------------ Letreros, variables -------------------

nombre db "Jessica","$"
apellido db "Ramirez","$"
espacio db 20h,"$"

;----------------------------------------------------------

;------- Inicializar còdigo
.Code

inicio proc far
		mov ax,@data		;alineacion segmento datos
		mov es,ax
		mov ds,ax
		include c:\imp.lib

		imprimir nombre
		imprimir espacio
		imprimir apellido

		mov ax,4c00h		;fin de programa
		int 21h

inicio endp
end inicio


;masm nombre.asm;
;link nombre;
;nombre