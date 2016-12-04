assume cs:code

code segment
start:  mov ax,0b800h
        mov es,ax
        mov di,12*160

        mov bx, offset s-offset s0
        mov cx,80
    s:  mov al,'!'
        mov ah, 24h
        mov es:[di],ax
        add di,2
        int 7ch
  s0: nop

        mov ax,4c00h
        int 21h

code ends
end start
