data segment
	msg db "enter number :$"
    num db 01h
data ends

code segment
assume cs:code,ds:data
start:	mov ax,data
	mov ds,ax
    ; PRINT STRING
	mov dx,offset msg
	mov ah,09
	int 21h

	xor dx,dx
	xor cx,cx
    ; ACCEPT FIRST NUM AND STORE IN BL
	mov ah,01
	int 21h
	sub al,30h
	mov bl,al
    ; ACCEPT SECOND NUM AND KEEP IT IN AL
	int 21h
	sub al,30h
    ; MOVE FIRST DIGIT IN AH , KEEP SECOND DIGIT IN AL AND RUN AAD (PACKING 16BIT AX IN 8BIT AL)
	mov ah,bl
	aad
    ; STORE IN COUNTER CL
	mov cl,al

    mov ah,02
    mov dl,20h
	int 21h

l1:	mov al,num
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
    inc num
	loop l1

	mov ah,4ch
	int 21h
code ends
end start