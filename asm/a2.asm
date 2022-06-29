.model small
.stack 100
.data
    str db 256 dup ("$")
    tb1 db 10,13,"nhap ho va ten : $"
    tb2 db 10,13,"ma sinh vien :AT160439 $"
.code
main proc
    mov ax,@data
    mov ds,ax
    
    ;in thong bao 1
    mov ah,9
    lea dx,tb1
    int 21h
    
    ;nhap ho va ten
    lea dx,str
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
              




