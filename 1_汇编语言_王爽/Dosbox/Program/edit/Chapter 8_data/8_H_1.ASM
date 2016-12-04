assume cs:code
data segment
        db '1975','1976','1977','1978','1979','1980','1981','1982'
        db '1983','1984','1985','1986','1987','1988','1989','1990'
        db '1991','1992','1993','1994','1995'

        dd 16,22,382,1356,2390,8000,16000,24486,50065,97479,140417,197514
        dd 345980, 590827, 803530,1183000,1843000,2759000,3753000,4649000,5937000

        dw 3,7,9,13,28,38,130,220,476,778,1001,1442,2258,2793,4037,5635,8226
        dw 11542,14430,15257,17800
data ends

table segment
        db 21 dup ('year summ ne ?? ')
table ends

code segment
start:  mov ax,table
        mov ds,ax

        mov ax,data
        mov es,ax

        mov bp,0
        mov si,54h
        mov di,00a8h
        mov bx,0
        mov cx,21
s:      mov ax,es:[bp].00h
        mov [bx].00h,ax
        mov ax,es:[bp].02h
        mov [bx].02h,ax

        mov ax,es:[si].00h
        mov [bx].05h,ax
        mov ax,es:[si].02h
        mov [bx].07h,ax

        mov ax,es:[di].00h
        mov [bx].0ah,ax

        mov dx,[bx].07h
        mov ax,[bx].05h
        mov sp,[bx].0ah
        div sp
        mov [bx].0dh,ax

        add bp,0004h
        add si,0004h
        add di,0002h
        add bx,0010h
        loop s

        mov ax, 4c00h
        int 21h
code ends
end start
