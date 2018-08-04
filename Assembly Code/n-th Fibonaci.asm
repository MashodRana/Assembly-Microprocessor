INCLUDE EMU8086.INC

.MODEL SMALL
.STACK 100H
.DATA
    CR EQU ODH
    NL EQU OAH
    INP DB 0
    CON DB 0
    TEN DB 0AH
    FLAG DB 2
    
.CODE

    MAIN PROC
        
        MOV AX,@DATA
        MOV DS,AX
   PRINTN
   PRINTN "     <== A programm for finding n-th Fibonaci Number ==>"
   PRINTN  
   PRINTN "Enter number less than 14: "
    
    
INPUT:
    MOV AH,01H
    INT 21H
    CMP AL,0DH
    JE CONVERTER
    
    AND AL,0FH      ;TAKE INPUT AN INTEGER NUMBER
    MOV BL,AL
    MOV AL,INP
    MUL TEN
    ADD AL,BL
    MOV INP,AL
    JMP INPUT
;===========================
CONVERTER:
    MOV AL,INP
    CMP AL,1
    JE  ONE
    CMP AL,2
    JE TWO
    
    XOR AX,AX
    MOV BL,1
CAL:
    ADD AL,BL
    MOV BH,AL
    MOV AL,BL
    MOV BL,BH
    
    INC FLAG
    MOV CL,FLAG
    MOV CH,INP
    CMP CL,CH
    JG RUPANTOR
    JMP CAL    
;---------------------    
RUPANTOR:
    MOV INP,BL
RUP:
    XOR AX,AX
    MOV AL,INP
    DIV TEN
    INC CON
    MOV BL,AH  ;STORE THE NUMBER INTO STACK
    PUSH BX    ;IN REVERSE ORDER
    CMP AL,0H
    JE LINE
    MOV INP,AL
    JMP RUP     
;========================
    
LINE:
    PRINTN
    PRINT "Answer is: "
    MOV AH,02H
OUTPUT:                  
    CMP CON,0H
    JE EXIT      ;PRINT NUMBER FROM STACK
    
    POP DX
    ADD DL,'0'
    INT 21H
    DEC CON
    JMP OUTPUT
  
;===========================
ONE:
    PRINTN
    PRINT "Answer is: 1"
    JMP EXIT
TWO:
    PRINTN
    PRINT "Answer is: 1"
    JMP EXIT
    
EXIT:
    MOV AH,4CH
    INT 21H
   
   
   END MAIN
   MAIN ENDP

RET
        