; "input more than one digit number and print it"
;   *********author: Slack_Coder(mashod0rana@gmail.com) ***"know yourself"
;       *********University of Asia Pacific 
;------------------------------------------------------------------------

INCLUDE EMU8086.INC
org 100h

.data
    A DB ?
    CON DB 0
.CODE    
    MOV AH,01H
    INT 21H
    
   SUB AL,'0'
   MOV A,AL
   
LEVEL:
    MOV AH,01H
    INT 21H
    
    CMP AL,0DH
    JE NEXT
    SUB AL,'0'
    MOV BL,AL
    MOV AL,A
    MOV CL,10
    MUL CL
    ADD AL,BL
    MOV A,AL
    JMP LEVEL
NEXT:
    PRINTN
BREAK:
    XOR AX,AX
    MOV AL,A
    MOV CL,10
    DIV CL
    MOV BL,AH
    PUSH BX
    INC CON
    CMP AL,0
    JE PRINT
    MOV A,AL
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

ret




