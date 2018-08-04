;   "Know Yourself"
;	Slack_Coder(Mashod Rana)
;	University of Asia Pacific
;==========================================


include emu8086.inc
.MODEL SMALL
.STACK 100H
.DATA
    RE      EQU ODH
    NL      EQU 0AH
    INP     DB  0
    CON     DB  0
    FOUR    DB  4
    BAZUR   DB  1
    ZUR     DB  2
    CONVERT DB  0
    TEN     DB  10
     
    
    
    
.CODE

    MAIN PROC
    
    MOV AX,@DATA
    MOV DS,AX

PRINTN "ODD series with diference 4 :"
PRINT "1"   
 
EVEN:
    PRINT " "
   MOV AL,BAZUR
   ADD AL,FOUR
   MOV BAZUR,AL
   MOV CONVERT,AL 
   
RUPANTOR:
    XOR AX,AX
    MOV AL,CONVERT
    DIV TEN
    INC CON
    MOV BL,AH  
    PUSH BX    
    CMP AL,0H
    JE LINE
    MOV CONVERT,AL
    JMP RUPANTOR
    
LINE:
    
    MOV AH,02H 
    
OUTPUT:
    CMP CON,0H
    JE GOTO     

    POP DX
    ADD DL,'0'
    INT 21H
    DEC CON
    JMP OUTPUT 
    
GOTO:
    MOV AL,BAZUR
    CMP AL,99
    JGE NEXT_LEVEL
    JMP EVEN

    
NEXT_LEVEL:
    PRINTN
    

    MOV CON,0
    MOV CONVERT,0
    MOV ZUR,2
    PRINTN "EVEN Series difference 4 :"
    PRINT "2"
ODD:
   PRINT " "
   MOV AL,ZUR
   ADD AL,FOUR
   MOV ZUR,AL
   MOV CONVERT,AL 
   
RUPANTOR2:
    XOR AX,AX
    MOV AL,CONVERT
    DIV TEN
    INC CON
    MOV BL,AH  
    PUSH BX    
    CMP AL,0H
    JE LINE2
    MOV CONVERT,AL
    JMP RUPANTOR2
    
LINE2:
    
    MOV AH,02H 
    
OUTPUT2:
    CMP CON,0H
    JE GOTO2     

    POP DX
    ADD DL,'0'
    INT 21H
    DEC CON
    JMP OUTPUT2 
    
GOTO2:
    MOV AL,ZUR
    CMP AL,99
    JGE NEXT_LEVEL2
    JMP ODD
NEXT_LEVEL2:
EXIT:
    MOV AH,4CH
    INT 21H
    
        
    END  MAIN
    MAIN ENDP
RET