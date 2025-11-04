section .text

global add_9byte
global sub_9byte

add_9byte:
    push rbx
    push r12
    
    mov rax, [rdi]
    add rax, [rsi]
    mov [rdx], rax
    
    mov al, byte [rdi+8]
    adc al, byte [rsi+8]
    
    setc r12b
    
    mov [rdx+8], al
    
    movzx rax, r12b
    
    pop r12
    pop rbx
    ret

sub_9byte:
    push rbx
    push r12
    
    mov rax, [rdi]
    sub rax, [rsi]
    mov [rdx], rax
    
    mov al, byte [rdi+8]
    sbb al, byte [rsi+8]
    
    setc r12b
    
    mov [rdx+8], al
    
    movzx rax, r12b
    
    pop r12
    pop rbx
    ret