.model small
.stack 100
.data
    tb1 db 10,13,"Nhap MSV: $"
    tb2 db 10,13,"HovaTen: Dao Huu Quy$"
    msv db 256 dup("$")
    
    tb3 db 10,13,"Nhap n(0<n<9):$"
    tb4 db 10,13,"n!= $"
    
    n db ?
    ketqua dw ?
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
    
    mov ah,1
    int 21h
    
    sub al,48
    mov n,al
    
    mov cx,0
    mov cl,n
    mov ax,1
    mov bx,1
    
    tinhgiaithua:
    mul bx
    inc bx
    
    loop tinhgiaithua
    
    mov ketqua,ax
    
    mov ah,9
    lea dx,tb4
    int 21h
    call chuyenSothanhChu
    
    mov ah,4ch
    int 21h
main endp
chuyenSothanhChu proc
    mov ax,ketqua
    mov cx,0
    mov bx,10
    chia10:
    mov dx,0
    div bx
    push dx
    inc cl
    cmp ax,0
    je hienthi
    jmp chia10
    
    hienthi:
    pop dx
    add dx,48
    mov ah,2
    int 21h
    loop hienthi
    
    ret
chuyenSothanhChu endp
end
    
    
    
         
    