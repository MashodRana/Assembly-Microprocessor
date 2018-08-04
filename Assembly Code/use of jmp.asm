.MODEL SMALL
.DATA    
 
   CR EQU 0DH
   NL EQU 0AH 
   MSG DB "Give a character: $"
   MSG2 DB NL,CR,"Output: "
   VAL DB ?,"$"
 
.STACK
.CODE
 
MAIN PROC
      MOV AX,@DATA
      MOV DS,AX
 
    MOV AH,2
    MOV DL,0
    MOV CX,256
   
LEVEL:
    INT 21H
    
    INC DL
    DEC CX
    
    JNZ LEVEL
    
MOV AH,4CH
INT 21H
 
 
 
 
 
 
MAIN ENDP
    END  MAIN  
 
 
RET
