.model small
.stack 100
.data
    tb1 db 10,13,"Nhap MSV: $"
    tb2 db 10,13,"HovaTen: Dao Huu Quy$"
    tb3 db 10,13,"nhap chuoi: $"
    tb4 db 10,13,"sum chuoi= $"
    
    msv db 256 dup("$")
    str db 256 dup("$")
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
    
    lea dx,str
    mov ah,10
    int 21h
    
    mov ah,9
    lea dx,tb4
    int 21h
    

    
    mov dx,0 
    mov ax,0 
    lea si,[str+2]
    sum:
    mov dl,[si]
    
    cmp dl,","
    je next
    
    sub dl,48
    add ax,dx
    
    inc si
    cmp [si],"$"
    je next1
    
    next:
    inc si
    cmp [si],"$"
    jne sum
    
    next1:
    call chuyenSothanhChu
    mov ah,4ch
    int 21h
    
main endp
chuyenSothanhChu proc
    
    mov bx,10
    mov cx,0
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
    
    
     
     