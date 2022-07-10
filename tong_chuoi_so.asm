.model small
inchuoi macro chuoi
    mov ah,9
    lea dx,chuoi
    int 21h
endm
.data
    msg1 db "Nhap MSV: $"
    msg2 db 10,13,"Ho ten SV: Bui Bao Ngoc$"
    msg3 db 10,13,"Thong tin sai!. Nhap lai$"
    msg4 db 10,13,"Tong cua chuoi s = $"
    xdong db 10,13,"$" 
    msv1 db "AT160242"
    msv2 db "at160242" 
    str db 100,?,100 dup('$') 
    str1 db 100,?,100 dup("$")  
    chuoi_so db 2,3 ;nhap san chuoi o day 
    sum dw 0
.code
main proc
    mov ax,@data
    mov ds,ax
    mov es,ax    
nhapmsv: 
    inchuoi msg1
;nhap chuoi
    mov ah,0Ah
    lea dx,str
    int 21h
    xor cx,cx
    mov bx,8
    mov cl,[str+1]
    cmp bx,cx
    ja nhaplai          
kiemtra:    
    cld 
    mov cl,[str+1]
    lea si,str+2
    lea di,msv1
    repe cmpsb
    je intb1  
    lea si,str+2
    lea di,msv2
    repe cmpsb
    je intb1
nhaplai:
    inchuoi msg3
    inchuoi xdong
    jmp nhapmsv
intb1:
    inchuoi msg2
;tinh tong chuoi so
    lea si,chuoi_so ;si tro den ngan nho dau tien cua mang
    xor cx,cx
    mov cl,4   ;so phan tu trong day so
    inchuoi msg4 
    tinh_tong: 
        xor bx,bx
        mov bl,[si]
        inc si
        add bx,sum
        mov sum,bx
        loop tinh_tong  
    xor cx,cx
    mov ax,sum
    mov bx,10
    lap_push:
        xor dx,dx
        div bx
        push dx
        inc cx
        cmp ax,0
        je hienthi
        jmp lap_push
    hienthi:
        pop dx
        add dx,30h
        mov ah,2
        int 21h
        loop hienthi       
thoat:
    mov ah,8
    int 21h
    mov ah,4ch
    int 21h
    main endp
end main