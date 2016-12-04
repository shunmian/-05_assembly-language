; 实验13(1) 安装程序
assume cs:code

code segment
start:  mov ax,0
        mov es,ax
        mov di,200h

        mov ax,cs
        mov ds,ax
        mov si,offset repeat
        mov cx, offset dispend - offset disp
        cld
        rep movsb

        mov ax,0
        mov es,ax
        mov word ptr es:[4*7ch],200h
        mov word ptr es:[4*7ch+2],0h

        mov ax,4c00h
        int 21h

disp: push ax
        push dx
        push es
        push cs

        mov al,160
        mul dh
        add ax, 08b00h
        mov es, ax
        mov cl,ds:[si]
        mov ch,00h
        jcxz ok
        mov al,2
        mul dl
        mov dl,al
        mov dh,00h
        mov es:[dx],cl
        mov es:[dx+1],24h
        inc si
        add di,2
        jmp short disp

  ok: iret




dispend: nop

code ends
end start
