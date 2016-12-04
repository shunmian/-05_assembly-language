assume cs:code,ds:data

data segment
        db 'conversation'
data ends

code segment
start:  mov ax, data
        mov ds, ax
        mov si,0
        mov cx,12
s:       call capital
        loop s        

        mov ax, 4c00h
        int 21h

capital: and byte ptr [si],11011111b
         inc si
        ret

code ends
end start
