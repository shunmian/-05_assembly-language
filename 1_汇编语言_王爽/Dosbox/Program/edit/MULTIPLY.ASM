assume cs:code
code segment
        mov bx,2h
        mov cx,11
s:     add bx,bx
        loop s

        mov ax,4c00h
        int 21h
code ends
end
