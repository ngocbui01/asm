.model small
inchuoi macro chuoi
    mov ah,9
    lea dx,chuoi
    int 21h
endm
.stack 100
.data    
    tb1 db "MSV:$"
    tb2 db 10,13,"Ho ten: Bui Bao Ngoc$"
    tb3 db 10,13,"Nhap sai$"
    xdong db 10,13,"$"
    msv db "AT160242"
    str db 100,?,100 dup ("$")
.code 
main proc
    mov ax,@data
    mov ds,ax
    mov es,ax
nhapmsv:
    inchuoi tb1
    mov ah,0Ah
    lea dx,str
    int 21h
    xor cx,cx
    mov bx,8
    mov cl,[str+1]
    cmp bx,cx
    ja nhaplai
ktra:
    cld
    mov cl,[str+1]
    lea si,str+2
    lea di,msv
    repe cmpsb
    je intb
nhaplai:
    inchuoi tb3
    inchuoi xdong
    jmp nhapmsv
intb:
    inchuoi tb2
thoat:
    mov ah,4Ch
    int 21h
    main endp
end main
        