.model small
inchuoi macro chuoi
    mov ah,9
    lea dx,chuoi
    int 21h 
endm    
.stack 100h
.data
    msg1 db "Nhap MSV: $"
    msg2 db 10,13,"Ho ten: Bui Bao Ngoc $"
    msg3 db 10,13,"!!!Thong tin sai$"
    xdong db 10,13,"$"
    msv1 db "AT160242" 
    msv2 db "at160242"
    str db 100,?,100 dup('$')  
    chuoi db 127,0,-4,-126,89,73,-34,-111
    msg4 db 10,13,"So luong so nguyen duong: $"
    msg5 db 10,13,"So luong so nguyen am: $"
    x dw 0
    y dw 0
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
;dem so luong so am duong     
    xor cx,cx
    mov cl,8 ;luu so phan tu cua day so   
    lea si,chuoi
    ktr_chuoi:        
        cmp [si],0 
        jl soam 
        jg soduong
        jz so0
    soduong: 
        add x,1
        jmp so0 
    soam: 
        add y,1
        jmp so0            
    so0:
        inc si
        loop ktr_chuoi     
;in so luong so duong
        inchuoi msg4
        xor ax,ax
        mov ax,x
        call hienthi_DEC
;in so luong so am
        inchuoi msg5
        xor ax,ax
        mov ax,y
        call hienthi_DEC        
thoat:         
     mov ah,4ch 
     int 21h  
     main endp
hienthi_DEC proc
        mov bx,10
        xor cx,cx
        lappush2:
            xor dx,dx
            div bx
            push dx
            inc cx
            cmp ax,0
            jz hienthi2
            jmp lappush2
        hienthi2: 
            pop dx
            add dx,30h
            mov ah,2
            int 21h
            loop hienthi2
thoat2:
    ret    
    hienthi_DEC endp 
end main