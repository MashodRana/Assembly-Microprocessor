INCLUDE EMU8086.INC
 
.MODEL SMALL
.STACK 100H
.DATA
    CR EQU ODH
    NL EQU OAH
    INP DB 0
    CON DB 0
    SUM DB 0
    TEN DB 0AH
    FLAG DB 2
    FR DB 0
    FIB DB 8 DUP(?)
    A DB 0
 
.CODE
 
    MAIN PROC
 
        MOV AX,@DATA
        MOV DS,AX
MOV AL,0
MOV BL,1
MOV FIB[SI],BL
INC SI
GENERATE:
    ADD AL,BL
    MOV FIB[SI],AL
    MOV SUM,AL
    MOV AL,BL
    MOV BL,SUM
    INC SI
    CMP FR,8
    JE HERE
    INC FR
    JMP GENERATE

HERE:
    XOR SI,SI
    
SERIES:
    MOV AL,FIB[SI]
    MOV A,AL

BREAK1:
    XOR AX,AX
    MOV AL,A
    MOV CL,10
    DIV CL
    MOV BL,AH
    PUSH BX
    INC CON
    CMP AL,0
    JE PRINT1
    MOV A,AL
    JMP BREAK1
PRINT1:
    POP DX
    ADD DL,'0'
    MOV AH,02H

    INT 21H
    DEC CON
    CMP CON,0
    JE RANA
    JMP PRINT1
RANA:
PRINT " "
    CMP SI,7
    JE SUM_BREAK
    INC SI
    JMP SERIES
SUM_BREAK:
    PRINTN
    MOV CON,0
    SUB SUM,1
BREAK:
    XOR AX,AX
    MOV AL,SUM
    MOV CL,10
    DIV CL
    MOV BL,AH
    PUSH BX
    INC CON
    CMP AL,0
    JE PRINT
    MOV SUM,AL
    JMP BREAK
PRINT:
    POP DX
    ADD DL,'0'
    MOV AH,02H
    INT 21H
    DEC CON
    CMP CON,0
    JE EXIT
    JMP PRINT
   
EXIT:
    MOV AH,4CH
    INT 21H
 
 
   END MAIN
   MAIN ENDP
 
RET
 
