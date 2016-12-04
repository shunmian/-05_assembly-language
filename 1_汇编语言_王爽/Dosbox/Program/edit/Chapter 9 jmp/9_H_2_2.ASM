assume cs:code

data segment
        db 'welcome to masm!'
        db 02h,24h,71h
data ends

code segment
start:  mov ax, data
        mov ds, ax
        mov ax,0B86eh
        mov ss, ax
        mov di,10h

        mov cx,3

s:     mov si,00h
        mov dx, cx
        mov cx,16
        mov bp,0040h
s1:   mov al, [si]
        mov [bp], al
        mov al,[di]
        mov [bp+1],al
        inc si
        add bp,02h
        loop s1

        mov ax, ss
        add ax, 0ah
        mov ss, ax
        mov cx,dx
        inc di
        loop s
        mov ax,4c00h
        int 21h
code ends
end start
