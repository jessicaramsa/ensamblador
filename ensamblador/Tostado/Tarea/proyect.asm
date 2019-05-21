   
DATOS SEGMENT
    VAR  DW ? 
    VAR1 DW ?  
    VAR2 DW ?
    VAR3 DW ? 
    VAR4 DW ?
    VAR5 DW ?
    oldvmode DB ?
   ;xxxxxxxxxxxxxxxxxxxxxxx
   ybeg dw 90 
   xbeg dw 90 
   xend dw 90 
   y dw 390 
   x dw 10 
   x1 dw 470   ;columna
   y1 dw 60   ;fila
   xc dw 55    ;radio
   yc dw 55    ;radio
   rad dw 90 
   pc dw 0 
   vaux1 dw 1 
   vincx dw 0 
   vincy dw 0 
   vaux2 dw 0            
DATOS ENDS

PILA SEGMENT
    STACK DW 200H DUP(0)
PILA ENDS   

CODIGO SEGMENT
     
    ASSUME CS:CODIGO,DS:DATOS,SS:PILA
    
INICIO:MOV AX,DATOS 
       MOV DS,AX   
       
       MOV AH,0FH      ;guardar modo texto
       INT 10H
       MOV oldvmode,AL
            
       MOV AX,0012H  ;modo grafico, menor sea el 
       INT 10H 
               
       MOV CX,0
       MOV DX,0
  M3:  CALL COLOR1
       INC CX
       CMP CX,720
       JE N3
       JMP M3
  N3:  MOV CX,0
       INC DX
       CMP DX,500
       JE SIGJU  
       JMP M3          
SIGJU:     
       MOV CX,500
       MOV DX,200
  JU:  CALL COLOR3
       INC CX
       CMP CX,520
       JE JU1
       JMP JU
  JU1:  MOV CX,500
       INC DX
       CMP DX,220
       JE SIGJU1   
       JMP JU       
SIGJU1:
       MOV CX,500
       MOV DX,230
  JU2:  CALL COLOR4
       INC CX
       CMP CX,520
       JE JU3
       JMP JU2
  JU3:  MOV CX,500
       INC DX
       CMP DX,250
       JE SIGJU2   
       JMP JU2 

;xxxxxxxxxxxxxxx LETRA "O" xxxxxxxxxxxxxxxxxxxxxxxxxxxxx 
SIGJU2:MOV CX,530
       MOV DX,205      
  JU20:  CALL COLOR6
       INC DX
       CMP DX,215     ;tamaño  vertical
       JE JU21
       JMP JU20          
  JU21:  INC CX
  Z7U:  CALL COLOR6
       DEC DX
       CMP DX,205    ;regresa su valor de fila
       JE JU20
       CMP CX,535     ;grosor de letra
       JE SJU1
       JMP Z7U 
              
SJU1:  MOV CX,535
       MOV DX,200      
  JU22:  CALL COLOR6
       INC CX
       CMP CX,545     ;tamaño horizontal
       JE JU23
       JMP JU22
 JU23:  INC DX
  Z8U:  CALL COLOR6
       DEC CX
       CMP CX,535    ;regresa su valor columna
       JE JU22
       CMP DX,205
       JE SJU2
       JMP Z8U 
       
SJU2:  MOV CX,535
       MOV DX,220      
JU24:  CALL COLOR6
       INC CX
       CMP CX,545        ;tamaño horizontal regreso
       JE JU25
       JMP JU24
JU25:  DEC DX              
  Z9U:  CALL COLOR6
       DEC CX
       CMP CX,535        ;regresa su valor columna
       JE JU24
       CMP DX,215        
       JE SJU3
       JMP Z9U 
       
SJU3:  MOV CX,545
       MOV DX,205      
  JU26:CALL COLOR6
       INC DX
       CMP DX,215     ;tamaño  vertical
       JE JU27
       JMP JU26          
  JU27:INC CX
  Z10U:CALL COLOR6
       DEC DX
       CMP DX,205     ;regresa su valor de fila
       JE JU26
       CMP CX,550     ;grosor de letra
       JE SIGJU3
       JMP Z10U        
   ;xxxxxxxxxxxxxxxxxx LETRA N xxxxxxxxxxxxxxxxxxx  
SIGJU3:MOV CX,560
       MOV DX,220      
  M10H: CALL COLOR6
       DEC DX
       CMP DX,200   ;tamaño vertical para atras
       JE N10H
       JMP M10H          
  N10H: DEC CX
  Z10H: CALL COLOR6
       INC DX     
       CMP DX,220   ;regresa a su valor
       JE M10H
       CMP CX,555    ;grosor de la letra
       JE SWH
       JMP Z10H
       
  SWH:  MOV CX,575
       MOV DX,220      
  M11H: CALL COLOR6
       DEC DX
       CMP DX,200   ;tamaño vertical para atras
       JE N11H
       JMP M11H          
  N11H: DEC CX
  Z11H: CALL COLOR6
       INC DX
       CMP DX,220   ;regresa a su valor
       JE M11H
       CMP CX,570   ;grosor de la letra
       JE SWH1
       JMP Z11H
       
  SWH1: MOV CX,565
       MOV DX,210      
  M12H: CALL COLOR6
       DEC DX
       CMP DX,205   ;tamaño vertical para atras
       JE N12H
       JMP M12H          
  N12H: DEC CX
  Z12H: CALL COLOR6
       INC DX
       CMP DX,210   ;regresa a su valor
       JE M12H
       CMP CX,560    ;grosor de la letra
       JE SWH2
       JMP Z12H
        
 SWH2: MOV CX,570
       MOV DX,215      
  M13H: CALL COLOR6
       DEC DX
       CMP DX,210   ;tamaño vertical para atras
       JE N13H
       JMP M13H          
  N13H: DEC CX
  Z13H: CALL COLOR6
       INC DX
       CMP DX,215   ;regresa a su valor
       JE M13H
       CMP CX,565    ;grosor de la letra
       JE  SIG3
       JMP Z13H    
   ;xxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx   
       
SIG3:  MOV CX,10     ;columna de inicio                        
       MOV DX,10    ;fila de inicio 
  M:   CALL COLOR
       INC CX
       CMP CX,110
       JE N
       JMP M
  N:   MOV CX,10
       INC DX
       CMP DX,110
       JE SIG     
       JMP M      
                  
SIG:   MOV CX,130
       MOV DX,30 
  M1:  CALL COLOR
       INC CX
       CMP CX,250
       JE N1
       JMP M1
  N1:  MOV CX,130
       INC DX
       CMP DX,110
       JE SIG1     
       JMP M1 
      
SIG1:  MOV DX,10
       MOV CX,270
       MOV VAR,270 
       MOV VAR3,420
  M2:  CALL COLOR
       INC CX
       CMP CX,VAR3
       JE N2
       JMP M2 
  N2:  INC DX
       DEC VAR3
       INC VAR
  YS1: CALL COLOR
       DEC CX 
       CMP CX,VAR
       JE M2
       CMP DX,84  
       JE LETRAS
       JMP YS1 
        
;xxxxxxxxxxxxxxxxxxxxx-La letras "C"-xxxxxxxxxxxxx
LETRAS:MOV CX,5       ;mayor
       MOV DX,300      
  M7:  CALL COLOR
       INC DX
       CMP DX,330     ;tamaño vertical
       JE N7
       JMP M7          
  N7:  INC CX
  Z7:  CALL COLOR
       DEC DX
       CMP DX,300     ;regresa valor de fila
       JE M7
       CMP CX,10      ;grosor de letra(menor 5)
       JE S1          
       JMP Z7        
S1:    MOV CX,10
       MOV DX,300    ;menor  
  M8:  CALL COLOR
       INC CX
       CMP CX,25      ;tamaño horizontal
       JE N8
       JMP M8
  N8:  INC DX
  Z8:  CALL COLOR
       DEC CX
       CMP CX,10     ;regresa su valor de columna
       JE M8
       CMP DX,305    ;grosor de letra (mayor 5)
       JE S2
       JMP Z8
S2:    MOV CX,10
       MOV DX,330     ;mayor 5 
  M9:  CALL COLOR
       INC CX
       CMP CX,25      ;tamaño horizontal (para atras)
       JE N9
       JMP M9
  N9:  DEC DX
  Z9:  CALL COLOR
       DEC CX
       CMP CX,10      ;regresa su valor de columna
       JE M9
       CMP DX,325     ;grosor de letra(menor 5)
       JE SIGUE1
       JMP Z9 
;xxxxxxxxxxxxxxxxxxx LETRA "U" xxxxxxxxxxxxxxxxxxxxxx
SIGUE1:MOV CX,35
       MOV DX,330      
  M10: CALL COLOR
       DEC DX
       CMP DX,300   ;tamaño vertical
       JE N10
       JMP M10          
  N10: DEC CX
  Z10: CALL COLOR
       INC DX
       CMP DX,330   ;regresa a su valor
       JE M10
       CMP CX,30    ;grosor de la letra
       JE S3
       JMP Z10      
S3:    MOV CX,35
       MOV DX,330      
  M11:  CALL COLOR
       INC CX
       CMP CX,50      ;en horizontal tamaño
       JE N11
       JMP M11
  N11: DEC DX
  Z11: CALL COLOR
       DEC CX
       CMP CX,35      ;regresa a su valor
       JE M11
       CMP DX,325     ;grosor de letra
       JE S4
       JMP Z11 
       ;xxxxx palito de abajo hacia arriba     
S4:    MOV CX,55
       MOV DX,330      
  M12: CALL COLOR
       DEC DX
       CMP DX,300      ;vertical tamña 
       JE N12
       JMP M12          
  N12: DEC CX
  Z12: CALL COLOR
       INC DX
       CMP DX,330      ;regresa a su valor
       JE M12
       CMP CX,50       ;grosor de letra
       JE SIGUE2
       JMP Z12 
;xxxxxxxxxxxxxxxxx LETRA "A" xxxxxxxxxxxxx
SIGUE2:MOV CX,60
       MOV DX,300      
  M13: CALL COLOR
       INC DX
       CMP DX,330     ;tamño vertical
       JE N13
       JMP M13          
  N13:  INC CX
  Z13:  CALL COLOR
       DEC DX
       CMP DX,300      ;regresa a su valor de fila
       JE M13
       CMP CX,65       ;tamaño de letra
       JE S5
       JMP Z13        
S5:    MOV CX,65
       MOV DX,300      
  M14: CALL COLOR
       INC CX
       CMP CX,80    ;tamaño horizontal
       JE N14
       JMP M14
  N14:  INC DX
  Z14:  CALL COLOR
       DEC CX
       CMP CX,65      ;regresa a su valor de columna
       JE M14
       CMP DX,305     ;grosor de letra
       JE S6
       JMP Z14
S6:    MOV CX,80
       MOV DX,300      
  M15: CALL COLOR
       INC DX
       CMP DX,330     ;tamño vertical
       JE N15
       JMP M15          
  N15: INC CX
  Z15: CALL COLOR
       DEC DX
       CMP DX,300      ;regresa a su valor de fila
       JE M15
       CMP CX,85       ;tamaño de letra
       JE S7
       JMP Z15    
