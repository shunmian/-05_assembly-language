assume cs:code
code segment
        dw 0123h,0456h,0789h,0abch,0defh,0fedh,0cbah,0987h
        dw 0,0,0,0,0,0,0,0
start:  mov ax,10h
        mov ss,ax
        mov sp,18h

        mov bx,0
        mov cx,8
s1:     push cs:[bx]
        add bx,2h
        loop s1

        mov bx,0
        mov cx,8
s2:   pop cs:[bx]
        add bx,2h
        loop s2

        mov ax, 4C00h
        int 21h
code ends
end start
