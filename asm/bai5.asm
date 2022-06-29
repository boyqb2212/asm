.model small
.stack 100
.data
    tb1 db 10,13,"chuoi: $"
    tb2 db 10,13,"so luong so am: $"
    tb3 db 10,13,"so luong so duong: $"
    
    str db 256 dup("$")
    dem dw ?
    dem1 dw ?
    
    
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
    lea si,[str+2]
    
    demsoam:
    mov dx,0
    mov dl,[si]
    cmp dl,"-"
    je next1
    
    inc si
    cmp [si],"$"
    jne demsoam
    
    mov ax,0
    mov dx,0
    mov dx,dem
    add dx,48
    mov ah,2
    int 21h
           
    
    mov ah,9
    lea dx,tb3
    int 21h
           
    mov dem1,0
    lea si,[str+2]       
    demsoduong:
    mov dx,0
    mov dl,[si]
    cmp dl,","
    je next2
    
    inc si
    cmp [si],"$"
    jne demsoduong
    
    inc dem1
    mov ax,0
    mov dx,0
    mov dx,dem1
    sub dx,dem
    add dx,48
    mov ah,2
    int 21h
    
    mov ah,4ch
    int 21h
    
    
    
    
    
    next1:
    inc dem
    inc si
    jmp demsoam
    
    next2:
    inc dem1
    inc si
    jmp demsoduong
    
main endp
end
    
    
    