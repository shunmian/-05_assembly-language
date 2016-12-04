assume cs:code

code segment
start:  mov ax,0
        mov es,ax
        mov di,200h

        mov ax,cs
        mov ds,ax
        mov si, offset upc

        cld
        mov cx, offset upcend - offset upc
        rep movsb

        mov ax,0
        mov es,ax
        mov word ptr es:[4*7ch],0200h
        mov word ptr es:[4*7ch+2],0h

        mov ax,4c00h
        int 21h

upc:    push ax
        push si
        push cx

change: mov cl,[si]
        mov ch,00h
        jcxz ok
        and cl,11011111b
        mov [si],cl
        inc si
        jmp change

     ok:pop cx
        pop si
        pop ax
        iret

upcend: nop
code ends
end start
