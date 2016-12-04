assume cs:code
data segment
        db "Beginner's All-purpose Symbolic Instruction Code.",0
data ends

code segment
start:  mov ax, data
        mov ds, ax
        mov si, 0
        call letterc
        mov ax, 4c00h
        int 21h

letterc: push si
            push cx

change:  mov cl,[si]
        mov ch, 00h
        jcxz ok
        cmp cx,61h
        jb s
        cmp cx,7ah
        ja s
        and cl, 11011111b
     s: mov [si], cl
        inc si
        loop change
    ok: pop cx
          pop si
          ret

code ends
end start
