;======================================================
;     Check whether a number is prime or not?
;======================================================
include emu8086.inc    ;use for new line

mov ah,01h    
int 21h

sub al,48   

printn        

mov bl,al     
div bl     
               
cmp al,1    
jz exit
     
mov bh,2     


prime_loop:          ;level declare
    mov ah,0
    mov al,bl
    div bh
    
    cmp ah,0
    jz prime_check
    
    inc bh
    jmp prime_loop
    
prime_check:
    cmp bh,bl
    jz prime
    jmp not_prime
    
prime:
    printn "PRIME"
    jmp exit
not_prime:
    printn "not Prime"  
    jmp exit
    
exit:
    mov ah,4ch
    int 21h

ret


        ; AX
        ; reminder ah
        ; cuition al 
       
       
        ;jmp-----unconditional
        ; -- conditional present
        ;je
        ;jl
        ;jel
        ;jle    
   
