INCLUDE EMU8086.INC

.MODEL SMALL
.STACK 100H
.DATA
    CR   EQU ODH
    NL   EQU OAH
    INP1 DB 0
    INP2 DB 0
    CON  DB 0
    TEN  DB 0AH
.CODE

    MAIN PROC
        
        MOV AX,@DATA
        MOV DS,AX
   
   PRINTN
   PRINTN "     <=== Programm for checking where two Numbers are Co-Prime or Not ===>"
   PRINTN
    
PRINTN " Enter 1st Number:"    
INPUT_1:
    MOV AH,01H
    INT 21H
    CMP AL,0DH
    JE  INPUT
                 ;take first number input
    AND AL,0FH
    MOV BL,AL
    MOV AL,INP1
    MUL TEN
    ADD AL,BL
    MOV INP1,AL
    JMP INPUT_1
;=========================== 
INPUT:
PRINTN
PRINTN " Enter 2nd Number:" 

INPUT_2:
    MOV AH,01H
    INT 21H
    CMP AL,0DH
    JE  COMPARE
                 ;take second number input
    AND AL,0FH
    MOV BL,AL
    MOV AL,INP2
    MUL TEN
    ADD AL,BL
    MOV INP2,AL
    JMP INPUT_2
;=======================
COMPARE:
    MOV AL,INP1
    MOV BL,INP2
    CMP AL,BL
    JG SWAP
JMP ACTOR
                    ;if (inp1>inp2) 
SWAP:               ;    then swaping the number
    XCHG AL,AL
    MOV INP1,AL
    MOV INP2,BL

;=========================
ACTOR:
    MOV CON,02H
FACTOR:
    XOR AX,AX
    MOV AL,INP1
    DIV CON      ;factorization of 1st number
    CMP AH,0H
    JE CHECK
HaHa:
    INC CON
    MOV BL,CON
    CMP BL,INP1
    JG CoPo
    JMP FACTOR  
;---------------------    
CHECK:
    XOR AX,AX
    MOV AL,INP2
    DIV CON     ;check if 2nd number is divide by 1st number 
    CMP AH,0H   ;       then not co prime 
    JE NOT_CO   ;else   go to level factor
    JMP HaHa     
;========================
NOT_CO:
    PRINTN
    PRINTN
    PRINT "     Opps! they are Not Co-Prime or Relative Prime"
    JMP EXIT                           ;prine result
CoPo:
    PRINTN
    PRINTN
    PRINT "     Hmm,they are Co-Prime or Relative Prime"
    JMP EXIT
  
;===========================

EXIT:
    MOV AH,4CH  ;exit function
    INT 21H
   
   
   END MAIN
   MAIN ENDP

RET
        