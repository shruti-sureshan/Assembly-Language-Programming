assume cs:code,ds:data
data segment
num1 dw 4444h
num2 dw 0002h
m dd 2 dup(?)
data ends
code segment
start:
mov ax, data
mov ds,ax
mov ax,num1
mov bx,num2
div bx
mov word ptr m,ax
mov word ptr m+2,dx
int 3
code ends
end start

