;Sum of N numbers
;   "Know Yourself"
;	Slack_Coder(Mashod Rana)
;	University of Asia Pacific
;==========================================

INCLUDE EMU8086.INC

.MODEL SMALL
.STACK 100H
.DATA
    CR EQU ODH
    NL EQU OAH
    INP DB 0
    CON DB 0
    TEN DB 0AH
.CODE

    MAIN PROC
        
        MOV AX,@DATA
        MOV DS,AX
   PRINTN
   PRINTN "     <== A programm for find Sum of 1 to N( N<23) ==>"
   PRINTN   "   **N should be 23 TO skip Division ERROR"
   PRINTN "Enter number n for find sum of 1 to N: "
    
    
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
    ADD AL,01H
    MUL INP
    MOV BL,02H  ;FIND SUM OF 1 TO N USING THE 
    DIV BL      ;FORMULA (N*(N+1))/2
    MOV INP,AL
;---------------------    
RUPANTOR:
    XOR AX,AX
    MOV AL,INP
    DIV TEN
    INC CON
    MOV BL,AH  ;STORE THE NUMBER INTO STACK
    PUSH BX    ;IN REVERSE ORDER
    CMP AL,0H
    JE LINE
    MOV INP,AL
    JMP RUPANTOR     
;========================
    
LINE:
    PRINTN
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

EXIT:
    MOV AH,4CH
    INT 21H
   
   
   END MAIN
   MAIN ENDP

RET
        