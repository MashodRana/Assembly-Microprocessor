INCLUDE EMU8086.INC
 
.MODEL SMALL
.STACK 100H
.DATA
    CR EQU ODH
    NL EQU OAH
    INP DB 0
    CON DB 0
    TEN DB 0AH
    TEXT DB "HELLO SLACK_CODER$"
    
.CODE
 
    MAIN PROC
 
        MOV AX,@DATA
        MOV DS,AX 
        
START:
    MOV AL,TEXT[SI]
    CMP AL,'$'
    JE HERE
    INC SI
    JMP START
HERE:
    DEC SI
NEXT:
    MOV DL,TEXT[SI]
    MOV AH,02H
    INT 21H
    CMP SI,0
    JE EXIT
    DEC SI
    JMP NEXT
    
EXIT:
    MOV AH,4CH
    INT 21H
 
 
   END MAIN
   MAIN ENDP
 
RET
 
