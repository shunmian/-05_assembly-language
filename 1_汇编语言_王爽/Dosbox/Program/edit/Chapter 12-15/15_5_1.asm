assume cs:code

code segment
start:  mov ax,0b800h
        mov es,ax
        mov bx,0

        mov cx,4000
   s:   inc byte ptr es:[bx+1]
        add bx,2
        loop s
        mov ax,4c00h
        int 21h
code ends
end start
