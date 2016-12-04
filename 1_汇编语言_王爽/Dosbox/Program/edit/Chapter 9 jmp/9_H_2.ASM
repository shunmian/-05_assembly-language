assume cs:code
data segment
        db 'welcome to masm!'
        db 02h,00h,04h,02h,01h,07h
data ends

code segment
start:  mov ax,data
        mov ds,ax

        mov si,0080
        mov di,0010h

        mov cx,8
        mov dx,86e0h
        mov bx,0080h
s:      mov ax,[si]
        mov [bx],ax
        mov ax,[di]
        mov [bx+2],ax
        add bx,2
        add si,1
        loop s

        mov ax,4c00h
        int 21h
code ends
end start