S7:    MOV CX,65
       MOV DX,315      
  M16: CALL COLOR
       INC CX
       CMP CX,80    ;tamaño horizontal
       JE N16
       JMP M16
  N16:  INC DX
  Z16:  CALL COLOR
       DEC CX
       CMP CX,65      ;regresa a su valor de columna
       JE M16
       CMP DX,318     ;grosor de letra
       JE SIGUE3
       JMP Z16 
 ;xxxxxxxxxxxxxxxxxxxxx LETRA D xxxxxxxxxxxxxx
SIGUE3:MOV CX,90
       MOV DX,300      
  M17: CALL COLOR
       INC DX
       CMP DX,330    ;tamaño vertical
       JE N17
       JMP M17          
  N17:  INC CX
  Z17:  CALL COLOR
       DEC DX
       CMP DX,300    ;regresa su valor de fila
       JE M17
       CMP CX,95      ;grosor de letra
       JE S8
       JMP Z17        
S8:    MOV CX,95
       MOV DX,300      
  M18:  CALL COLOR
       INC CX
       CMP CX,105     ;tamaño horizontal
       JE N18
       JMP M18
  N18:  INC DX
  Z18:  CALL COLOR
       DEC CX
       CMP CX,95      ;regersa su valor de columna
       JE M18
       CMP DX,305     ;grosor de letra
       JE S9
       JMP Z18
S9:    MOV CX,95
       MOV DX,330      
  M19: CALL COLOR
       INC CX
       CMP CX,105       ;tamaño horizontal
       JE N19
       JMP M19
  N19: DEC DX
  Z19: CALL COLOR
       DEC CX
       CMP CX,95        ;regresa su valor de columna
       JE M19
       CMP DX,325
       JE S10
       JMP Z19 
S10:   MOV CX,110
       MOV DX,325      
  M20: CALL COLOR
       DEC DX
       CMP DX,305      ;vertical tamña 
       JE N20
       JMP M20          
  N20: DEC CX
  Z20: CALL COLOR
       INC DX
       CMP DX,325      ;regresa a su valor
       JE M20
       CMP CX,105      ;grosor de letra
       JE SIGUE4
       JMP Z20 
  ;xxxxxxxxxxLETRA R xxxxxxxxxx
SIGUE4:MOV CX,115
       MOV DX,300      
  M21: CALL COLOR
       INC DX
       CMP DX,330     ;tamño vertical corre para adelante
       JE N21
       JMP M21          
  N21:  INC CX
  Z21:  CALL COLOR
       DEC DX
       CMP DX,300      ;regresa a su valor de fila
       JE M21
       CMP CX,120       ;tamaño de letra
       JE S11
       JMP Z21        
S11:   MOV CX,120
       MOV DX,300      
  M22: CALL COLOR
       INC CX
       CMP CX,135    ;tamaño horizontal para adelante
       JE N22
       JMP M22
  N22:  INC DX
  Z22:  CALL COLOR
       DEC CX
       CMP CX,120     ;regresa a su valor de columna
       JE M22
       CMP DX,305     ;grosor de letra
       JE S12
       JMP Z22
S12:   MOV CX,135
       MOV DX,305      
  M23: CALL COLOR
       INC DX
       CMP DX,315     ;tamño vertical
       JE N23
       JMP M23          
  N23: INC CX
  Z23: CALL COLOR
       DEC DX
       CMP DX,305      ;regresa a su valor de fila
       JE M23
       CMP CX,140       ;tamaño de letra
       JE S13
       JMP Z23    
S13:    MOV CX,120
       MOV DX,315      
  M24: CALL COLOR
       INC CX
       CMP CX,135    ;tamaño horizontal
       JE N24
       JMP M24
  N24:  INC DX
  Z24:  CALL COLOR
       DEC CX
       CMP CX,120      ;regresa a su valor de columna
       JE M24
       CMP DX,318     ;grosor de letra
       JE S14
       JMP Z24 
S14:    MOV CX,135
       MOV DX,320      
  M25: CALL COLOR
       INC DX
       CMP DX,330     ;tamño vertical
       JE N25
       JMP M25          
  N25: INC CX
  Z25: CALL COLOR
       DEC DX
       CMP DX,320      ;regresa a su valor de fila
       JE M25
       CMP CX,140       ;tamaño de letra
       JE SIGUE5
       JMP Z25
;xxxxxxxxxxxxxxxxx LETRA "A" xxxxxxxxxxxxx
SIGUE5:MOV CX,145
       MOV DX,300      
  M26: CALL COLOR
       INC DX
       CMP DX,330     ;tamño vertical
       JE N26
       JMP M26          
  N26: INC CX
  Z26: CALL COLOR
       DEC DX
       CMP DX,300      ;regresa a su valor de fila
       JE M26
       CMP CX,150       ;tamaño de letra
       JE S15
       JMP Z26        
S15:   MOV CX,150
       MOV DX,300      
  M27: CALL COLOR
       INC CX
       CMP CX,165    ;tamaño horizontal
       JE N27
       JMP M27
  N27:  INC DX
  Z27:  CALL COLOR
       DEC CX
       CMP CX,150      ;regresa a su valor de columna
       JE M27
       CMP DX,305     ;grosor de letra
       JE S16
       JMP Z27
S16:    MOV CX,165
       MOV DX,300      
  M28: CALL COLOR
       INC DX
       CMP DX,330     ;tamño vertical
       JE N28
       JMP M28          
  N28: INC CX
  Z28: CALL COLOR
       DEC DX
       CMP DX,300      ;regresa a su valor de fila
       JE M28
       CMP CX,170       ;tamaño de letra
       JE S17
       JMP Z28    
S17:    MOV CX,150
       MOV DX,315      
  M29: CALL COLOR
       INC CX
       CMP CX,165   ;tamaño horizontal
       JE N29
       JMP M29
  N29:  INC DX
  Z29:  CALL COLOR
       DEC CX
       CMP CX,150      ;regresa a su valor de columna
       JE M29
       CMP DX,318     ;grosor de letra
       JE SIGUE6
       JMP Z29   
;xxxxxxxxxxxxxxxxxxxxx LETRA D xxxxxxxxxxxxxx 
SIGUE6:MOV CX,175
       MOV DX,300      
  Mx: CALL COLOR
       INC DX
       CMP DX,330    ;tamaño vertical
       JE Nx
       JMP Mx          
  Nx:  INC CX
  Zx:  CALL COLOR
       DEC DX
       CMP DX,300    ;regresa su valor de fila
       JE Mx
       CMP CX,180      ;grosor de letra
       JE S8x
       JMP Zx        
S8x:    MOV CX,185
       MOV DX,300      
  M18x:  CALL COLOR
       INC CX
       CMP CX,190     ;tamaño horizontal
       JE N18x
       JMP M18x
  N18x:  INC DX
  Z18x:  CALL COLOR
       DEC CX
       CMP CX,175      ;regersa su valor de columna
       JE M18x
       CMP DX,305     ;grosor de letra
       JE S9x
       JMP Z18x
S9x:    MOV CX,175
       MOV DX,330      
  M19x: CALL COLOR
       INC CX
       CMP CX,190       ;tamaño horizontal
       JE N19x
       JMP M19x
  N19x: DEC DX
  Z19x: CALL COLOR
       DEC CX
       CMP CX,175        ;regresa su valor de columna
       JE M19x
       CMP DX,325
       JE S10x
       JMP Z19x 
S10x:   MOV CX,195
       MOV DX,325      
  M20x: CALL COLOR
       DEC DX
       CMP DX,305      ;Tamaño vertical DE REGRESO 
       JE N20x
       JMP M20x          
  N20x: DEC CX
  Z20x: CALL COLOR
       INC DX
       CMP DX,325      ;regresa a su valor
       JE M20x
       CMP CX,190      ;grosor de letra
       JE SIGUE7
       JMP Z20x          
;xxxxxxxxxxxxxxx LETRA "O" xxxxxxxxxxxxxxxxxxxxxxxxxxxxx 
SIGUE7:MOV CX,200
       MOV DX,305      
  M7x:  CALL COLOR
       INC DX
       CMP DX,325     ;tamaño  vertical
       JE N7x
       JMP M7x          
  N7x:  INC CX
  Z7x:  CALL COLOR
       DEC DX
       CMP DX,305     ;regresa su valor de fila
       JE M7x
       CMP CX,205     ;grosor de letra
       JE S1x
       JMP Z7x        
S1x:    MOV CX,205
       MOV DX,300      
  M8x:  CALL COLOR
       INC CX
       CMP CX,220     ;tamaño horizontal
       JE N8x
       JMP M8x
  N8x:  INC DX
  Z8x:  CALL COLOR
       DEC CX
       CMP CX,205    ;regresa su valor columna
       JE M8x
       CMP DX,305
       JE S2x
       JMP Z8x
S2x:    MOV CX,205
       MOV DX,330      
  M9x:  CALL COLOR
       INC CX
       CMP CX,220        ;tamaño horizontal regreso
       JE N9x
       JMP M9x
  N9x:  DEC DX              
  Z9x:  CALL COLOR
       DEC CX
       CMP CX,205         ;regresa su valor columna
       JE M9x
       CMP DX,325        
       JE s3x
       JMP Z9x 
s3x:   MOV CX,220
       MOV DX,305      
  M7xx:  CALL COLOR
       INC DX
       CMP DX,325     ;tamaño  vertical
       JE N7xx
       JMP M7xx          
  N7xx:INC CX
  Z7xx:CALL COLOR
       DEC DX
       CMP DX,305     ;regresa su valor de fila
       JE M7xx
       CMP CX,225     ;grosor de letra
       JE SIGQ
       JMP Z7xx 
     ;xxxxxxxxxxxxx CUADRO DE ENCERRAR LETRA xxxxxxxxxxx      
SIGQ:  MOV CX,2
       MOV DX,298
   X1X:CALL COLOR 
       INC CX
       CMP CX,227
       JE SZz
       JMP X1X
  SZz:  CALL COLOR
       INC DX
       CMP DX,332
       JE XZz 
       JMP SZz
  XZz:  CALL COLOR
       DEC CX
       CMP CX,2
       JE YzZ
       JMP XZz
  YzZ:  CALL COLOR
       DEC DX
       CMP DX,298
       JE SIGUE8
       JMP YzZ   
;xxxxxxxxxxxxxxx LETRA T xxxxxxxxxxxx
SIGUE8:MOV CX,270
       MOV DX,330      
  M10X: CALL COLOR
       DEC DX
       CMP DX,305   ;tamaño vertical para atras
       JE N10X
       JMP M10X          
  N10X: DEC CX
  Z10X: CALL COLOR
       INC DX
       CMP DX,330   ;regresa a su valor
       JE M10X
       CMP CX,265    ;grosor de la letra
       JE Sx3
       JMP Z10X
Sx3:   MOV CX,258
       MOV DX,305      
  M11X:  CALL COLOR
       INC CX
       CMP CX,277      ;en horizontal tamaño
       JE N11X
       JMP M11X
  N11X: DEC DX
  Z11X: CALL COLOR
       DEC CX
       CMP CX,258      ;regresa a su valor ce columna
       JE M11X
       CMP DX,300     ;grosor de letra
       JE SIGUE9
       JMP Z11X 
 ;xxxxxxxxxxxxxxxxxxxxxx LETRA R xxxxxxxxxx
