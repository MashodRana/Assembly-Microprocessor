.MODEL SMALL
.STACK 100H
.DATA
    CR EQU 0DH
    NL EQU 0AH 
      
    MSG1 DB 'Enter Your string:$'
    MSG2 DB 'YOUR STRING$'
    STR  DB 255 DUP('?')
    VOW  DB NL,'Number of vowel: ',CR,NL,'$'
    
    CON  DB NL,CR,'Number of consonant: ',CR,NL,'$'
    NUM  DB NL,CR,'Number of constant:',CR,NL,'$' 
    
    
    
.CODE

    MAIN PROC   
        
    MOV AX,@DATA
    MOV DS,AX
    
    LEA DX,MSG1
    MOV AH,09H
    INT 21H
    
    
    
    
    MOV CL,0
    MOV CH,0
    MOV BL,0
    MOV BH,0
    
    LEA SI,STR
    MOV AH,01H
    
READ:
    INT 21H
    MOV [SI],AL
    INC SI
    CMP AL,0DH
    JE OUTPUT

VOWEL:
    CMP AL,'A'
    JE  VOWEL_COUNT
    CMP AL,'a'
    JE  VOWEL_COUNT
    CMP AL,'E'
    JE  VOWEL_COUNT
    CMP AL,'e'
    JE  VOWEL_COUNT
    CMP AL,'I'
    JE  VOWEL_COUNT
    CMP AL,'i'
    JE  VOWEL_COUNT
    CMP AL,'O'
    JE  VOWEL_COUNT
    CMP AL,'o'
    JE  VOWEL_COUNT
    CMP AL,'U'
    JE  VOWEL_COUNT
    CMP AL,'U'
    JE  VOWEL_COUNT
NUBER:
    CMP AL,'0'
    JL  CONSUNANT_COUNT
    CMP AL,'9'
    JG  CONSUNANT_COUNT

NUMBER_COUNT:
    INC BL
    JMP READ
    
CONSUNANT_COUNT:
    INC CH
    JMP READ
            
VOWEL_COUNT:
    INC CL
    JMP READ


    
OUTPUT:
    LEA DX,VOW
    MOV AH,09H
    INT 21H
    
    MOV DL,CL
    MOV AH,02H
    INT 21H
    
    ;CONSONANT
    LEA DX,CON
    MOV AH,09H
    INT 21H
    
    MOV DL,CH
    MOV AH,02H
    INT 21H
    
    ;NUMBER PRINT 
    LEA DX,NUM
    MOV AH,09H
    INT 21H
    
    MOV DL,BL
    MOV AH,02H
    INT 21H
   
    END MAIN
    MAIN ENDP 

RET