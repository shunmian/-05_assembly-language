assume cs:code, ss:stack
stack segment
    db 128 dup (0)
stack ends

code segment
start: mov ax,stack
         mov ss,ax
         mov sp,128

        mov ax,0b800h
        mov es,ax
        mov bx,12*160+40*2

        mov al,'a'
   s:   mov ah,24h
        cmp al,'z'
        ja ok
        mov es:[bx],ax
        inc al
        call delay
        loop s
   ok:  mov ax,4c00h
        int 21h

delay:push dx
          push ax
            mov dx,1h
           mov ax,0000h
     s1: sub ax,1
           sbb dx,0
           cmp ax,0
           jne s1
           cmp dx,0
           jne s1

           pop ax
          pop dx
           ret


code ends
end start