SIGUE9:MOV CX,280  ;menor
       MOV DX,300  ;menor1   
  M21C: CALL COLOR
       INC DX
       CMP DX,330     ;tamño vertical(mayor1) 
       JE N21C
       JMP M21C          
  N21C:  INC CX
  Z21C:  CALL COLOR
       DEC DX
       CMP DX,300      ;regresa a su valor de fila
       JE M21C
       CMP CX,285       ;tamaño de letra(mayor)
       JE S11C
       JMP Z21C        
S11C:   MOV CX,285
       MOV DX,300      
  M22C: CALL COLOR
       INC CX
       CMP CX,300    ;tamaño horizontal para adelante
       JE N22C
       JMP M22C
  N22C:  INC DX
  Z22C:  CALL COLOR
       DEC CX
       CMP CX,285     ;regresa a su valor de columna
       JE M22C
       CMP DX,305     ;grosor de letra
       JE S12C
       JMP Z22C
S12C:   MOV CX,300
       MOV DX,305      
  M23C: CALL COLOR
       INC DX
       CMP DX,315     ;tamño vertical
       JE N23C
       JMP M23C          
  N23C: INC CX
  Z23C: CALL COLOR
       DEC DX
       CMP DX,305      ;regresa a su valor de fila
       JE M23C
       CMP CX,305       ;grosor de letra
       JE S13C
       JMP Z23C    
S13C:    MOV CX,285
       MOV DX,315      
  M24C: CALL COLOR
       INC CX
       CMP CX,300   ;tamaño horizontal
       JE N24C
       JMP M24C
  N24C:  INC DX
  Z24C:  CALL COLOR
       DEC CX
       CMP CX,285      ;regresa a su valor de columna
       JE M24C
       CMP DX,318     ;grosor de letra
       JE S14C
       JMP Z24C 
S14C: MOV CX,300
       MOV DX,320      
  M25C: CALL COLOR
       INC DX
       CMP DX,330     ;tamño vertical
       JE N25C
       JMP M25C          
  N25C: INC CX
  Z25C: CALL COLOR
       DEC DX
       CMP DX,320      ;regresa a su valor de fila
       JE M25C
       CMP CX,305       ;tamaño de letra
       JE SIGUE10
       JMP Z25C
  ;xxxxxxxxxxxx LETRA I xxxxxxxx
SIGUE10:MOV CX,315
       MOV DX,330      
  M10v: CALL COLOR
       DEC DX
       CMP DX,300   ;tamaño vertical para atras
       JE N10v
       JMP M10v          
  N10v: DEC CX
  Z10v: CALL COLOR
       INC DX
       CMP DX,330   ;regresa a su valor
       JE M10v
       CMP CX,310    ;grosor de la letra
       JE SIGUE11
       JMP Z10v 
 ;xxxxxxxxxxxxxxxxxx LETRA A xxxxxxxxx
SIGUE11:MOV CX,320
       MOV DX,300      
  M26V: CALL COLOR
       INC DX
       CMP DX,330     ;tamño vertical
       JE N26V
       JMP M26V          
  N26V: INC CX
  Z26V: CALL COLOR
       DEC DX
       CMP DX,300      ;regresa a su valor de fila
       JE M26V
       CMP CX,325       ;tamaño de letra
       JE S15V
       JMP Z26V        
S15V:   MOV CX,325
       MOV DX,300      
  M27V: CALL COLOR
       INC CX
       CMP CX,340    ;tamaño horizontal
       JE N27V
       JMP M27V
  N27V:  INC DX
  Z27V:  CALL COLOR
       DEC CX
       CMP CX,325      ;regresa a su valor de columna
       JE M27V
       CMP DX,305     ;grosor de letra
       JE S16V
       JMP Z27V
S16V:    MOV CX,340
       MOV DX,300      
  M28V: CALL COLOR
       INC DX
       CMP DX,330     ;tamño vertical
       JE N28V
       JMP M28V          
  N28V: INC CX
  Z28V: CALL COLOR
       DEC DX
       CMP DX,300      ;regresa a su valor de fila
       JE M28V
       CMP CX,345       ;tamaño de letra
       JE S17V
       JMP Z28V    
S17V:    MOV CX,325
       MOV DX,315      
  M29V: CALL COLOR
       INC CX
       CMP CX,340   ;tamaño horizontal
       JE N29V
       JMP M29V
  N29V:  INC DX
  Z29V:  CALL COLOR
       DEC CX
       CMP CX,325      ;regresa a su valor de columna
       JE M29V
       CMP DX,318     ;grosor de letra
       JE SIGUE12
       JMP Z29V 
     ;xxxxxxxxxxx LETRA N xxxxxxxxxxxxx
SIGUE12:MOV CX,355
       MOV DX,330      
  M10L: CALL COLOR
       DEC DX
       CMP DX,300   ;tamaño vertical para atras
       JE N10L
       JMP M10L          
  N10L: DEC CX
  Z10L: CALL COLOR
       INC DX
       CMP DX,330   ;regresa a su valor
       JE M10L
       CMP CX,350    ;grosor de la letra
       JE SW
       JMP Z10L
  SW:  MOV CX,375
       MOV DX,330      
  M11v: CALL COLOR
       DEC DX
       CMP DX,300   ;tamaño vertical para atras
       JE N11v
       JMP M11v          
  N11v: DEC CX
  Z11v: CALL COLOR
       INC DX
       CMP DX,330   ;regresa a su valor
       JE M11v
       CMP CX,370    ;grosor de la letra
       JE SW1
       JMP Z11v
  SW1: MOV CX,362
       MOV DX,315      
  M12v: CALL COLOR
       DEC DX
       CMP DX,305   ;tamaño vertical para atras
       JE N12v
       JMP M12v          
  N12v: DEC CX
  Z12v: CALL COLOR
       INC DX
       CMP DX,315   ;regresa a su valor
       JE M12v
       CMP CX,355    ;grosor de la letra
       JE SW2
       JMP Z12v 
  SW2: MOV CX,370
       MOV DX,325      
  M13v: CALL COLOR
       DEC DX
       CMP DX,315   ;tamaño vertical para atras
       JE N13v
       JMP M13v          
  N13v: DEC CX
  Z13v: CALL COLOR
       INC DX
       CMP DX,325   ;regresa a su valor
       JE M13v
       CMP CX,363    ;grosor de la letra
       JE  SIGUE13
       JMP Z13v 
  ;xxxxxxxxxxxxxxxx LETRA G xxxxxxxxxxxxxxx
SIGUE13:MOV CX,380       ;menor
       MOV DX,300      
  MF7:  CALL COLOR
       INC DX
       CMP DX,330     ;tamaño vertical
       JE NF7
       JMP MF7          
  NF7:  INC CX
  ZF7:  CALL COLOR
       DEC DX
       CMP DX,300     ;regresa valor de fila
       JE MF7
       CMP CX,385      ;grosor de letra(mayor 5)
       JE SF1          
       JMP ZF7        
SF1:    MOV CX,385
       MOV DX,300    ;menor  
  MF8:  CALL COLOR
       INC CX
       CMP CX,400     ;tamaño horizontal
       JE NF8
       JMP MF8
  NF8:  INC DX
  ZF8:  CALL COLOR
       DEC CX
       CMP CX,385     ;regresa su valor de columna
       JE MF8
       CMP DX,305    ;grosor de letra (mayor 5)
       JE SF2
       JMP ZF8
SF2:   MOV CX,380
       MOV DX,330     ;mayor 
  MF9:  CALL COLOR
       INC CX
       CMP CX,395     ;tamaño horizontal (para atras)
       JE NF9
       JMP MF9
  NF9:  DEC DX
  ZF9:  CALL COLOR
       DEC CX
       CMP CX,380      ;regresa su valor de columna
       JE MF9
       CMP DX,325     ;grosor de letra(menor 5)
       JE SF3
       JMP ZF9
SF3:   MOV CX,400     ;mayor
       MOV DX,330     ;mayor1 
  M12F: CALL COLOR
       DEC DX
       CMP DX,315   ;tamaño vertical para atras(menor1)
       JE N12F
       JMP M12F          
  N12F: DEC CX
  Z12F: CALL COLOR
       INC DX
       CMP DX,330   ;regresa a su valor
       JE M12F
       CMP CX,395    ;grosor de la letra (menor)
       JE S4F
       JMP Z12F
S4F:   MOV CX,395   ;mayor
       MOV DX,320   ;mayor1   
  M13F: CALL COLOR  
       DEC DX
       CMP DX,315   ;tamaño vertical para atras(menor1)
       JE N13F
       JMP M13F          
  N13F: DEC CX
  Z13F: CALL COLOR
       INC DX
       CMP DX,320   ;regresa a su valor
       JE M13F
       CMP CX,390    ;grosor de la letra(menor)
       JE  SIGUE14
       JMP Z13F  
 ;xxxxxxxxxxxxxxxxxxx LETRA "U" xxxxxxxxxxxxxxxxxxxxxx
SIGUE14:MOV CX,410  ;MAYOR
       MOV DX,330      
  F1: CALL COLOR
       DEC DX
       CMP DX,300   ;tamaño vertical
       JE F2
       JMP F1          
  F2: DEC CX
  F3: CALL COLOR
       INC DX
       CMP DX,330   ;regresa a su valor
       JE F1
       CMP CX,405    ;grosor de la letra (MENOR)
       JE F4
       JMP F3      
F4:    MOV CX,410  ;menor
       MOV DX,330  ;mayor      
  F5:  CALL COLOR
       INC CX
       CMP CX,425     ;en horizontal tamaño(mayor)
       JE F6
       JMP F5
  F6: DEC DX
  F7: CALL COLOR
       DEC CX
       CMP CX,410      ;regresa a su valor
       JE F5
       CMP DX,325     ;grosor de letra(menor)
       JE F8
       JMP F7      
F8:    MOV CX,430    ;MAYOR
       MOV DX,330    ;MAYOR1  
  MP12: CALL COLOR
       DEC DX
       CMP DX,300      ;vertical tamña(MENOR1) 
       JE NP12
       JMP MP12          
  NP12: DEC CX
  ZP12: CALL COLOR
       INC DX
       CMP DX,330      ;regresa a su valor
       JE MP12
       CMP CX,425      ;grosor de letra (MENOR)
       JE SIGUE15
       JMP ZP12 
   ;xxxxxxxxxxxxx LETRA "L" xxxxxxxxxxxxxx
SIGUE15:MOV CX,435       ;menor
       MOV DX,300      
  MF7X:  CALL COLOR
       INC DX
       CMP DX,330     ;tamaño vertical
       JE NF7X
       JMP MF7X          
  NF7X:  INC CX
  ZF7X:  CALL COLOR
       DEC DX
       CMP DX,300     ;regresa valor de fila
       JE MF7X
       CMP CX,440      ;grosor de letra(mayor)
       JE SF2X          
       JMP ZF7X        
