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
    tb3 db 10,13,"Nhap sai. Nhap lai$"
    xdong db 10,13, "$"
    msv1 db "AT160242"
    msv2 db "at160242"
    str db 100,?,100 dup ('$')
    tb4 db 10,13, "Nhap chuoi:$"
    tb5 db 10,13, "So ky tu trong chuoi:$"
    str1 db 100,?,100 dup ('$')
    kt db ?
    chia db 10
.code 
main proc
    mov ax,@data
    mov ds,ax
    mov es,ax
    
;nhap msv
nhapmsv:
    inchuoi tb1
;nhap chuoi
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
    lea di,msv1
    repe cmpsb
    je intb
    lea si,str+2
    lea di,msv2
    repe cmpsb
    je intb
nhaplai:
    inchuoi tb3
    jmp nhapmsv 
intb:
    inchuoi tb2
nhapchuoi:
    inchuoi tb4
    mov ah,0Ah 
    lea dx,str1
    xor cx,cx
    lap_nhap:
        mov ah,1
        int 21h
        cmp al,0Dh
        je xuong
        mov [si],al
        inc si
        inc cx
        jmp lap_nhap
    xuong:
        inchuoi tb5
        mov kt,cl
        mov al,cl
        mov ah,0
        xor cx,cx
    lapchia:
        xor dx,dx
        div chia
        add ah,30h
        mov dl,ah
        push dx
        inc cx
        xor ah,ah
        cmp ax,0
        jne lapchia
     ht:
        pop dx
        mov ah,2
        int 21h
        loop ht
        
        jne ht
        jmp thoat
thoat:
    mov ah,4Ch
    int 21h
    main endp
end main
    
     
    