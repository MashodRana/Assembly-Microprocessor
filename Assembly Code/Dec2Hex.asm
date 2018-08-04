; *******************Decimal to Hexa Decimal in Assembly***********
;   *********author: Slack_Coder(mashod0rana@gmail.com) ***"know yourself"
;       *********University of Asia Pacific

INCLUDE EMU8086.INC
.MODEL SMALL
.STACK 100H
.DATA
    INPUT DB 0
    X DB 10
    ARRAY db 100 DUP(?)
    DIVIDER DB 16 

.CODE
 
    MAIN PROC
 
        MOV AX,@DATA        ;FOR DATA SEGMENT
        MOV DS,AX
  


;----------As a Input Function--------- 
print "Enter a Decimal number Less than 256: "   
INPUT_LABEL:
MOV AH,1
    INT 21H
    CMP AL,13
    JE print_comment
    SUB AL,48
    MOV CL,AL
    MOV AL,INPUT
    MUL X
    ADD AL,CL
    MOV INPUT,AL  
    JMP INPUT_LABEL
                   
                   
;------for Divide by 16 to get Hexanumber
print_comment:
    printn  
    printn
    print "Answer in HexaDecimal is: "
                   
DIVIDE:
    MOV AH,0
    MOV AL,INPUT
    DIV DIVIDER
    MOV ARRAY[DI],AH
    INC DI
    CMP AL,0
    JE RESULT
    MOV INPUT,AL
    JMP DIVIDE
    

            
RESULT:
    DEC DI
    CMP DI,0
    JL EXIT
    MOV DL,ARRAY[DI]
    CMP DL,9
    JG Get_A_to_F
    ADD DL,48
     
    MOV AH,2
    INT 21H
    JMP RESULT

Get_A_to_F:
    ADD DL,55
    MOV AH,2
    INT 21H
    JMP RESULT
    
exit:
    mov ah,4ch
    int 21h
    
MAIN ENDP
	END MAIN
   

    
