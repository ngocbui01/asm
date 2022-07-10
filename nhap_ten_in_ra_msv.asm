.model small 
inchuoi macro chuoi 
    mov ah,9
    lea dx,chuoi
    int 21h
endm
.stack 100h
.data
    msg1 db "Nhap ten SV: $"
    msg2 db 10,13,"MSV: AT160242$"
    msg3 db 10,13,"Thong tin sai!. Nhap lai$" 
    xdong db 10,13,"$"  
    hoten1 db "bui bao ngoc"
    hoten2 db "Bui Bao Ngoc" 
    str 100,?,100 dup("$")    
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
    lea di,hoten1
    repe cmpsb
    je intb1  
    lea si,str+2
    lea di,hoten2
    repe cmpsb
    je intb1
nhaplai:
    inchuoi msg3
    inchuoi xdong
    jmp nhapmsv
intb1:
    inchuoi msg2
thoat: 
    mov ah,4ch
    int 21h
    main endp
end main
