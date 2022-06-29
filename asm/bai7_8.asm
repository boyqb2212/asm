.model small
.stack 100
.data
    tb1 db 10,13,"nhap MSV: $"
    tb2 db 10,13,"HovaTen: Dao Huu Quy $"
    tb3 db 10,13,"nhap chuoi: $"
    tb4 db 10,13,"inthuong: $"
    msv db 256 dup ("$")
    str db 256 dup ("$")
.code
main proc
    mov ax,@data
    mov ds,ax
    
    mov ah,9
    lea dx,tb1
    int 21h
    
    lea dx,msv
    mov ah,10
    int 21h
    
    mov ah,9
    lea dx,tb2
    int 21h
    
    mov ah,9
    lea dx,tb3
    int 21h
    
    lea dx,str
    mov ah,10
    int 21h
    
    mov ah,9
    lea dx,tb4
    int 21h
    
    mov cx,0
    mov cl,[str+1]
    lea si,[str+2]
    
    hienthi:
    mov dx,[si]
    cmp dl,"a"
    jb next
    
    cmp dl,"z"
    ja next
    
    sub dl,32
    
    next:
    mov ah,2
    int 21h
    inc si
    
    loop hienthi
    
    mov ah,4ch
    int 21h
    
  main endp
end
    



