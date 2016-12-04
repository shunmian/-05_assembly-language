assume cs:code

code segment
start:  mov ax,0b800h
        mov ds,ax
        mov bx,12*160

        mov cx,80
    s:  mov al,'!'
        mov ah, 24h
        mov [bx],ax
        add bx,2
        loop s

        mov ax,4c00h
        int 21h

code ends
end start
