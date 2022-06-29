.model small
.stack 100
.data
    tb1 db 10,13,"nhap so: $"
    tb2 db 10,13,"nhi phan: $"
    tb3 db 10,13,"hexa: $"
    
    str 256 dup ("$")
    num dw ?
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
    
    
    
    mov ax,0
    mov bx,10
    mov cx,0
    mov cl,[str+1]
    lea si,[str+2]
    dangSo:
    mov dx,0
    mul bx
    mov dl,[si]
    sub dl,48
    add ax,dx
    inc si
    loop dangSo
    
    
    
    mov num,ax
    
    
    call nhiphan 
    call 16
    
    mov ah,4ch
    int 21h
    
    
main endp
nhiphan proc
    mov ah,9
    lea dx,tb2
    int 21h
    
    
    mov ax,num
    mov bx,2
    mov cx,0
    chia2:
    mov dx,0
    div bx
    push dx
    inc cl
    cmp ax,0
    je hienthi
    jmp chia2
    
    hienthi:
    pop dx
    add dx,48
    mov ah,2
    int 21h
    loop hienthi 
    
    
nhiphan endp

16 proc  
    
    
    
    mov ah,9
    lea dx,tb3
    int 21h
    
    
    mov ax,num
    mov bx,16
    mov cx,0
    chia16:
    mov dx,0
    div bx
    push dx
    inc cl
    cmp ax,0
    je hienthi1
    jmp chia16
    
    hienthi1: 
    cmp cl,0
    je next
    
    pop dx
    cmp dx,10
    je next1 
    cmp dx,11
    je next2
    cmp dx,12
    je next3
    cmp dx,13
    je next4
    cmp dx,14
    je next5
    cmp dx,15
    je next6
    
    add dx,48
    mov ah,2
    int 21h
    loop hienthi1
    
    next:
    mov ah,4ch
    int 21h
    
    next1:
    dec cl
    mov dx,"A"
    mov ah,2
    int 21h 
    jmp hienthi1
    
    next2:
    dec cl
    mov dx,"B"
    mov ah,2
    int 21h
    jmp hienthi1
    
    next3:
    dec cl
    mov dx,"C"
    mov ah,2
    int 21h
    jmp hienthi1
    
    next4:
    dec cl
    mov dx,"D"
    mov ah,2
    int 21h
    jmp hienthi1
    
    next5:
    dec cl
    mov dx,"E"
    mov ah,2
    int 21h
    jmp hienthi1
    
    next6:
    dec cl
    mov dx,"F"
    mov ah,2
    int 21h
    jmp hienthi1
    
     
   ret
16 endp  
    
end
    
    
    
    
