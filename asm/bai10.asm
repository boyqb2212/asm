.model small
.stack 100
.data
    tb1 db 10,13,"nhap MSV: $"
    tb2 db 10,13,"HovaTen: Dao Huu Quy $"
    tb3 db 10,13,"nhap chuoi: $"
    tb4 db 10,13,"nhap ky tu muon tim: $"
    tb5 db 10,13,"tim thay $"
    tb6 db 10,13,"khong tim thay $"
    
    str db 256 dup("$")
    msv db 256 dup("$")
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
    
    mov ah,1
    int 21h
    
    mov cx,0
    mov cl,[str+1]
    lea si,[str+2]
    
    loop1:
    mov dx,0
    mov dx,[si]
    inc si
    cmp al,dl
    je timthay
    
    loop loop1
    
    khongtimthay:
    mov ah,9
    lea dx,tb6
    int 21h
    jmp exit
    
    timthay:
    mov ah,9
    lea dx,tb5
    int 21h
    jmp exit
            
    exit:
    mov ah,4ch
    int 21h
    
main endp
end
    
    