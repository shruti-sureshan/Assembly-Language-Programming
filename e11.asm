Print macro x
   mov dx,offset x
   mov ah,09h
   int 21h
endm

data segment
   str1 db 10,'Enter first no$',
   str2 db 10,'Enter second no$',
   str3 db 10,'The result is $',
   n1 db ?
   n2 db ?
data ends

code segment
assume ds:data,cs:code
start: mov ax,data
       mov ds,ax
       Print str1
       mov ah,01h
       int 21h
       sub al,30h
       mov bl,al
       int 21h
       sub al,30h
       mov ah,bl
       aad
       mov n1,al
       Print str2
       mov ah,01h
       int 21h

       sub al,30h
       mov bl,al
       int 21h
       sub al,30h
       mov ah,bl
       aad
       mov n2,al
       Print str3
       mov ah,00h
       mov al,n1
       mov bl,n2
       div bl
       mov ah,00h
       aam
       mov cl,al
       mov dl,ah
       mov dh,00h
       add dl,30h
       mov ah,02h
       int 21h
       mov dl,cl
       add dl,30h
       int 21h
       mov ah,4ch
       int 21h
code ends
end start
