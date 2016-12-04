assume cs:code

code segment
start:  mov al,08h
        out 70h,al
        in al, 71h
        mov ah,al
        mov cl,4
        shr ah,cl
        add ah,30h
        and al,00001111b
        add al,30h

        mov cx,0b800h
        mov ds,cx
        mov bp,12*160+40*2

        mov ds:[bp],ah
        mov byte ptr ds:[bp+1],24h
        mov ds:[bp+2],al
        mov byte ptr ds:[bp+3],24h

        mov ax,4c00h
        int 21h

code ends
end start
