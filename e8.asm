data segment
msg db "enter number:$"
data ends
code segment
assume cs:code,ds:data
start: mov ax,data
       mov ds,ax
       mov dx,offset msg
       mov ah,09
       int 21h
       xor dx,dx
       xor cx,cx
       mov ah,01
       int 21h
       sub al,30h
       mov bl,al
       int 21h
       sub al,30h
       mov ah,bl
       aad
       mov cl,al
L1:mov al,cl
   xor ah,ah
   aam
   mov bx,ax
   add bx,3030h
   mov dl,bh
   mov ah,02
   int 21h
   mov dl,bl
   int 21h
   mov dl,20h
   int 21h
   loop L1
   mov ah,4ch
   int 21h
code ends
end start
