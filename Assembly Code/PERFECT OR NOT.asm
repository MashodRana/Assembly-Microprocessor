
; *******************CHECK NUMBER is PERFECT OR NOT***********
;*********author: Slack_Coder ***"know yourself"
;*********University of Asia Pacific
;   -------------------------------------------------------------------------------------
;   -------------------------------------------------------------------------------------

INCLUDE EMU8086.INC
.MODEL SMALL
.STACK 100H
.DATA
    x db ?
.CODE

    MAIN PROC

        MOV AX,@DATA
        MOV DS,AX

mov ah,1
int 21h
sub al,48
mov cl,al
mov ch,0

mov bh,0
mov bl,0

mov x,cl
sub x,1
printn
cmp cl,1
je notPerfect

divide:
    inc bh
    mov al,cl
    mov ah,0
    div bh
    
    cmp x,bh
    je check
    
    cmp ah,0
    je sum 
    jmp divide
    
sum:
add ch,bh
jmp divide



check:
    cmp cl,ch
    je perfect
    jmp notPerfect
 
perfect:
    print "Perfect Number"
    jmp exit
    
notPerfect:
    print "Not Perfect Number"
    jmp exit
 
 
exit:
    mov ah,4ch
    int 21h



ret