SF2X:   MOV CX,440
       MOV DX,330     ;mayor 
  MF9X:  CALL COLOR
       INC CX
       CMP CX,455     ;tamaño horizontal 
       JE NF9X
       JMP MF9X
  NF9X:  DEC DX
  ZF9X:  CALL COLOR
       DEC CX
       CMP CX,440      ;regresa su valor de columna
       JE MF9X
       CMP DX,325     ;grosor de letra(menor 5)
       JE  SIGUE16
       JMP ZF9X 
;xxxxxxxxxxxxxxx LETRA "O" xxxxxxxxxxxxxxxxxxx
SIGUE16:MOV CX,460
       MOV DX,305      
  MP7x:  CALL COLOR
       INC DX
       CMP DX,325     ;tamaño  vertical
       JE NP7x
       JMP MP7x          
  NP7x:  INC CX
  ZP7x:  CALL COLOR
       DEC DX
       CMP DX,305     ;regresa su valor de fila
       JE MP7x
       CMP CX,465     ;grosor de letra
       JE SP1x
       JMP ZP7x        
SP1x:    MOV CX,465
       MOV DX,300      
  MP8x:  CALL COLOR
       INC CX
       CMP CX,480     ;tamaño horizontal
       JE NP8x
       JMP MP8x
  NP8x:  INC DX
  ZP8x:  CALL COLOR
       DEC CX
       CMP CX,465    ;regresa su valor columna
       JE MP8x
       CMP DX,305    ;grosor de letra
       JE SP2x
       JMP ZP8x
SP2x:    MOV CX,465      ;menor1
       MOV DX,330       ;mayor
  MP9x:  CALL COLOR
       INC CX
       CMP CX,480        ;tamaño horizontal(mayor1)
       JE NP9x
       JMP MP9x
  NP9x:  DEC DX              
  ZP9x:  CALL COLOR
       DEC CX
       CMP CX,465         ;regresa su valor columna
       JE MP9x
       CMP DX,325         ;grosor de letra(menor) 
       JE sP3x
       JMP ZP9x 
sP3x:   MOV CX,480   
       MOV DX,305      
  MP7xx:  CALL COLOR
       INC DX
       CMP DX,325     ;tamaño  vertical
       JE NP7xx
       JMP MP7xx          
  NP7xx:INC CX
  ZP7xx:CALL COLOR
       DEC DX
       CMP DX,305     ;regresa su valor de fila
       JE MP7xx
       CMP CX,485     ;grosor de letra
       JE SIGQ1
       JMP ZP7xx
  ;xxxxxxxxxxxxx CUADRO DE ENCERRAR LETRA xxxxxxxxxxx      
SIGQ1: MOV CX,255
       MOV DX,298
   X2X:CALL COLOR 
       INC CX
       CMP CX,488
       JE SZzZ
       JMP X2X
  SZzZ:  CALL COLOR
       INC DX
       CMP DX,332
       JE XZzZ 
       JMP SZzZ
  XZzZ:  CALL COLOR
       DEC CX
       CMP CX,255
       JE YzZZ
       JMP XZzZ
  YzZZ:  CALL COLOR
       DEC DX
       CMP DX,298
       JE SIGUE17
       JMP YzZZ 
  ;xxxxxxxxxxxxxxxxxx LETRA C xxxxxxxxxxxxxxx     
SIGUE17:MOV CX,10       ;menor
       MOV DX,345      
  Mn7:  CALL COLOR
       INC DX
       CMP DX,375     ;tamaño vertical
       JE Nn7
       JMP Mn7          
  Nn7:  INC CX
  Zn7:  CALL COLOR
       DEC DX
       CMP DX,345     ;regresa valor de fila
       JE Mn7
       CMP CX,15      ;grosor de letra(mayor 5)
       JE Sn1          
       JMP Zn7        
Sn1:    MOV CX,15
       MOV DX,345    ;menor  
  Mn8:  CALL COLOR
       INC CX
       CMP CX,30      ;tamaño horizontal
       JE Nn8
       JMP Mn8
  Nn8:  INC DX
  Zn8:  CALL COLOR
       DEC CX
       CMP CX,15     ;regresa su valor de columna
       JE Mn8
       CMP DX,350    ;grosor de letra (mayor 5)
       JE Sn2
       JMP Zn8
Sn2:    MOV CX,15
       MOV DX,375     ;mayor 5 
  Mn9:  CALL COLOR
       INC CX
       CMP CX,30      ;tamaño horizontal (para atras)
       JE Nn9
       JMP Mn9
  Nn9:  DEC DX
  Zn9:  CALL COLOR
       DEC CX
       CMP CX,15      ;regresa su valor de columna
       JE Mn9
       CMP DX,370     ;grosor de letra(menor 5)
       JE SIGUE18
       JMP Zn9 
    ;xxxxxxxxxxxxxxxxx LETRA I xxxxxxxxxxxxxxxx  
SIGUE18:MOV CX,40  ;mayor
       MOV DX,375  ;mayor1    
  M11vv: CALL COLOR
       DEC DX
       CMP DX,345   ;tamaño vertical(menor1)
       JE N11vv
       JMP M11vv          
  N11vv: DEC CX
  Z11vv: CALL COLOR
       INC DX
       CMP DX,375   ;regresa a su valor
       JE M11vv
       CMP CX,35    ;grosor de la letra(menor)
       JE SIGUE19
       JMP Z11vv
     ;xxxxxxxxxxxxxxxxx LETRA R xxxxxxxxxxxxx     
SIGUE19:MOV CX,45    ;memor
       MOV DX,345      
  M1v: CALL COLOR
       INC DX
       CMP DX,375     ;tamño vertical 
       JE N1v
       JMP M1v          
  N1v:  INC CX
  Z1v:  CALL COLOR
       DEC DX
       CMP DX,345      ;regresa a su valor de fila
       JE M1v
       CMP CX,50       ;tamaño de letra(mayor)
       JE S1v
       JMP Z1v        
S1v:   MOV CX,50
       MOV DX,345      
  M2v: CALL COLOR
       INC CX
       CMP CX,65    ;tamaño horizontal para adelante
       JE N2v
       JMP M2v
  N2v:  INC DX
  Z2v:  CALL COLOR
       DEC CX
       CMP CX,50     ;regresa a su valor de columna
       JE M2v
       CMP DX,350     ;grosor de letra
       JE S2v
       JMP Z2v
S2v:   MOV CX,65    ;menor
       MOV DX,350      
  M3v: CALL COLOR
       INC DX
       CMP DX,360     ;tamño vertical
       JE N3v
       JMP M3v          
  N3v: INC CX
  Z3v: CALL COLOR
       DEC DX
       CMP DX,350      ;regresa a su valor de fila
       JE M3v
       CMP CX,70       ;tamaño de letra(mayor)
       JE S3v
       JMP Z3v    
S3v:    MOV CX,50
       MOV DX,360   ;menor   
  M4v: CALL COLOR
       INC CX
       CMP CX,65    ;tamaño horizontal
       JE N4v
       JMP M4v
  N4v:  INC DX
  Z4v:  CALL COLOR
       DEC CX
       CMP CX,50      ;regresa a su valor de columna
       JE M4v
       CMP DX,363     ;grosor de letra(mayor 3)
       JE S4v
       JMP Z4v 
S4v:    MOV CX,65
       MOV DX,363      
  M5v: CALL COLOR
       INC DX
       CMP DX,375     ;tamño vertical
       JE N5v
       JMP M5v          
  N5v: INC CX
  Z5v: CALL COLOR
       DEC DX
       CMP DX,364      ;regresa a su valor de fila
       JE M5v
       CMP CX,70       ;grosor de letra
       JE SIGUE20
       JMP Z5v
    ;xxxxxxxxxxxxxxxxxx LETRA C xxxxxxxxxxxxxxx     
SIGUE20:MOV CX,75      ;menor
       MOV DX,345      
  Ma7:  CALL COLOR
       INC DX
       CMP DX,375     ;tamaño vertical
       JE Na7
       JMP Ma7          
  Na7:  INC CX
  Za7:  CALL COLOR
       DEC DX
       CMP DX,345     ;regresa valor de fila
       JE Ma7
       CMP CX,80      ;grosor de letra(mayor 5)
       JE Sa1          
       JMP Za7        
Sa1:    MOV CX,80
       MOV DX,345    ;menor  
  Ma8:  CALL COLOR
       INC CX
       CMP CX,95      ;tamaño horizontal
       JE Na8
       JMP Ma8
  Na8:  INC DX
  Za8:  CALL COLOR
       DEC CX
       CMP CX,80     ;regresa su valor de columna
       JE Ma8
       CMP DX,350    ;grosor de letra (mayor 5)
       JE Sa2
       JMP Za8
Sa2:    MOV CX,80
       MOV DX,375     ;mayor 5 
  Ma9:  CALL COLOR
       INC CX
       CMP CX,95      ;tamaño horizontal (para atras)
       JE Na9
       JMP Ma9
  Na9:  DEC DX
  Za9:  CALL COLOR
       DEC CX
       CMP CX,80      ;regresa su valor de columna
       JE Ma9
       CMP DX,370     ;grosor de letra(menor 5)
       JE SIGUE21
       JMP Za9
   ;xxxxxxxxxxxxxxxxxxx LETRA "U" xxxxxxxxxxxxxxxxx 
SIGUE21:MOV CX,105  ;MAYOR
       MOV DX,375      
  Fl1: CALL COLOR
       DEC DX
       CMP DX,345   ;tamaño vertical
       JE Fl2
       JMP Fl1          
  Fl2: DEC CX
  Fl3: CALL COLOR
       INC DX
       CMP DX,375   ;regresa a su valor
       JE Fl1
       CMP CX,100    ;grosor de la letra (MENOR)
       JE Fl4
       JMP Fl3      
Fl4:    MOV CX,105  ;menor1
       MOV DX,375  ;mayor      
  Fl5:  CALL COLOR
       INC CX
       CMP CX,120     ;en horizontal tamaño(mayor1)
       JE Fl6
       JMP Fl5
  Fl6: DEC DX
  Fl7: CALL COLOR
       DEC CX
       CMP CX,105      ;regresa a su valor
       JE Fl5
       CMP DX,370     ;grosor de letra(menor)
       JE Fl8
       JMP Fl7      
Fl8:    MOV CX,120    ;MAYOR
       MOV DX,375    ;MAYOR1  
  MPl12: CALL COLOR
       DEC DX
       CMP DX,345      ;vertical tamña(MENOR1) 
       JE NPl12
       JMP MPl12          
  NPl12: DEC CX
  ZPl12: CALL COLOR
       INC DX
       CMP DX,375      ;regresa a su valor
       JE MPl12
       CMP CX,115      ;grosor de letra (MENOR)
       JE SIGUE22
       JMP ZPl12 
   ;xxxxxxxxxxxxx LETRA "L" xxxxxxxxxxxxxx 
