/* *******************String Reverse in Assembly***********
*********author: Slack_Coder ***"know yourself"
*********University of Asia Pacific
*/
; You may customize this and other start-up templates; 
; The location of this template is c:\emu8086\inc\0_com_template.txt

org 100h

include emu8086.inc

print "Enter string Length: "

    mov ah,1
    int 21h
    mov cl,al
    sub cl,48
    mov bx,0
    
printn
    
LooP1:
    mov ah,1
    int 21h
    mov [bx],ax
    inc bx
    cmp bl,cl
    je ne
    jmp LooP1
     
ne:
    printn
    print "Reverse String is: "
    jmp string
string: 
    dec bx
    mov dx,[bx]
    mov ah,2
    int 21h
     
    cmp bx,0
    jl exit
    jmp string
    
exit:
    mov ah,4ch
    int 21h
ret
