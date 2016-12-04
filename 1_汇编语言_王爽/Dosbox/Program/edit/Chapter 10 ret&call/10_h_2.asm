assume cs:code


code segment
start:  mov ax,4240h
          mov dx,000F
          mov cx,0ah
          call divdw

          mov ax,4c00h
          int 21
divdw: push ax
            mov ax,dx
            div cx              ;al是商，ah是余数

            

            mov dx, 6

            pop ax
code ends
end start