SIGUE22:MOV CX,125       ;menor
       MOV DX,345      
  MF7y:  CALL COLOR
       INC DX
       CMP DX,375     ;tamaño vertical
       JE NF7y
       JMP MF7y          
  NF7y:  INC CX
  ZF7y:  CALL COLOR
       DEC DX
       CMP DX,345     ;regresa valor de fila
       JE MF7y
       CMP CX,130     ;grosor de letra(mayor)
       JE SF2y          
       JMP ZF7y        
SF2y:   MOV CX,130
       MOV DX,375     ;mayor 
  MF9y:  CALL COLOR
       INC CX
       CMP CX,145     ;tamaño horizontal 
       JE NF9y
       JMP MF9y
  NF9y:  DEC DX
  ZF9y:  CALL COLOR
       DEC CX
       CMP CX,130     ;regresa su valor de columna
       JE MF9y
       CMP DX,370     ;grosor de letra(menor 5)
       JE  SIGUE23
       JMP ZF9y 
;xxxxxxxxxxxxxxx LETRA "O" xxxxxxxxxxxxxxxxxxxx
SIGUE23:MOV CX,150
       MOV DX,350      
  MP7y:  CALL COLOR
       INC DX
       CMP DX,370     ;tamaño  vertical
       JE NP7y
       JMP MP7y          
  NP7y:  INC CX
  ZP7y:  CALL COLOR
       DEC DX
       CMP DX,350     ;regresa su valor de fila
       JE MP7y
       CMP CX,155     ;grosor de letra
       JE SP1y
       JMP ZP7y        
SP1y:    MOV CX,155
       MOV DX,345      
  MP8y:  CALL COLOR
       INC CX
       CMP CX,170     ;tamaño horizontal
       JE NP8y
       JMP MP8y
  NP8y:  INC DX
  ZP8y:  CALL COLOR
       DEC CX
       CMP CX,155    ;regresa su valor columna
       JE MP8y
       CMP DX,350    ;grosor de letra
       JE SP2y
       JMP ZP8y
SP2y:    MOV CX,155      ;menor1
       MOV DX,375       ;mayor
  MP9y:  CALL COLOR
       INC CX
       CMP CX,170        ;tamaño horizontal(mayor1)
       JE NP9y
       JMP MP9y
  NP9y:  DEC DX              
  ZP9y:  CALL COLOR
       DEC CX
       CMP CX,155         ;regresa su valor columna
       JE MP9y
       CMP DX,370         ;grosor de letra(menor) 
       JE sP3y
       JMP ZP9y 
sP3y:   MOV CX,170   
       MOV DX,350      
  MP7yy:  CALL COLOR
       INC DX
       CMP DX,370     ;tamaño  vertical
       JE NP7yy
       JMP MP7yy          
  NP7yy:INC CX
  ZP7yy:CALL COLOR
       DEC DX
       CMP DX,350     ;regresa su valor de fila
       JE MP7yy
       CMP CX,175     ;grosor de letra
       JE SIGQ2
       JMP ZP7yy
   ;xxxxxxxxxxxxx CUADRO DE ENCERRAR LETRA xxxxxxxxxxx     
SIGQ2: MOV CX,7
       MOV DX,342  
   X2y:CALL COLOR 
       INC CX
       CMP CX,178
       JE SZzy
       JMP X2y
  SZzy:  CALL COLOR
       INC DX
       CMP DX,378    ;mas 36
       JE XZzy 
       JMP SZzy
  XZzy:  CALL COLOR
       DEC CX
       CMP CX,7     ;regresa su valor de columna
       JE YzZy
       JMP XZzy
  YzZy:  CALL COLOR
       DEC DX
       CMP DX,342     ;regresa su valor de fila
       JE SIGUE24
       JMP YzZy 
  ;xxxxxxxxxxxxxxxxx LETRA R xxxxxxxxxxxxx   
SIGUE24:MOV CX,210   ;memor
       MOV DX,345      
  M1b: CALL COLOR
       INC DX
       CMP DX,375     ;tamño vertical 
       JE N1b
       JMP M1b          
  N1b:  INC CX
  Z1b:  CALL COLOR
       DEC DX
       CMP DX,345      ;regresa a su valor de fila
       JE M1b
       CMP CX,215      ;tamaño de letra(mayor)
       JE S1b
       JMP Z1b        
S1b:   MOV CX,215
       MOV DX,345      
  M2b: CALL COLOR
       INC CX
       CMP CX,230    ;tamaño horizontal para adelante
       JE N2b
       JMP M2b
  N2b:  INC DX
  Z2b:  CALL COLOR
       DEC CX
       CMP CX,215     ;regresa a su valor de columna
       JE M2b
       CMP DX,350     ;grosor de letra
       JE S2b
       JMP Z2b
S2b:   MOV CX,230    ;menor
       MOV DX,350      
  M3b: CALL COLOR
       INC DX
       CMP DX,360     ;tamño vertical
       JE N3b
       JMP M3b          
  N3b: INC CX
  Z3b: CALL COLOR
       DEC DX
       CMP DX,350      ;regresa a su valor de fila
       JE M3b
       CMP CX,235      ;tamaño de letra(mayor)
       JE S3b
       JMP Z3b    
S3b:    MOV CX,215
       MOV DX,360   ;menor   
  M4b: CALL COLOR
       INC CX
       CMP CX,230    ;tamaño horizontal
       JE N4b
       JMP M4b
  N4b:  INC DX
  Z4b:  CALL COLOR
       DEC CX
       CMP CX,215      ;regresa a su valor de columna
       JE M4b
       CMP DX,363     ;grosor de letra(mayor 3)
       JE S4b
       JMP Z4b 
S4b:    MOV CX,230
       MOV DX,363      
  M5b: CALL COLOR
       INC DX
       CMP DX,375     ;tamño vertical
       JE N5b
       JMP M5b          
  N5b: INC CX
  Z5b: CALL COLOR
       DEC DX
       CMP DX,364      ;regresa a su valor de fila
       JE M5b
       CMP CX,235      ;grosor de letra
       JE SIGUE25
       JMP Z5b 
  ;xxxxxxxxxxxxxxxxxx LETRA E xxxxxxxxxxxxxxx       
SIGUE25:MOV CX,240      ;menor
       MOV DX,345      
  MB7:  CALL COLOR
       INC DX
       CMP DX,375     ;tamaño vertical
       JE NB7
       JMP MB7          
  NB7:  INC CX
  ZB7:  CALL COLOR
       DEC DX
       CMP DX,345     ;regresa valor de fila
       JE MB7
       CMP CX,245      ;grosor de letra(mayor 5)
       JE SB1          
       JMP ZB7        
SB1:    MOV CX,245
       MOV DX,345    ;menor  
  MB8:  CALL COLOR
       INC CX
       CMP CX,260     ;tamaño horizontal
       JE NB8
       JMP MB8
  NB8:  INC DX
  ZB8:  CALL COLOR
       DEC CX
       CMP CX,245     ;regresa su valor de columna
       JE MB8
       CMP DX,350    ;grosor de letra (mayor 5)
       JE SB2
       JMP ZB8
SB2:    MOV CX,245
       MOV DX,375     ;mayor 5 
  MB9:  CALL COLOR
       INC CX
       CMP CX,260     ;tamaño horizontal (para atras)
       JE NB9
       JMP MB9
  NB9:  DEC DX
  ZB9:  CALL COLOR
       DEC CX
       CMP CX,245      ;regresa su valor de columna
       JE MB9
       CMP DX,370     ;grosor de letra(menor 5)
       JE SB3
       JMP ZB9  
SB3:    MOV CX,245
       MOV DX,362     ;mayor 
  MB10:  CALL COLOR
       INC CX
       CMP CX,260     ;tamaño horizontal (para atras)
       JE NB10
       JMP MB10
  NB10:  DEC DX
  ZB10:  CALL COLOR
       DEC CX
       CMP CX,245      ;regresa su valor de columna
       JE MB10
       CMP DX,358     ;grosor de letra(menor)
       JE SIGue26
       JMP ZB10 
      ;xxxxxxxxxxxxxxxxxx LETRA C xxxxxxxxxxxxxxx   
SIGUE26:MOV CX,265      ;menor
       MOV DX,345      
  Ma7w:  CALL COLOR
       INC DX
       CMP DX,375     ;tamaño vertical
       JE Na7w
       JMP Ma7w          
  Na7w:  INC CX
  Za7w:  CALL COLOR
       DEC DX
       CMP DX,345     ;regresa valor de fila
       JE Ma7w
       CMP CX,270      ;grosor de letra(mayor 5)
       JE Sa1w          
       JMP Za7w        
Sa1w:    MOV CX,270
       MOV DX,345    ;menor  
  Ma8w:  CALL COLOR
       INC CX
       CMP CX,285     ;tamaño horizontal
       JE Na8w
       JMP Ma8w
  Na8w:  INC DX
  Za8w:  CALL COLOR
       DEC CX
       CMP CX,270     ;regresa su valor de columna
       JE Ma8w
       CMP DX,350    ;grosor de letra (mayor 5)
       JE Sa2w
       JMP Za8w
Sa2w:    MOV CX,270
       MOV DX,375     ;mayor 5 
  Ma9w:  CALL COLOR
       INC CX
       CMP CX,285      ;tamaño horizontal (para atras)
       JE Na9w
       JMP Ma9w
  Na9w:  DEC DX
  Za9w:  CALL COLOR
       DEC CX
       CMP CX,270     ;regresa su valor de columna
       JE Ma9w
       CMP DX,370     ;grosor de letra(menor 5)
       JE SIGUE27
       JMP Za9w 
   ;xxxxxxxxxxxxxxx LETRA T xxxxxxxxxxxx       
SIGUE27:MOV CX,301
       MOV DX,375      
  M10a: CALL COLOR
       DEC DX
       CMP DX,350   ;tamaño vertical
       JE N10a
       JMP M10a          
  N10a: DEC CX
  Z10a: CALL COLOR
       INC DX
       CMP DX,375   ;regresa a su valor
       JE M10a
       CMP CX,296    ;grosor de la letra
       JE Sa3
       JMP Z10a
Sa3:   MOV CX,290
       MOV DX,350      
  M11a:  CALL COLOR
       INC CX
       CMP CX,306      ;en horizontal tamaño
       JE N11a
       JMP M11a
  N11a: DEC DX
  Z11a: CALL COLOR
       DEC CX
       CMP CX,290      ;regresa a su valor ce columna
       JE M11a
       CMP DX,345     ;grosor de letra
       JE SIGUE28
       JMP Z11a 
    ;xxxxxxxxxxxxxxxxxx LETRA A xxxxxxxxx
SIGUE28:MOV CX,310
       MOV DX,345      
  M26i: CALL COLOR
       INC DX
       CMP DX,375     ;tamño vertical
       JE N26i
       JMP M26i          
  N26i: INC CX
  Z26i: CALL COLOR
       DEC DX
       CMP DX,345      ;regresa a su valor de fila
       JE M26i
       CMP CX,315       ;tamaño de letra
       JE S15i
       JMP Z26i        
S15i:   MOV CX,315
       MOV DX,345      
  M27i: CALL COLOR
       INC CX
       CMP CX,330    ;tamaño horizontal
       JE N27i
       JMP M27i
  N27i:  INC DX
  Z27i:  CALL COLOR
       DEC CX
       CMP CX,315      ;regresa a su valor de columna
       JE M27i
       CMP DX,350     ;grosor de letra
       JE S16i
       JMP Z27i
