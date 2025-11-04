section .data
    test1_a: db 0x01, 0xEF, 0xCD, 0xAB, 0x89, 0x67, 0x45, 0x23, 0x01
    test1_b: db 0x01, 0xFF, 0xFF, 0xFF, 0xFF, 0xFF, 0xFF, 0xFF, 0x00
    test1_expected: db 0x02, 0xEE, 0xCD, 0xAB, 0x89, 0x67, 0x45, 0x23, 0x02
    test1_result: times 9 db 0
    
    test2_a: db 0xFF, 0xFF, 0xFF, 0xFF, 0xFF, 0xFF, 0xFF, 0xFF, 0xFF
    test2_b: db 0x01, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00
    test2_expected: db 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00
    test2_result: times 9 db 0
    
    test3_a: db 0x12, 0xF0, 0xDE, 0xBC, 0x9A, 0x78, 0x56, 0x34, 0x12
    test3_b: db 0x12, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00
    test3_expected: db 0x00, 0xF0, 0xDE, 0xBC, 0x9A, 0x78, 0x56, 0x34, 0x12
    test3_result: times 9 db 0
    
    test4_a: db 0x01, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00
    test4_b: db 0x02, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00
    test4_expected: db 0xFF, 0xFF, 0xFF, 0xFF, 0xFF, 0xFF, 0xFF, 0xFF, 0xFF
    test4_result: times 9 db 0
    
    test5_a: db 0xFF, 0xFF, 0xFF, 0xFF, 0xFF, 0xFF, 0xFF, 0xFF, 0x00
    test5_b: db 0xFF, 0xFF, 0xFF, 0xFF, 0xFF, 0xFF, 0xFF, 0xFF, 0x00
    test5_expected: db 0xFE, 0xFF, 0xFF, 0xFF, 0xFF, 0xFF, 0xFF, 0xFF, 0x01
    test5_result: times 9 db 0
    
    msg_test: db "Test ", 0
    msg_add: db "ADD", 10, 0
    msg_sub: db "SUB", 10, 0
    msg_operand_a: db "  A:        ", 0
    msg_operand_b: db "  B:        ", 0
    msg_expected: db "  Expected: ", 0
    msg_actual: db "  Actual:   ", 0
    msg_overflow: db "  Overflow: ", 0
    msg_yes: db "YES", 10, 0
    msg_no: db "NO", 10, 0
    msg_pass: db "  Result:   PASS", 10, 10, 0
    msg_fail: db "  Result:   FAIL", 10, 10, 0
    newline: db 10, 0

section .bss
    overflow_flag: resq 1

section .text
    global _start
    extern add_9byte
    extern sub_9byte

_start:
    mov rdi, 1
    call print_test_header
    call print_add
    
    mov rsi, test1_a
    call print_operand_a
    mov rsi, test1_b
    call print_operand_b
    
    mov rdi, test1_a
    mov rsi, test1_b
    mov rdx, test1_result
    call add_9byte
    mov [overflow_flag], rax
    
    mov rsi, test1_expected
    call print_expected
    mov rsi, test1_result
    call print_actual
    mov rdi, [overflow_flag]
    call print_overflow
    mov rsi, test1_expected
    mov rdi, test1_result
    call compare_and_print
    
    mov rdi, 2
    call print_test_header
    call print_add
    
    mov rsi, test2_a
    call print_operand_a
    mov rsi, test2_b
    call print_operand_b
    
    mov rdi, test2_a
    mov rsi, test2_b
    mov rdx, test2_result
    call add_9byte
    mov [overflow_flag], rax
    
    mov rsi, test2_expected
    call print_expected
    mov rsi, test2_result
    call print_actual
    mov rdi, [overflow_flag]
    call print_overflow
    mov rsi, test2_expected
    mov rdi, test2_result
    call compare_and_print
    
    mov rdi, 3
    call print_test_header
    call print_sub
    
    mov rsi, test3_a
    call print_operand_a
    mov rsi, test3_b
    call print_operand_b
    
    mov rdi, test3_a
    mov rsi, test3_b
    mov rdx, test3_result
    call sub_9byte
    mov [overflow_flag], rax
    
    mov rsi, test3_expected
    call print_expected
    mov rsi, test3_result
    call print_actual
    mov rdi, [overflow_flag]
    call print_overflow
    mov rsi, test3_expected
    mov rdi, test3_result
    call compare_and_print
    
    mov rdi, 4
    call print_test_header
    call print_sub
    
    mov rsi, test4_a
    call print_operand_a
    mov rsi, test4_b
    call print_operand_b
    
    mov rdi, test4_a
    mov rsi, test4_b
    mov rdx, test4_result
    call sub_9byte
    mov [overflow_flag], rax
    
    mov rsi, test4_expected
    call print_expected
    mov rsi, test4_result
    call print_actual
    mov rdi, [overflow_flag]
    call print_overflow
    mov rsi, test4_expected
    mov rdi, test4_result
    call compare_and_print
    
    mov rdi, 5
    call print_test_header
    call print_add
    
    mov rsi, test5_a
    call print_operand_a
    mov rsi, test5_b
    call print_operand_b
    
    mov rdi, test5_a
    mov rsi, test5_b
    mov rdx, test5_result
    call add_9byte
    mov [overflow_flag], rax
    
    mov rsi, test5_expected
    call print_expected
    mov rsi, test5_result
    call print_actual
    mov rdi, [overflow_flag]
    call print_overflow
    mov rsi, test5_expected
    mov rdi, test5_result
    call compare_and_print
    
    mov rax, 60
    xor rdi, rdi
    syscall

