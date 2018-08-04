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
      
      
      LEA DX,MSG
      MOV AH,9
      INT 21H
      
      MOV AH,1
      INT 21H
      
      ADD AL,2
      
      MOV BL,26
      SUB AL,'a'
      
      XOR AH,AH
      DIV BL
        
        MOV VAL,AH
        ADD VAL,'a'
        
        LEA DX,MSG2
        MOV AH,9
        INT 21H
       

    
    
    
    
MAIN ENDP

END  MAIN  


RET