S16i:    MOV CX,330
       MOV DX,345      
  M28i: CALL COLOR
       INC DX
       CMP DX,375     ;tamño vertical
       JE N28i
       JMP M28i          
  N28i: INC CX
  Z28i: CALL COLOR
       DEC DX
       CMP DX,345      ;regresa a su valor de fila
       JE M28i
       CMP CX,335       ;tamaño de letra
       JE S17i
       JMP Z28i    
S17i:    MOV CX,315
       MOV DX,360      
  M29i: CALL COLOR
       INC CX
       CMP CX,330   ;tamaño horizontal
       JE N29i
       JMP M29i
  N29i:  INC DX
  Z29i:  CALL COLOR
       DEC CX
       CMP CX,315      ;regresa a su valor de columna
       JE M29i
       CMP DX,363     ;grosor de letra
       JE SIGUE29
       JMP Z29i 
     ;xxxxxxxxxxx LETRA N xxxxxxxxxxxxx    
SIGUE29:MOV CX,345  ;mayor
       MOV DX,375      
  M10i: CALL COLOR
       DEC DX
       CMP DX,345   ;tamaño vertical 
       JE N10i
       JMP M10i          
  N10i: DEC CX
  Z10i: CALL COLOR
       INC DX
       CMP DX,375   ;regresa a su valor
       JE M10i
       CMP CX,340   ;grosor de la letra (menor)
       JE SWi
       JMP Z10i
  SWi:  MOV CX,365   ;mayor
        MOV DX,375      
  M11i: CALL COLOR
       DEC DX
       CMP DX,345   ;tamaño vertical para atras
       JE N11i
       JMP M11i          
  N11i: DEC CX
  Z11i: CALL COLOR
       INC DX
       CMP DX,375   ;regresa a su valor
       JE M11i
       CMP CX,360    ;grosor de la letra(menor)
       JE SW1i
       JMP Z11i
  SW1i: MOV CX,353  ;mayor
       MOV DX,360     
  M12i: CALL COLOR
       DEC DX
       CMP DX,350   ;tamaño vertical 
       JE N12i
       JMP M12i          
  N12i: DEC CX
  Z12i: CALL COLOR
       INC DX
       CMP DX,360   ;regresa a su valor
       JE M12i
       CMP CX,345    ;grosor de la letra(menor)
       JE SW2i
       JMP Z12i 
  SW2i: MOV CX,360   ;mayor
       MOV DX,370      
  M13i: CALL COLOR
       DEC DX
       CMP DX,360   ;tamaño vertical para atras
       JE N13i
       JMP M13i          
  N13i: DEC CX
  Z13i: CALL COLOR
       INC DX
       CMP DX,370   ;regresa a su valor
       JE M13i
       CMP CX,353    ;grosor de la letra(menor)
       JE  SIGUE30
       JMP Z13i 
  ;xxxxxxxxxxxxxxxx LETRA G xxxxxxxxxxxxxxx    
SIGUE30:MOV CX,370       ;menor
       MOV DX,345      
  Mi7:  CALL COLOR
       INC DX
       CMP DX,375     ;tamaño vertical
       JE Ni7
       JMP Mi7          
  Ni7:  INC CX
  Zi7:  CALL COLOR
       DEC DX
       CMP DX,345     ;regresa valor de fila
       JE Mi7
       CMP CX,375      ;grosor de letra(mayor 5)
       JE Si1          
       JMP Zi7        
Si1:    MOV CX,375
       MOV DX,345    ;menor  
  Mi8:  CALL COLOR
       INC CX
       CMP CX,390     ;tamaño horizontal
       JE Ni8
       JMP Mi8
  Ni8:  INC DX
  Zi8:  CALL COLOR
       DEC CX
       CMP CX,375     ;regresa su valor de columna
       JE Mi8
       CMP DX,350    ;grosor de letra (mayor 5)
       JE Si2
       JMP Zi8
Si2:   MOV CX,375
       MOV DX,375     ;mayor 
  Mi9:  CALL COLOR
       INC CX
       CMP CX,390     ;tamaño horizontal (para atras)
       JE Ni9
       JMP Mi9
  Ni9:  DEC DX
  Zi9:  CALL COLOR
       DEC CX
       CMP CX,375      ;regresa su valor de columna
       JE Mi9
       CMP DX,370     ;grosor de letra(menor 5)
       JE Si3
       JMP Zi9
Si3:   MOV CX,395     ;mayor
       MOV DX,375     ;mayor1 
  M1i2F: CALL COLOR
       DEC DX
       CMP DX,360   ;tamaño vertical (menor1)
       JE N1i2F
       JMP M1i2F          
  N1i2F: DEC CX
  Z1i2F: CALL COLOR
       INC DX
       CMP DX,375   ;regresa a su valor
       JE M1i2F
       CMP CX,390    ;grosor de la letra (menor)
       JE S4iF
       JMP Z1i2F
S4iF:   MOV CX,390   ;mayor
       MOV DX,365   ;mayor1   
  M13iF: CALL COLOR  
       DEC DX
       CMP DX,360   ;tamaño vertical para atras(menor1)
       JE N13iF
       JMP M13iF          
  N13iF: DEC CX
  Z13iF: CALL COLOR
       INC DX
       CMP DX,365   ;regresa a su valor
       JE M13iF
       CMP CX,385    ;grosor de la letra(menor)
       JE  SIGUE31
       JMP Z13iF  
 ;xxxxxxxxxxxxxxxxxxx LETRA "U" xxxxxxxxxxxxxxxxxxxxxx
SIGUE31:MOV CX,405  ;MAYOR
       MOV DX,375      
  F1i: CALL COLOR
       DEC DX
       CMP DX,345   ;tamaño vertical
       JE F2i
       JMP F1i          
  F2i: DEC CX
  F3i: CALL COLOR
       INC DX
       CMP DX,375   ;regresa a su valor
       JE F1i
       CMP CX,400    ;grosor de la letra (MENOR)
       JE F4i
       JMP F3i      
F4i:    MOV CX,405  ;menor1
       MOV DX,375  ;mayor      
  F5i:  CALL COLOR
       INC CX
       CMP CX,420     ;en horizontal tamaño(mayor1)
       JE F6i
       JMP F5i
  F6i: DEC DX
  F7i: CALL COLOR
       DEC CX
       CMP CX,405      ;regresa a su valor
       JE F5i
       CMP DX,370     ;grosor de letra(menor)
       JE F8i
       JMP F7i      
F8i:    MOV CX,425    ;MAYOR
       MOV DX,375    ;MAYOR1  
  MP12i: CALL COLOR
       DEC DX
       CMP DX,345      ;vertical tamña(MENOR1) 
       JE NP12i
       JMP MP12i          
  NP12i: DEC CX
  ZP12i: CALL COLOR
       INC DX
       CMP DX,375      ;regresa a su valor
       JE MP12i
       CMP CX,420      ;grosor de letra (MENOR)
       JE SIGUE32
       JMP ZP12i 
   ;xxxxxxxxxxxxx LETRA "L" xxxxxxxxxxxxxx
SIGUE32:MOV CX,430       ;menor
       MOV DX,345      
  MF7i:CALL COLOR
       INC DX
       CMP DX,375     ;tamaño vertical
       JE NF7i
       JMP MF7i          
  NF7i:  INC CX
  ZF7i:  CALL COLOR
       DEC DX
       CMP DX,345     ;regresa valor de fila
       JE MF7i
       CMP CX,435      ;grosor de letra(mayor)
       JE SF2i          
       JMP ZF7i        
SF2i:   MOV CX,435
       MOV DX,375     ;mayor 
  MF9i:  CALL COLOR
       INC CX
       CMP CX,450     ;tamaño horizontal 
       JE NF9i
       JMP MF9i
  NF9i:  DEC DX
  ZF9i:  CALL COLOR
       DEC CX
       CMP CX,435      ;regresa su valor de columna
       JE MF9i
       CMP DX,370     ;grosor de letra(menor 5)
       JE  SIGUE33
       JMP ZF9i 
;xxxxxxxxxxxxxxx LETRA "O" xxxxxxxxxxxxxxxxxxx  
SIGUE33:MOV CX,455
       MOV DX,350      
  MP7i:  CALL COLOR
       INC DX
       CMP DX,370     ;tamaño  vertical
       JE NP7i
       JMP MP7i          
  NP7i:  INC CX
  ZP7i:  CALL COLOR
       DEC DX
       CMP DX,350     ;regresa su valor de fila
       JE MP7i
       CMP CX,460     ;grosor de letra
       JE SP1i
       JMP ZP7i        
SP1i:    MOV CX,460
       MOV DX,345      
  MP8i:  CALL COLOR
       INC CX
       CMP CX,475     ;tamaño horizontal
       JE NP8i
       JMP MP8i
  NP8i:  INC DX
  ZP8i:  CALL COLOR
       DEC CX
       CMP CX,460    ;regresa su valor columna
       JE MP8i
       CMP DX,350    ;grosor de letra
       JE SP2i
       JMP ZP8i
SP2i:    MOV CX,460      ;menor1
       MOV DX,375       ;mayor
  MP9i:  CALL COLOR
       INC CX
       CMP CX,475        ;tamaño horizontal(mayor1)
       JE NP9i
       JMP MP9i
  NP9i:  DEC DX              
  ZP9i:  CALL COLOR
       DEC CX
       CMP CX,460         ;regresa su valor columna
       JE MP9i
       CMP DX,370         ;grosor de letra(menor) 
       JE sP3i
       JMP ZP9i 
sP3i:   MOV CX,475   
       MOV DX,350      
  MP7xi:  CALL COLOR
       INC DX
       CMP DX,370     ;tamaño  vertical
       JE NP7xi
       JMP MP7xi          
  NP7xi:INC CX
  ZP7xi:CALL COLOR
       DEC DX
       CMP DX,350     ;regresa su valor de fila
       JE MP7xi
       CMP CX,480    ;grosor de letra
       JE SIGQ3
       JMP ZP7xi
  ;xxxxxxxxxxxxx CUADRO DE ENCERRAR LETRA xxxxxxxxxxx  SIN EDITAR    
SIGQ3: MOV CX,207
       MOV DX,342 
   X2i:CALL COLOR 
       INC CX
       CMP CX,483
       JE Sii
       JMP X2i
  Sii:  CALL COLOR
       INC DX
       CMP DX,378
       JE Xi 
       JMP Sii
  Xi:  CALL COLOR
       DEC CX
       CMP CX,207      ;regresa su valor de columna
       JE Yi
       JMP Xi
  Yi:  CALL COLOR
       DEC DX
       CMP DX,342    ; regresa su valor de fila
       JE SIG2
       JMP Yi  
     
  ;xxxxxxxxxxxxxx CIRCULO xxxxxxxxxxxxx
