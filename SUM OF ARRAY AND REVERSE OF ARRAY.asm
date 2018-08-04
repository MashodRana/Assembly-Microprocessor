include emu8086.inc
.MODEL SMALL
.STACK 100H
.DATA
    AR DW 10,20,30,40,50,60
    SUM DW 0
    CONVERT DB 0
    TEN DB 10
    CON DB 0
    E_COUNT DB 6
    
.CODE

    MAIN PROC
    
    MOV AX,@DATA
    MOV DS,AX
    
    ; -------------------------- 
DO_SUM:
    CMP E_COUNT,0
    JE PRINT
    DEC E_COUNT
    MOV AX,AR[DI]
    ADD SUM,AX
    ADD DI,2
    JMP DO_SUM

    
PRINT:

    MOV AX,SUM
    MOV CONVERT,AL
     
; --------------------------
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
    JE PRINT1     
 
    POP DX
    ADD DL,'0'
    INT 21H
    DEC CON
    JMP OUTPUT

    ; -------------------------- 
PRINT1:
    PRINTN
    SUB DI,2
    MOV E_COUNT,0
    MOV CON,0
    
PRINT2:
    MOV AX,AR[DI]
    MOV CONVERT,AL
    INC E_COUNT
 
; --------------------------
RUPANTOR1:
    XOR AX,AX
    MOV AL,CONVERT
    DIV TEN
    INC CON
    MOV BL,AH  
    PUSH BX    
    CMP AL,0H
    JE LINE1
    MOV CONVERT,AL
    JMP RUPANTOR1
 
LINE1:
 
    MOV AH,02H 
 
OUTPUT1:
    CMP CON,0H
    JE GOTO1     
 
    POP DX
    ADD DL,'0'
    INT 21H
    DEC CON
    JMP OUTPUT1
GOTO1:
PRINT " "
    CMP E_COUNT,6
    JE EXIT
    SUB DI,2
    JMP PRINT2 
      
exit:
    mov ax, 4c00h
    int 21h
    
    
    
    END MAIN
    MAIN ENDP
 

ret

