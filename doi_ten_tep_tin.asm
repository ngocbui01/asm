dseg segment
oldfile db "C:\emu8086\MySource\data1.txt",0
newfile db "C:\emu8086\MySource\data3.txt",0
dseg ends
cseg segment
assume cs:cseg, ds:dseg, es: dseg
begin: mov ax, dseg
    mov ds, ax
    mov es, ax
    mov ah,56h ; rename/remove t�n file cu thanh moi
    lea dx, oldfile
    lea di, newfile
    int 21h
    mov ah, 4ch ; thoat ve Dos
    int 21h
cseg ends
end begin
