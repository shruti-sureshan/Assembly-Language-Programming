Print macro msg
    mov ah,09h
    mov dx,offset msg
    int 21h
endm

data segment
        msg db, 10,  "Enter number: $"
        res db, 10,  "Result is :  $"
        num1 db 00h
        num2 db 00h
        num3 db 00h
        num4 db 00h
        result db 00h
data ends

code segment
assume cs:code,ds:data
start:  mov ax,data
        mov ds,ax

        Print msg
        
        mov ah,01h
        int 21h
        sub al,30h
        mov num1,al
        xor al,al
        int 21h
        sub al,30h
        mov num2,al
        xor al,al
        int 21h
        sub al,30h
        mov num3,al
        xor al,al
        int 21h
        sub al,30h
        mov num4,al

        xor ax,ax
        xor dx,dx
        xor cx,cx
        xor bx,bx

        mov al,num1
        mov bl,num2
        mov cl,num3
        mov dl,num4 

        add al,bl ; add num1 and num2
        daa

        add al,cl
        daa

        add al,dl
        daa

        mov result,al
        mov al,00
        adc al,al 

        Print res 

        mov ah,02h
        mov dl,result
        add dl,30h
        int 21h

        mov ax,4c00h
        int 21h
code ends
end start