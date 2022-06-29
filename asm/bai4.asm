.model small
.stack 100
.data
    tb1 db 10,13,"chuoi so: $"
    tb2 db 10,13,"cac so chia het cho 5 la: $"
    
    str db 256 dup("$")

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
    
    
    mov bx,5
    lea si,[str+2]
    chia5:
    mov dx,0
    mov ax,0
    mov ax,[si]
    cmp ax,","
    je next1
    
    mov ah,0
    sub al,48
    div bx
    cmp dx,0
    je next2
    
    inc si
    cmp [si],"$"
    je next3
    jmp chia5
    
    next1:
    inc si
    jmp chia5
    
    next2:
    mov ax,0
    mov dx,0
    mov ah,2
    mov dl,[si]
    int 21h
    mov ah,2
    mov dl," "
    int 21h
    inc si
    jmp chia5
    
    next3:
    mov ah,4ch
    int 21h
    
main endp
end
    
    
    
main endp
end
    
    