assume cs:code, ss:stack
stack segment
    db 128 dup (0)
stack ends

data segment
    dw 0,0
data ends

code segment
start: mov ax,stack
         mov ss,ax
         mov sp,128

         mov ax,data
         mov ds,ax

         mov ax, 0
         mov es, ax

         push es:[9*4]
         pop ds:[0]
         push es:[9*4+2]
         pop ds:[2]

         mov word ptr es:[9*4],offset int9
         mov word ptr es:[9*4+2],cs

        mov ax,0b800h
        mov es,ax
        mov ah,'a'
   s:  mov es:[12*160+40*2],ah
        inc ah
        call delay
        cmp ah,'z'
        jna s

        mov ax,0
        mov es,ax
        push ds:[0]
          pop es:[9*4]
          push ds:[2]
          pop es:[9*4+2]

        mov ax,4c00h
        int 21h

delay:push dx
          push ax
            mov dx,1h
           mov ax,0000h
     s1: sub ax,1
           sbb dx,0
           cmp ax,0
           jne s1
           cmp dx,0
           jne s1

           pop ax
          pop dx
           ret

int9: push ax
        push bx
        push es

        in al,60h

        pushf
        pushf
        pop bx
        and bx,11111100b
        push bx
        popf

        call dword ptr ds:[0]


        cmp al, 01
        jne int9ok
        mov ah, 71h
        mov bx,0b800h
        mov es,bx
        inc byte ptr es:[12*160+40*2+1]
int9ok: pop es
            pop bx
            pop ax
            iret

code ends
end start
