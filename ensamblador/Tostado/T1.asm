PAGE 60,132 
TITLE PROGRAMA1
;-----------------------------------
.MODEL SMALL 
.STACK 32 
;-----------------------------------
.DATA
;-----------------------------------
.CODE 
MAIN PROC FAR 
       MOV AX,@DATA 
       MOV DS,AX 
	   
	   MOV AH,06H ;LIMPIEZA 1
	   MOV AL,00H
	   MOV BH,030D ;COLOR AMARILLO
	   MOV CX,0000H ;PUNTO DE INICIO
	   MOV DX,071bH ;PUNTO DE FINAL
	   INT 10H
	   
	   MOV AH,06H ;LIMPIEZA 2 
	   MOV AL,00H
	   MOV BH,40H ;COLOR ROJO
	   MOV CX,0700H ;PUNTO DE INICIO
	   MOV DX,114fH ;PUNTO DEL FINAL
	   INT 10H
	   
	   MOV AH,06H ;LIMPIEZA 3
	   MOV AL,00H
	   MOV BH,00H ;COLOR NEGRO
	   MOV CX,1100H ;PUNTO DE INICIO
	   MOV DX,244fH ;PUNTO DEL FINAL
	   INT 10H
         
	   ;PAUSA
	   MOV AH, 07H
	   INT 21H
       
       MOV AX, 4C00H  
       INT 21H 
MAIN   ENDP 
       END MAIN 
	   