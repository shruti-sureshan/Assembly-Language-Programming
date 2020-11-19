Print macro x
      mov dx, offset x
      mov ah, 09h
      int 21h
endm

data segment
     str1 db 10, 'enter the 1st no.$'
     str2 db 10, 'enter the 2nd no.$'
     str3 db 10, 'result is.$'
data ends

code segment
assume cs:code, ds:data
start: mov ax,data
       mov ds,ax
       Print str1
       mov ah,01h
       int 21h
       sub al,30h
       ror al,4
       mov bl,al
       int 21h

       sub al,30h
       add al,bl
       mov cl,al
       Print str2
       mov ah,01h
       int 21h
       sub al,30h
       ror al,4
       mov bl,al
       int 21h

       sub al,30h
       add al,bl
       mov bl,cl
       mov cl,al
       mov al,bl
       sub al,cl
       das
       mov cl,al
       Print str3
       mov dl,cl
       and dx,00F0h
       ror dl,4
       add dl,30h

       mov ah,02h
       int 21h
       mov dl,cl
       and dx,000Fh
       add dl,30h
       mov ah,02h
       int 21h
       mov ah,4ch
       int 21h
code ends
end start
