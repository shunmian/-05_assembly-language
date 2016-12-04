assume cd:code

code segment
start:  mov ax,0ff1
        mov bx,ax
        shl bx,1
        mov cl,3
        shl ax,cl
        add ax,bx
        mov ax,4c00h
        int 21h
code ends
end start