SIG2: 
call circulo 
call color_circulo
jmp mouse
circulo proc near  
mov ax,xc 
xor ax,ax 
mov xc,ax 
mov ax,1 
sbb rad,ax ;pc=rad-1 
mov ax,rad 
mov pc,ax 
jmp short a226 
a58: 
mov bx,pc 
or bx,bx 
jl short a114 ;if pc>0 
inc xc ;xc++ 
mov ax,xc 
jmp short a142 
a114: 
inc xc 
dec yc 
mov ax,xc 
sub ax,yc 
a142: 
shl ax,1 ;2*xc+1 
inc ax 
sub pc,ax 
call pxp 

a226: 
mov ax,xc 
cmp ax,yc ;while(xc<yc) 
jl short a58 
ret 
circulo endp 

pxp proc near    
mov ax,x1 ;mov cx,x 
add ax,xc ;mov dx,y 
mov cx,ax 
mov ax,y1 
add ax,yc 
mov dx,ax
call pixel 
mov ax,x1 ;mov cx,x 
sub ax,xc ;mov dx,y 
mov cx,ax 
mov ax,y1 
add ax,yc 
mov dx,ax 
call pixel 
mov ax,x1 ;mov cx,x 
add ax,xc ;mov dx,y 
mov cx,ax 
mov ax,y1 
sub ax,yc 
mov dx,ax 
call pixel 
mov ax,x1 ;mov cx,x 
sub ax,xc ;mov dx,y 
mov cx,ax 
mov ax,y1 
sub ax,yc 
mov dx,ax
call pixel 
mov ax,x1 ;mov cx,x
add ax,yc ;mov dx,y 
mov cx,ax 
mov ax,y1 
add ax,xc 
mov dx,ax
call pixel 
mov ax,x1 ;mov cx,x
sub ax,yc ;mov dx,y 
mov cx,ax 
mov ax,y1 
add ax,xc 
mov dx,ax 
call pixel 
mov ax,x1 ;mov cx,x
add ax,yc ;mov dx,y 
mov cx,ax 
mov ax,y1 
sub ax,xc 
mov dx,ax
call pixel 
mov ax,x1 ;mov cx,x
sub ax,yc ;mov dx,y 
mov cx,ax 
mov ax,y1 
sub ax,xc 
mov dx,ax 
call pixel 
ret 
pxp endp 
pixel proc near     
mov ah,12 
mov al,09h	;color 
mov bh,0 ;Pagina 
int 10h 
ret 
pixel endp
color_circulo: 
       MOV DX,8     ;TRIANGULO
       MOV CX,450  
       MOV VAR1,8
       MOV VAR2,111
  M4:  CALL COLOR
       INC DX
       CMP DX,VAR2
       JE N4
       JMP M4 
  N4:  DEC CX
       INC VAR1
       DEC VAR2
  YS2: CALL COLOR
       DEC DX 
       CMP DX,VAR1
       JE M4
       CMP CX,418
       JE SIG4
       JMP YS2 
SIG4:       
       MOV CX,450     ;RECTANGULO
       MOV DX,8        
  M5:  CALL COLOR
       INC CX
       CMP CX,490
       JE N5
       JMP M5
  N5:  MOV CX,450
       INC DX
       CMP DX,113
       JE SIG5     
       JMP M5

SIG5:  MOV CX,490      ;TRIAGULO
       MOV DX,8
       MOV VAR4,8
       MOV VAR5,111
  M6:  CALL COLOR
       INC DX
       CMP DX,VAR5
       JE N6
       JMP M6 
  N6:  INC CX
       INC VAR4
       DEC VAR5
  YS3: CALL COLOR
       DEC DX 
       CMP DX,VAR4
       JE M6
       CMP CX,522
       JE LA
       JMP YS3 
    LA:RET
  ;xxxxxxxxxxxxxxxxxxxxxxxxx MOUSE-CUADRADO xxxxxxxxxxxxx 
 MOUSE:MOV AX,00H
       INT 33H 
       MOV AX,1
       INT 33H 
               
       MOV AX,4
       MOV CX,300
       MOV DX,200
       INT 33H 
       
       MOV AX,5 
       INT 33H
       
         
                  
         CALL JUGAR
MOUSE1_1:CALL MOUSE1
         CALL MOUSE2
         CALL MOUSE3
         CALL MOUSE4
         CALL NOJUGAR 
         JMP MOUSE1_1 
         
         
 JUGAR: MOV AX,3
        INT 33H 
        CMP DX,200
        JGE JU4
 JU4:   CMP DX,220       
        JLE JU5
        JMP JUGAR
 JU5:   CMP CX,500
        JGE JU6
  JU6:  CMP CX,520
        JLE CLICK
        JMP JUGAR 
        
 CLICK:
       CMP DX,200  ;VALIDAR
        JLE JUGAR
        CMP DX,220
        JGE JUGAR
        CMP CX,500
        JLE JUGAR
        CMP CX,520
        JGE JUGAR ; 
       MOV AX,3
       INT 33H
       CMP BX,1                
       JE  CMD
       JMP CLICK
       
 CMD:  MOV CX,500
       MOV DX,200
  CMD1:CALL COLOR6
       INC CX
       CMP CX,520
       JE CMD2
       JMP CMD1
  CMD2:MOV CX,500
       INC DX
       CMP DX,220
       JE JU10   
       JMP CMD1
  JU10:RET                     
         
MOUSE1:MOV AX,3
       INT 33H 
       ;xxxxxxxxxxxxxxxxxxxxxxxxxx
         CMP DX,91   ;VALIDAR
         JGE next
         CMP CX,91
         JGE next  ;
         ;xxxxxxxxxxxxxxxx
       CMP DX,10   ;cuadrado
       JGE LF 
  LF: CMP DX,90
      JLE LF1
 LF1: CMP CX,10
      JGE LF2 
 LF2: CMP CX,90
      JLE CAMBIA
      JMP MOUSE1
next: RET
     ;XXXXXXXXXXXXXXXXXXXXXXXXXXX
MOUSE2:MOV AX,3
      INT 33H 
       ;xxxxxxxxxxxxxxxxxxxxxxxx
           CMP DX,101   ;VALIDAR
           JGE next1
           CMP CX,251
           JGE next1  
           CMP CX,131
           JLE next1;
       ;xxxxxxxxxxxxxxxxxxxxx
      CMP DX,3 
      JGE LF6 
  LF6: CMP DX,100
      JLE LF7
 LF7: CMP CX,130
      JGE LF8  
 LF8: CMP CX,250
      JLE CAMBIA2
      JMP MOUSE2 
next1:  RET
     ;XXXXXXXXXXXXXXXXXXXXXXXXX
MOUSE3:MOV AX,3
      INT 33H  
      ;xxxxxxxxxxxxxxxxxxxxxxxxxxx 
          CMP DX,85  ;VALIDAR
          JGE next2
          CMP CX,421
          JGE next2 
          CMP CX,271
          JLE next2;
      ;xxxxxxxxxxxxxxxxxxxxx
      CMP DX,10
      JGE LF12 
  LF12: CMP DX,84
      JLE LF13
 LF13: CMP CX,270
      JGE LF14
 LF14: CMP CX,420
      JLE CAMBIA4
      JMP MOUSE3 
next2: RET
     ;xxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx
MOUSE4:MOV AX,3                     
      INT 33H 
        ;xxxxxxxxxxxxxxxxxxxxxxxx
          CMP DX,116  ;VALIDAR   
          JGE next3
          CMP CX,525
          JGE next3 
          CMP CX,422
          JLE next3;
       ;xxxxxxxxxxxxxxxxxxxxxxx
      CMP DX,8
      JGE LF18 
  LF18: CMP DX,115
      JLE LF19
 LF19: CMP CX,422
      JGE LF20 
 LF20: CMP CX,522
      JLE CAMBIA6
      JMP MOUSE4 
next3: RET 

;xxxxxxxxxxxxxxxxxxxxxxxxxx NO JUGAR xxxxxxxxxxxxxxxxxxx
NOJUGAR: MOV AX,3
        INT 33H
        ;xxxxxxxxxx validar xxxxxxxx
        CMP DX,230
        JLE JU11
        CMP DX,250
        JGE JU11
        CMP CX,500
        JLE JU11
        CMP CX,520
        JGE JU11
        JMP JU12
   JU11:RET     
        ;xxxxxxxxxxxxxxxxxxxxxxx 
  JU12: CMP DX,230
        JGE JU7
 JU7:   CMP DX,250       
        JLE JU8
        JMP NOJUGAR
 JU8:   CMP CX,500
        JGE JU9
  JU9:  CMP CX,520
        JLE CLICK1
        JMP NOJUGAR 
     
CLICK1: ;xxxxxxxxxx validar xxxxxxxx
        CMP DX,230
        JLE NOJUGAR
        CMP DX,250
        JGE NOJUGAR
        CMP CX,500
        JLE NOJUGAR
        CMP CX,520
        JGE NOJUGAR 
        ;xxxxxxxxxxxxxxxxxxxxxxx 
       MOV AX,3
       INT 33H
       CMP BX,1                
       JE  FIN
       JMP CLICK1
        
FIN:   MOV CX,500
       MOV DX,230
  JU13: CALL COLOR5
       INC CX
       CMP CX,520
       JE JU14
       JMP JU13
  JU14: MOV CX,500
       INC DX
       CMP DX,250
       JE FIN1   
       JMP JU13  
        
FIN1: XOR AX,AX           ;recuperar moto texto
      MOV AL,oldvmode
      INT 10H 
  
      MOV DX,OFFSET TEXTO
      MOV AH,09H
      INT 21H
      MOV AH,4CH
      INT 21H 
 
 TEXTO DB "                                ",09H,09H,0AH,0AH,0AH,0AH,0AH,0AH
       DB "         ESCUELA PROFESIONAL       ",09H,09H,0AH
       DB "       INGENIERIA ELECTRONICA      ",09H,09H,0AH,0AH,0AH
       DB "       TRABAJO - MODO GRAFICO          ",09H,09H,0AH,0AH,0AH   
       DB "   DOCENTE : ING. CARLOS OBLITAS VERA",09H,09H,0AH,0AH,0AH
       DB "   CURSO   : SISTEMAS DIGITALES 1      ",09H,09H,0AH,0AH,0AH
       DB "   ALUMNOS : BARBOZA HUAMAN RONAL    ",09H,09H,0AH
       DB "             CALDERON PEREZ JOSELITO ",09H,09H,0AH
       DB "             DIAZ ESQUEN CESAR       ",09H,09H,0AH
       DB "             MILLONES QUESQUEN JOSE  ",09H,09H,0AH
       DB "             PUSE GUERRERO EDWARD    ",09H,09H,0AH
       DB "             ZAQUINAULA BERRU OMAR  $",0AH,0AH,0AH
;xxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx       
           
CAMBIA:MOV AX,3
       INT 33H
       CMP BX,1
       JE CUADRADO 
       JMP CAMBIA    
       ;xxxxxxxxxxxxxxxxxxxx MOUSE - CUADRADO xxxxxxxxxx
                     
