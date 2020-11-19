data segment
        msg1 db "Enter first name: $"
        msg2 db "Enter second name: $"
        msg3 db "Full name: $"
        ss1 db 25 dup('$')
        ss2 db 25 dup('$')
data ends

code segment
assume cs:code, ds:data
start:  mov ax, data
        mov ds, ax
        mov es, ax

        mov dx, offset msg1     
        mov ah, 09
        int 21h                

        lea di, ss1            
        xor bx, bx             
        mov ah, 01
back1:  int 21h                
        cmp al, 0dh            
        jz endip1             
        stosb                 
        inc bx                
        jmp back1               

endip1: mov al,20h            
        stosb                   
        inc bx               

        mov dx, offset msg2     
        mov ah,09
        int 21h

        lea di, ss2           
        mov ah, 01
        xor cx, cx
back2:  int 21h
        cmp al, 0dh
        jz endip2
        stosb
        inc cx
        jmp back2

endip2: lea di, ss1            
        lea si, ss2
        add di, bx            
        cld                   
        rep movsb            
                               

        mov dx, offset msg3
        mov ah, 09
        int 21h

        mov dx, offset ss1
        int 21h

        mov ah, 4ch
        int 21h
code ends
end start
