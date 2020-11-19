Print macro msg
    mov ah,09h
    mov dx,offset msg
    int 21h
endm

data segment
        msg1 db, 10,  "Enter 10 elements $"
        array1 db 10 dup(?)
        msg2 db,10, "Sum is $"
        sum db 0
data ends

code segment
assume cs:code,ds:data
start:  mov ax,data
        mov ds,ax
        
        Print msg1

        lea bx,array1
        xor si,si
        mov cx,0Ah

next:   mov ah,01
        int 21h
        sub al,30h
        mov bx[si],al
        inc si
        loop next

        xor si,si
        mov cx,0Ah
        xor ax,ax

back:   mov dl,bx[si]
        mov al,sum
        add al,dl
        daa
        aad
        mov sum,al
        adc al,00 
        inc si
        loop back
        
        xor ax,ax
        mov al,sum
        aam
        mov cx,ax
        add cx,3030h

        Print msg2

        xor dx,dx
        mov dl,ch
        mov ah,02h
        int 21h

        xor dx,dx
        mov dl,cl
        sub dl,06h
        mov ah,02h
        int 21h

        mov ah,4ch
        int 21h
code ends
end start