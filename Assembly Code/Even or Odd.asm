; *******************check Even or Odd in Assembly***********
;   *********author: Slack_Coder ***"know yourself"
;       *********University of Asia Pacific


org 100h

include emu8086.inc

print "Enter a number : "

    MOV AH,1
    INT 21H
    MOV BL,AL
    
    
    MOV CL,2
    DIV CL  ;division AL/CL and mod is on AH register 
    
    printn 
    
    CHECK:
        CMP AH,0
        je EVEN
        jmP ODD
        
    ODD:
        PRINT "NUMBER IS ODD"
        JMP EXIT
        
    EVEN:
        PRINT "NUMBER IS EVEN"
        JMP EXIT
        
    EXIT:
        MOV AH,4CH
        INT 21H
    

ret




