assume cs:code,ds:data
data segment
        db 'welcome to masm!'
        db '................'
data ends

code segment
start:  mov ax, data
        mov ds, ax
        mov bx, 0000h
        mov cx, 0010h
s:      mov ax,ds:[bx]
        mov ds:[bx+10h],ax
        inc bx
        loop s

        mov ax,4c00h
        int 21h
code ends
end start
