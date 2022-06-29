.model small
.stack 100h
.data 
    chuoi db 256  dup ("$")
    tb1   db    10,13 ,"nhap ma sinh vien: $"
    tb2   db    10,13 ,"Ho va Ten :Dao Huu Quy $"
.code
main proc
    mov ax,@data
    mov ds,ax
    
    ;in thong bao 1
    mov ah,9
    lea dx,tb1
    int 21h
    
    ;nhap ma sinh vien
    lea dx,chuoi
    mov ah,10
    int 21h
    
    ;in thong bao 2
    mov ah,9
    lea dx,tb2
    int 21h
    
    ;thoat
    mov ah,4ch
    int 21h
 main endp
end


