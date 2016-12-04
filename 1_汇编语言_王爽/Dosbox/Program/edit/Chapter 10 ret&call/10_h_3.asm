assume cs:code

data segment
    db 10 dup (0)
data ends

code segment
start : mov ax, 12666
          mov bx, data
          mov ds, bx
          mov si,0
          call dtoc

          mov ax,4c00h
          int 21h

dtoc: push ax
        push cx
        push bx
        push si
        mov bl,10
         div bl
         mov cl,al
         mov ch,00
         add ah,30h
         mov [si],ah
         inc si
         jcxz done
         loop dtoc

done: mov byte ptr [si],30h
          pop si
          pop cx
          pop bx
          pop ax
          ret


code ends
end start
