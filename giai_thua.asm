.model small
inchuoi macro chuoi
    mov ah,9
    lea dx,chuoi
    int 21h
    endm
.stack 100h
.data 
    msg1 db "MSV: $"
    msg2 db 10,13,"Ho ten: Bui Bao Ngoc$"
    msg3 db 10,13,"!!!Thong tin sai$"
    xdong db 10,13,"$"
    msv1 db "AT160242" 
    msv2 db "at160242"
    str db 100,?,100 dup('$') 
    msg4 db 10,13,"Nhap n = $"
    msg5 db 10,13,"n! = $"
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
;nhap n    
    inchuoi msg4
    mov ah,1
    int 21h
    sub al,30h
    xor cx,cx
    mov cl,al
    inchuoi msg5    
    mov ax,1
    mov bx,1
giaithua: 
    mul bx
    inc bx
    cmp bx,cx
    jle giaithua
xor cx,cx 
mov bx,10
lappush:
    xor dx,dx
    div bx
    add dx,30h
    push dx
    inc cx
    cmp ax,0
    jne lappush
hienthi: 
    pop dx
    mov ah,2
    int 21h
    loop hienthi
thoat:
    mov ah,4ch
    int 21h 
    main endp
end main