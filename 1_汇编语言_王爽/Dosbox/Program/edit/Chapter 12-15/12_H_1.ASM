assume cs:code

code segment
start:  mov ax,0
        mov es,ax
        mov di,200h

        mov ax,cs
        mov ds,ax
        mov si, offset do0

        mov cx, offset do0end - offset do0
        cld

        rep movsb

        mov ax,0
        mov es,ax
        mov word ptr es:[4*0],200h
        mov word ptr es:[4*0+2],0h


        mov ax,1000h
        mov bh,1
        div bh

        mov ax, 4c00h
        int 21h

  do0:  jmp short do0code
        db "divide error!"
do0code:
        mov ax,cs
        mov ds,ax
        mov si,202h

        mov ax,0b800h
        mov es,ax
        mov di,12*160+36*2

        mov cx, 0dh
    s0: mov al,[si]
         mov ah,24h
        mov es:[di],ax
        inc si
        add di,2
        loop s0

        mov ax, 4c00h
        int 21h

do0end: nop
code ends
end start
