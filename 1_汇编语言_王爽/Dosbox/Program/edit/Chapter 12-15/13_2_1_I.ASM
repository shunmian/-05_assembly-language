assume cs:code

code segment
start:  mov ax,0
        mov es,ax
        mov di,0200h

        mov ax,cs
        mov ds,ax
        mov si, offset sq
        mov cx, offset sqend - offset sq
        cld
        rep movsb

        mov ax,0
        mov es,ax
        mov word ptr es:[4*7ch],0200h
        mov word ptr es:[4*7ch+2],0h

        mov ax,3456
        int 7ch
        mov ax, 4c00h
        int 21h

sq:     mov bx,ax
        mul bx
        iret
sqend:  nop

code ends
end start
