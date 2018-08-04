include emu8086.inc
.MODEL SMALL
.STACK 100H
.DATA
    
    
    num     dd      10000
    dvsr    dw      3 
    quot    dd      ?
    rmdr    dw      ? 
    
    
    
.CODE

    MAIN PROC
    
    MOV AX,@DATA
    MOV DS,AX
    
    mov     cx,dvsr                ;cx = dvsr
    xor     dx,dx                  ;dx = 0
    mov     ax,word ptr [num+2]    ;ax = high order numerator
    div     cx                     ;dx = rem, ax = high order quotient
    mov     word ptr [quot+2],ax   ;store high order quotient
    mov     ax,word ptr [num]      ;ax = low  order numerator
    div     cx                     ;dx = rem, ax = low  order quotient
    mov     word ptr [quot],ax     ;store low  order quotient
    mov     word ptr [rmdr],dx     ;store remainder
    
    mov dx,ax
    mov ah,02h
    int 21h

    END  MAIN
    MAIN ENDP
RET
