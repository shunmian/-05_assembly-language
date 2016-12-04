assume cs:code


code segment
start:  mov ax,0b800h
        mov es,ax
        mov bx,12*160+40*2

        mov al,'a'
   s:   mov ah,24h
        cmp al,'z'
        ja ok
        mov es:[bx],ax
        inc al
        loop s
   ok:  mov ax,4c00h
        int 21h
code ends
end start
