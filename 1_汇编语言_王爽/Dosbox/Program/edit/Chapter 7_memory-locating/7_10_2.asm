assume cs:code,ds:data
data segment
        db 'ibm             '
        db 'dec             '
        db 'dos             '
        db 'vax             '
        dw 0,0,0,0,0,0,0,0
data ends

code segment
start:  mov ax, data
        mov ds, ax
        mov bx, 0000h
        mov cx, 004h

s:     mov ds:[40h],cx
        mov si, 0000h
        mov cx, 3
s0:   mov al,ds:[bx+si]
        and al,11011111b
        mov ds:[bx+si],al
        inc si
        loop s0

        add bx,10h
        mov cx, ds:[40h]
        loop s

        mov ax,4c00h
        int 21h
code ends
end start
