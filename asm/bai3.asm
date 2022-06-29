.model small
.stack 100
.data
    tb1 db 10,13,"nhap chuoi: $"
    tb2 db 10,13,"so luong snt la: $"
    
    
    str db 256 dup("$")
    dem dw ?
    
.code
main proc
    
    mov ax,@data
    mov ds,ax
    
    mov ah,9
    lea dx,tb1
    int 21h
    
    lea dx,str
    mov ah,10
    int 21h
    
    mov ah,9
    lea dx,tb2
    int 21h
    
    mov dem,0
    mov dx,0
    mov ax,0
    lea si,[str+2]
    
    timsnt:
    mov dl,[si]
    
    cmp dl,"2"
    je tangdem
    
    cmp dl,"3"
    je tangdem
    
    cmp dl,"5"
    je tangdem
    
    cmp dl,"7"
    je tangdem
    
    
    cmp dl,","
    je next
    
    inc si
    
    cmp [si],"$"
    je next1
    jmp timsnt
    
    tangdem:
        inc dem
        inc si
        cmp [si],"$"
        jne timsnt
        
    next:
        inc si
        cmp [si],"$"
        jne timsnt
        
    next1:
        call chuyenSothanhChu
        mov ah,4ch
        int 21h    
    
    
main endp
chuyenSothanhChu proc
    mov ax,dem
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
    
chuyenSothanhChu endp
end
    
    
    