print_test_header:
    push rdi
    mov rax, 1
    mov rdi, 1
    mov rsi, msg_test
    mov rdx, 5
    syscall
    pop rdi
    
    add rdi, '0'
    push rdi
    mov rax, 1
    mov rdi, 1
    mov rsi, rsp
    mov rdx, 1
    syscall
    pop rdi
    
    mov rax, 1
    mov rdi, 1
    mov rsi, newline
    mov rdx, 1
    syscall
    ret

print_add:
    mov rax, 1
    mov rdi, 1
    mov rsi, msg_add
    mov rdx, 4
    syscall
    ret

print_sub:
    mov rax, 1
    mov rdi, 1
    mov rsi, msg_sub
    mov rdx, 4
    syscall
    ret

print_operand_a:
    push rsi
    mov rax, 1
    mov rdi, 1
    mov rsi, msg_operand_a
    mov rdx, 13
    syscall
    pop rsi
    call print_9byte_value
    ret

print_operand_b:
    push rsi
    mov rax, 1
    mov rdi, 1
    mov rsi, msg_operand_b
    mov rdx, 13
    syscall
    pop rsi
    call print_9byte_value
    ret

print_expected:
    push rsi
    mov rax, 1
    mov rdi, 1
    mov rsi, msg_expected
    mov rdx, 13
    syscall
    pop rsi
    call print_9byte_value
    ret

print_actual:
    push rsi
    mov rax, 1
    mov rdi, 1
    mov rsi, msg_actual
    mov rdx, 13
    syscall
    pop rsi
    call print_9byte_value
    ret

print_overflow:
    push rdi
    mov rax, 1
    mov rdi, 1
    mov rsi, msg_overflow
    mov rdx, 13
    syscall
    pop rdi
    
    test rdi, rdi
    jz .no_overflow
    mov rsi, msg_yes
    mov rdx, 4
    jmp .print
.no_overflow:
    mov rsi, msg_no
    mov rdx, 3
.print:
    mov rax, 1
    mov rdi, 1
    syscall
    ret

print_9byte_value:
    push rbx
    push r12
    push r13
    
    mov r12, rsi
    mov r13, 8
    
    mov rax, 1
    mov rdi, 1
    push '0'
    mov rsi, rsp
    mov rdx, 1
    syscall
    
    mov byte [rsp], 'x'
    mov rax, 1
    mov rdi, 1
    mov rsi, rsp
    mov rdx, 1
    syscall
    add rsp, 8
    
.print_loop:
    movzx rbx, byte [r12 + r13]
    
    mov rax, rbx
    shr rax, 4
    call print_hex_digit
    
    mov rax, rbx
    and rax, 0x0F
    call print_hex_digit
    
    dec r13
    cmp r13, -1
    jne .print_loop
    
    mov rax, 1
    mov rdi, 1
    mov rsi, newline
    mov rdx, 1
    syscall
    
    pop r13
    pop r12
    pop rbx
    ret

print_hex_digit:
    push rax
    push rdi
    push rsi
    push rdx
    
    cmp rax, 9
    jle .digit
    add rax, 'A' - 10
    jmp .print
.digit:
    add rax, '0'
.print:
    sub rsp, 8
    mov [rsp], al
    mov rax, 1
    mov rdi, 1
    mov rsi, rsp
    mov rdx, 1
    syscall
    add rsp, 8
    
    pop rdx
    pop rsi
    pop rdi
    pop rax
    ret

compare_and_print:
    push rbx
    push r12
    push r13
    
    mov r12, rdi
    mov r13, rsi
    xor rbx, rbx
    
.compare_loop:
    mov al, [r12 + rbx]
    cmp al, [r13 + rbx]
    jne .fail
    inc rbx
    cmp rbx, 9
    jl .compare_loop
    
    mov rax, 1
    mov rdi, 1
    mov rsi, msg_pass
    mov rdx, 18
    syscall
    jmp .done
    
.fail:
    mov rax, 1
    mov rdi, 1
    mov rsi, msg_fail
    mov rdx, 18
    syscall
    
.done:
    pop r13
    pop r12
    pop rbx
    ret