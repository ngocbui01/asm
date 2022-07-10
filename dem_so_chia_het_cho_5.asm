.model small 
inchuoi macro chuoi
    mov ah,9
    lea dx,chuoi
    int 21h 
    endm 
.stack 100h
.data
    msg1 db "Nhap MSV: $"
    msg2 db 10,13,"Ho ten: Bui Bao Ngoc$$"
    msg3 db 10,13,"!!!Thong tin sai$"
    xdong db 10,13,"$"
    msv1 db "AT160242" 
    msv2 db "at160242"
    str db 100,?,100 dup('$') 
    chuoi db 0,5,6,8,10,155,190,152 
    msg4 db 10,13,"So luong so chia het cho 5 la: $"
    count dw 0
.code
main proc 
    mov ax,@data
    mov ds,ax 
    mov es,ax   
;nhap msv 
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
;dem so luong so chia het    
    inchuoi msg4   
    xor cx,cx
    mov cl,8  ;do dai chuoi so
    lea si,chuoi
ktr_chuoi:
    xor ax,ax
    mov al,[si] 
    xor dx,dx
    mov bx,5    ;chia het cho so nao thi nhap vao day
    div bx
    cmp dx,0
    jz cong1
    inc si        
    loop ktr_chuoi 
in_count:
    xor ax,ax
    xor cx,cx
    mov bx,10
    mov ax,count
    lappush: 
        xor dx,dx
        div bx 
        push dx  
        inc cx
        cmp ax,0
        jz hienthi 
        jmp lappush
    hienthi:
        pop dx
        add dx,30h
        mov ah,2
        int 21h
        loop hienthi
    thoat: 
        mov ah,4ch
        int 21h   
cong1: 
    add count,1
    inc si
    loop ktr_chuoi 
    jmp in_count     
    main endp
end main