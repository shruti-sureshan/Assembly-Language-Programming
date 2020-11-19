Print macro msg
    mov ah,09h
    mov dx,offset msg
    int 21h
endm

data segment
        msg1 db, 10,  "Enter Num1: $"
        msg2 db,10, "Enter Num2: $"
        msg3 db,10, "After Swapping:$"
        msg4 db,10, "Num1 is $"
        msg5 db,10, "Num2 is $"
        num1 db 00h
        num2 db 00h
data ends
code segment
assume cs:code,ds:data
start:  mov ax,data
        mov ds,ax

        Print msg1

        xor dx,dx
        mov ah,01h
        int 21h
        sub al,30h
        mov dh,al
        int 21h
        sub al,30h
        xor ah,ah
        mov ah,dh
        aad
        mov num1,al

        Print msg2

        xor dx,dx
        mov ah,01h
        int 21h
        sub al,30h
        mov dh,al
        int 21h
        sub al,30h
        xor ah,ah
        mov ah,dh
        aad
        mov num2,al

        Print msg3

        xor ax,ax
        xor cx,cx
        xor bx,bx

        call myswap

        print msg4

        xor dx,dx
        xor ax,ax
        mov ah,02
        mov dl,num1
        add dl,30h
        int 21h

        Print msg5

        xor dx,dx
        xor ax,ax
        mov ah,02
        mov dl,num2
        add dl,30h
        int 21h

        mov ah,4ch 
        int 21h

    myswap proc 
        mov bl,num2
	    mov al,num1
	    mov cl,al
	    mov al,bl
	    mov bl,cl
	    mov num1,al
	    mov num2,bl
        ret 
    endp

code ends
end start