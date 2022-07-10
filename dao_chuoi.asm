.model small
inchuoi macro chuoi
    mov ah,9
    lea dx,chuoi
    int 21h
endm
.stack 100
.data
    msg1 db "Nhap MSV:$"
    msg2 db 10,13, "Ho ten:Bui Bao Ngoc$"
    msg3 db 10,13, "Nhap sai !!!!$"
    xdong db 10,13,"$"
    msv1 db "AT160242"
    msv2 db "at160242"
    str db 100,?,100 dup ('$')
    msg4 db 10,13, "Nhap chuoi:$"
    msg5 db 10,13,"Dao chuoi:$"
    str1 db 100,?,100 dup ('$')
    
.code 
main proc
    mov ax,@data
    mov ds,ax
    mov es,ax
    
;nhap msv
nhapmsv:
    inchuoi msg1
;nhap chuoi
    mov ah, 0Ah
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
nhapchuoi:
    inchuoi msg4
    mov ah, 0Ah
    lea dx,str1
    int 21h
    inchuoi msg5
    xor cx,cx
    lea si,str1+2
    mov cl, [str1+1]
    lappush:
        push [si]
        inc si
        loop lappush
    mov cl,[str1+1]
    hienthi:
        pop dx
        mov ah,2
        int 21h
        loop hienthi
thoat:
    mov ah,8
    int 21h
    mov ah,4Ch
    int 21h
    main endp
end main
        
    
    