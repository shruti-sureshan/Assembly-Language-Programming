Print macro msg
    mov ah,09h
    mov dx,offset msg
    int 21h
endm

data segment
        msg1 db "Enter string: $"
        msg2 db "Reverse: $"
        msg3 db "Palindrome $"
        msg4 db "Not Palindrome $"
        str1 db 25 dup('$')
        str2 db 25 dup('$')
data ends

code segment
assume cs:code, ds:data
start:  mov ax, data
        mov ds, ax      ;initialize data segment
        mov es, ax      ;initialize extra segment

        Print msg1

        lea di, str1
        xor cx, cx
        mov ah, 01
back1:  int 21h
        cmp al, 0dh
        jz endip
        stosb
        inc cx
        jmp back1

endip:  dec cx          ;so that end of string char is not counted
        lea si, str1
        add si, cx      ;go to the end of entered string
        lea di, str2
        inc cx
               
back2:  std             ; dec si
        lodsb           ;mov AL,[SI] 
        cld             ;clear DF=0, to increment DI
        stosb           ;mov [DI],AL and inc DI
        loop back2      ;continue until cx = 0

        Print msg2

        Print str2

        mov bh,str1      
        mov bl,str2
        cmp bh,bl       ;compare the two strings
        jnz np

        Print msg3
        jmp last

    np: Print msg4

  last: mov ah, 4ch
        int 21h         ;terminate code
code ends
end start