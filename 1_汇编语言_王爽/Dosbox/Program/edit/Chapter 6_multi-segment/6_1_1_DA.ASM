assume cs:code
code segment
        dw 0123h,0456h,0789h,0abch,0defh,0fedh,0cbah,0987h

        mov ax,code
        mov ds,ax
        mov ax,0h
        mov bx,0h
        mov cx,8
s:     add ax,[bx]
        add bx,0002h
        loop s

        mov ax,4c00h
        int 21h
code ends
end
