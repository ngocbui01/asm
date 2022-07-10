inchuoi macro chuoi 
    mov ah,9
    lea dx,chuoi
    int 21h
endm
inchuoi2 macro chuoi
    mov ah,9
    lea dl,chuoi
    int 21h
endm
dseg segment
    str1 db 100 dup (0)
    tb1 db "Ten file:$"
    chuoi dw 100 dup(?), 0
    nd db 10,13, "Noi dung:$"
    thefile dw ?
dseg ends
cseg segment
assume cs:cseg, ds:dseg
begin:
    mov ax,dseg
    mov ds,ax
    inchuoi tb1
    mov si,0
    lap:
        mov ah,01h ;nhap ky tu
        int 21h
        cmp al,0Dh ;check dau enter
        je stop
        mov ah,0
        mov chuoi[si],ax
        inc si
        jmp lap
    stop:
        inchuoi nd
        mov si,0
        mov cx,100
        lap1:
            mov ah,1
            int 21h
            cmp al,0Dh
            je stop1
            mov str1[si],al
            inc si
            jmp lap1
        stop1:
            mov ah,3Ch
            lea dx,chuoi
            mov cx,0
            int 21h
            mov cx,si
            mov thefile,ax
            mov ah,40h
            mov bx,thefile
            
    ghi_file: 
        mov dh,0
        mov dl,str1[si]
        int 21h
        loop ghi_file
        
    int 21h
    mov ah,4Ch
    int 21h
    cseg ends
end begin
        