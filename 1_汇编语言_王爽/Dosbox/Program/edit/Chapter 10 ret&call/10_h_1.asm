assume cs:code,ds:data

data segment
    db 'Welcome to masm!',0
data ends

code segment
start:  mov dh,8
          mov dl,3
          mov cl,2


          call show_str
          mov ax,4c00h
          int 21h

show_str:  push ax
                 push ds
                 push si

                mov ax, data
                mov ds, ax
                mov si,0

                mov al,0ah
                dec dh
                mul dh
                add ax, 0b800h
                mov es, ax

                dec dl
                mov al,02h
                mul dl
                mov bp,ax
                mov ah,cl

        s:     mov cl,[si]
                mov ch,00h
                jcxz ok
                mov al, [si]
                mov es:[bp],al
                mov es:[bp+1], ah
                inc si
                add bp,2
                loop s
        ok:  pop si
                pop ds
                pop ax
                ret

code ends
end start
