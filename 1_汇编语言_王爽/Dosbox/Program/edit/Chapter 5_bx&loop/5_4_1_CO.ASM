assume cs:code
code segment
        mov ax,2000
        mov ds,ax
        mov al,[0]
        mov bl,[1]
        mov cl,ds:[2]
        mov dl,ds:[3]
code ends
end