CUADRADO:CMP DX,90   ;VALIDAR
         JGE MOUSE1
         CMP CX,90
         JGE MOUSE1  ;
       MOV CX,10     ;columna de inicio
       MOV DX,10    ;fila de inicio 
  L1:  CALL COLOR2
       INC CX
       CMP CX,110
       JE L2
       JMP L1
  L2:   MOV CX,10
       INC DX
       CMP DX,110
       JE MOUSEL1     
       JMP L1
   ;cambiar de color la letra
MOUSEL1:MOV AX,4     ;DEVUELVO EL CONTROL DEL MOUSE
        MOV CX,300
        MOV DX,200
        INT 33H 
   MO: MOV AX,3
       INT 33H
       CMP DX,298 
       JGE LF3 
       JMP MO
  LF3: CMP DX,332
       JLE LF4
       JMP MO
  LF4: CMP CX,2
       JGE LF5
       JMP MO
  LF5: CMP CX,230
       JLE CAMBIA1
       JMP MO
           
CAMBIA1:MOV AX,3
        INT 33H
        CMP BX,1
        JE CUADRADOL
        JMP CAMBIA1
                ;DESAPARECER-COLOR DE FONDO     
                     
CUADRADOL:CMP DX,332  ;VALIDAR
          JGE MO
          CMP CX,230
          JGE MO  
          CMP DX,298
          JLE MO;
          MOV CX,2    ;columna de inicio
          MOV DX,298    ;fila de inicio 
     L3:  CALL COLOR1
          INC CX
          CMP CX,230
          JE L4
          JMP L3
      L4: MOV CX,2
          INC DX
          CMP DX,335
          JE L5     
          JMP L3
                       ;DESAPARECER NOMBRE
 L5:      MOV CX,10    ;columna de inicio
          MOV DX,10    ;fila de inicio 
     L6:  CALL COLOR1
          INC CX
          CMP CX,110
          JE L7
          JMP L6
      L7: MOV CX,2
          INC DX 
        
          CMP DX,110
          JE MOUSE1_1
          JMP L6
      ;xxxxxxxxxxxxxxxxx MOUSE-RECTANGULO xxxxxxxxxxxxxxxxx
       
CAMBIA2:MOV AX,3
       INT 33H
       CMP BX,1
       JE RECTANGULO 
       JMP CAMBIA2 
 
RECTANGULO:CMP DX,100   ;VALIDAR
           JGE MOUSE2
           CMP CX,250
           JGE MOUSE2  
           CMP CX,130
           JLE MOUSE2;
       MOV CX,130
       MOV DX,30 
  L8:  CALL COLOR2
       INC CX
       CMP CX,250
       JE L9
       JMP L8
  L9:  MOV CX,130
       INC DX
       CMP DX,110
       JE MOUSEL2     
       JMP L8 
 ;CAMBIAR DE COLOR LETRA
MOUSEL2:MOV AX,4   ;DEVOLVER CONTROL
        MOV CX,300
        MOV DX,200
        INT 33H 
   MO1: MOV AX,3
       INT 33H
       CMP DX,342 
       JGE LF9 
       JMP MO1
  LF9: CMP DX,378
       JLE LF10
       JMP MO1
  LF10: CMP CX,207
       JGE LF11
       JMP MO1
  LF11: CMP CX,483
       JLE CAMBIA3
       JMP MO1
           
CAMBIA3:MOV AX,3
        INT 33H
        CMP BX,1
        JE RECTANGULOL
        JMP CAMBIA3
                ;DESAPARECER-COLOR DE FONDO     
RECTANGULOL:CMP DX,378 ;VALIDAR
          JGE MO1
          CMP CX,483
          JGE MO1  
          CMP DX,342
          JLE MO1;
          CMP CX,207
          JLE MO1
          MOV CX,207    ;columna de inicio
          MOV DX,342    ;fila de inicio 
     L10:  CALL COLOR1
          INC CX
          CMP CX,491
          JE L11
          JMP L10
      L11: MOV CX,207
          INC DX
          CMP DX,380
          JE L12     
          JMP L10
                       ;DESAPARECER FIGURA
 L12:      MOV CX,130    ;columna de inicio
          MOV DX,30    ;fila de inicio 
     L13:  CALL COLOR1
          INC CX
          CMP CX,250
          JE L14
          JMP L13
      L14: MOV CX,130
          INC DX
          CMP DX,110 
          JE MOUSE1_1   
          JMP L13                      
     ;xxxxxxxxxxxxxxxxx MOUSE-TRIANGULO xxxxxxxxxxxxxxxxx
  
CAMBIA4:MOV AX,3
       INT 33H
       CMP BX,1
       JE TRIANGULO 
       JMP CAMBIA4
 
TRIANGULO:CMP DX,84  ;VALIDAR
          JGE MOUSE3
          CMP CX,420
          JGE MOUSE3  
          CMP CX,270
          JLE MOUSE3;
       MOV DX,10
       MOV CX,270
       MOV VAR,270 
       MOV VAR3,420
  L15:  CALL COLOR2
       INC CX
       CMP CX,VAR3
       JE L16
       JMP L15 
  L16:  INC DX
       DEC VAR3
       INC VAR
  L17: CALL COLOR2
       DEC CX 
       CMP CX,VAR
       JE L15
       CMP DX,84  
       JE MOUSEL3
       JMP L17
 ;CAMBIAR DE COLOR LETRA
MOUSEL3:MOV AX,4   ;DEVOLVER CONTROL 
        MOV CX,300
        MOV DX,200
        INT 33H 
   MO2: MOV AX,3
        INT 33H
       CMP DX,298 
       JGE LF15 
       JMP MO2
  LF15: CMP DX,332
       JLE LF16
       JMP MO2
  LF16: CMP CX,255
       JGE LF17
       JMP MO2
  LF17: CMP CX,488
       JLE CAMBIA5
       JMP MO2
           
CAMBIA5:MOV AX,3
        INT 33H
        CMP BX,1
        JE TRIANGULOL
        JMP CAMBIA5
     ;DESAPARECER-COLOR DE FONDO     
TRIANGULOL:CMP DX,332 ;VALIDAR - LETRA 
          JGE MO2
          CMP CX,488
          JGE MO2  
          CMP DX,298  
          JLE MO2
          CMP CX,255
          JLE MO2     ;
          MOV CX,255    ;columna de inicio
          MOV DX,298    ;fila de inicio 
     L18:  CALL COLOR1
          INC CX
          CMP CX,490
          JE L19
          JMP L18
      L19: MOV CX,255
          INC DX
          CMP DX,335
          JE L20     
          JMP L18
                       ;DESAPARECER FIGURA
 L20:     MOV CX,270    ;columna de inicio
          MOV DX,10    ;fila de inicio 
     L21:  CALL COLOR1
          INC CX
          CMP CX,419
          JE L22
          JMP L21
      L22: MOV CX,270
          INC DX
          CMP DX,85 
          JE MOUSE1_1    
          JMP L21 
       ;xxxxxxxxxxxxxxxxx MOUSE-CIRCULO xxxxxxxxxxxxxxxxx      
CAMBIA6:MOV AX,3         
       INT 33H
       CMP BX,1
       JE CIRCULO1 
       JMP CAMBIA6
 
CIRCULO1:  CMP DX,115  ;VALIDAR   
          JGE MOUSE4
          CMP CX,524
          JGE MOUSE4  
          CMP CX,421
          JLE MOUSE4; 
       MOV DX,8     ;TRIANGULO
       MOV CX,450  
       MOV VAR1,8
       MOV VAR2,111
  M4U:  CALL COLOR2
       INC DX
       CMP DX,VAR2
       JE N4U
       JMP M4U 
  N4U:  DEC CX
       INC VAR1
       DEC VAR2
  YS2U: CALL COLOR2
       DEC DX 
       CMP DX,VAR1
       JE M4U
       CMP CX,418
       JE SIG4U
       JMP YS2U 
SIG4U:       
       MOV CX,450     ;RECTANGULO
       MOV DX,8        
  M5U:  CALL COLOR2
       INC CX
       CMP CX,490
       JE N5U
       JMP M5U
  N5U:  MOV CX,450
       INC DX
       CMP DX,113
       JE SIG5U     
       JMP M5U

SIG5U:  MOV CX,490      ;TRIAGULO
       MOV DX,8
       MOV VAR4,8
       MOV VAR5,111
  M6U:  CALL COLOR2
       INC DX
       CMP DX,VAR5
       JE N6U
       JMP M6U 
  N6U:  INC CX
       INC VAR4
       DEC VAR5
  YS3U: CALL COLOR2
       DEC DX 
       CMP DX,VAR4
       JE M6U
       CMP CX,522
       JE MOUSEL4
       JMP YS3U 
 ;CAMBIAR DE COLOR LETRA
MOUSEL4:MOV AX,4   ;DEVOLVER CONTROL  
        MOV CX,300
        MOV DX,200
        INT 33H 
   MO3: MOV AX,3
        INT 33H
       CMP DX,342 
       JGE LF21 
       JMP MO3
  LF21: CMP DX,378
       JLE LF22
       JMP MO3
  LF22: CMP CX,7
       JGE LF23
       JMP MO3
  LF23: CMP CX,178
       JLE CAMBIA7
       JMP MO3
           
CAMBIA7:MOV AX,3
        INT 33H
        CMP BX,1
        JE CIRCULOL
        JMP CAMBIA7
     ;DESAPARECER-COLOR DE FONDO     
CIRCULOL: CMP DX,378 ;VALIDAR - LETRA   
          JGE MO3
          CMP CX,178
          JGE MO3  
          CMP DX,342  
          JLE MO3
          CMP CX,7
          JLE MO3     ;
          MOV CX,7    ;columna de inicio
          MOV DX,342    ;fila de inicio 
     L23:  CALL COLOR1
          INC CX
          CMP CX,180
          JE L24
          JMP L23
      L24: MOV CX,7
          INC DX
          CMP DX,380
          JE L25     
          JMP L23
                       ;DESAPARECER FIGURA
 L25:     MOV CX,419    ;columna de inicio
          MOV DX,4  ;fila de inicio
     L26:  CALL COLOR1
          INC CX
          CMP CX,530
          JE L27
          JMP L26
      L27: MOV CX,419
          INC DX
          CMP DX,116 
          JE  MOUSE1_1  
          JMP L26  
     ;xxxxxxxxxxxxxxxxxxxxxxxxx COLORES xxxxxxxxxxxxxxxxx
COLOR: MOV AH,0CH    
       MOV AL,09H ;color AZUL
       INT 10H 
       RET 
       
COLOR1:MOV AH,0CH
       MOV AL,02H ;color   VERDE
       INT 10H 
       RET
                         
COLOR2: MOV AH,0CH    
        MOV AL,04H ;color rojo   
        INT 10H 
        RET 
        
COLOR3:MOV AH,0CH
       MOV AL,0EH  ;color amarillo
       INT 10H
       RET
            
COLOR4:MOV AH,0CH
       MOV AL,0BH  ;color  CELESTE
       INT 10H
       RET 
   
COLOR5:MOV AH,0CH
       MOV AL,08H   ;color gris
       INT 10H
       RET 
       
COLOR6:MOV AH,0CH
       MOV AL,0FH   ;color blanco
       INT 10H
       RET         

CODIGO ENDS
       END INICIO