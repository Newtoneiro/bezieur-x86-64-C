    ; Legend:
    ; xmm0 - register for returning power function value
    ; xmm3 - register for holding ingridients of result
    ; xmm4 - register for holding and adding ingridients from xmm3
    ; xmm5 - register holding (1-t)
    ; xmm6 - register holding jump parameter
    ; xmm8 - current t
    ; r11  - constant 1
    ; r12  - register designated for holding current power of components in loop


    bits    64
    section    .text

    global put_pixel
    global f
f:
    push    rbp          ;epilogue
    mov     rbp, rsp

    xorps xmm8, xmm8     ;set t = 0
    movss   xmm6, xmm0   ;store jump parameter
    mov     r11, 1
    ;cvtsi2ss xmm5, r11
    ;subss   xmm5, xmm0   ;store (1-t)
    mov r14, 0
    jmp bezieur_loop

store_x_coordinates:
    push    rbp
    mov     rbp, rsp

    mov edi, [rax]
    mov esi, [rax + 8]
    mov edx, [rax + 16]
    mov ecx, [rax + 24]
    mov r8d, [rax + 32]

    mov     rsp, rbp
    pop     rbp
    ret
store_y_coordinates:
    push    rbp
    mov     rbp, rsp

    mov edi, [rax + 4]
    mov esi, [rax + 12]
    mov edx, [rax + 20]
    mov ecx, [rax + 28]
    mov r8d, [rax + 36]

    mov     rsp, rbp
    pop     rbp
    ret

bezieur_loop:
    cvtsi2ss xmm15, r11
    ucomiss xmm8, xmm15
    jg end
    inc r14;
    addss xmm8, xmm6
    jmp bezieur_loop

calc_bezieur: ; arguments in rdi, rsi, rdx, rcx, r8
    mov     r12, 4
    xorps   xmm3, xmm3

    movss   xmm1, xmm5
    mov     r15, r12
    call    power
    movss   xmm4, xmm0    ;xmm4 contains (1-t)^4
    cvtsi2ss xmm2, rdi   ;convert a into float
    mulss   xmm4, xmm2    ;multiply xmm4 by a
    movss   xmm3, xmm4    ;add to result
    dec     r12           ;reduce power

    movss   xmm1, xmm5
    mov     r15, r12
    call    power
    movss   xmm4, xmm0   ;xmm4 contains (1-t)^3
    mov     r13, 4
    cvtsi2ss xmm2, r13  ;convert 4 into float
    mulss   xmm4, xmm2   ;xmm4 now has 4 * (1-t)^3
    mulss   xmm4, xmm6   ;xmm4 now has 4 * (1-t)^3 * t
    cvtsi2ss xmm2, rsi  ;convert b into float
    mulss   xmm4, xmm2   ;multiply xmm4 by b
    addss   xmm3, xmm4   ;add to result
    dec     r12

    movss   xmm1, xmm5
    mov     r15, r12
    call    power
    movss   xmm4, xmm0   ;xmm4 contains (1-t)^n
    mov     r13, 6
    cvtsi2ss xmm2, r13  ;convert 6 into float
    mulss   xmm4, xmm2   ;xmm4 now has 6 * (1-t)^2
    movss   xmm1, xmm6   ;load base ( t )
    mov     r15, r12     ;load exponent ( 2 )
    call    power
    movss   xmm7, xmm0   ;store t ^ 2 in xmm7
    mulss   xmm4, xmm7   ;xmm4 now has 6 * (1-t)^2 * t^2
    cvtsi2ss xmm2, rdx  ;convert c into float
    mulss   xmm4, xmm2   ;multiply xmm4 by c
    addss   xmm3, xmm4   ;add to result
    inc     r12

    movss   xmm4, xmm5   ;xmm4 contains (1-t)
    mov     r13, 4
    cvtsi2ss xmm2, r13  ;convert 4 into float
    mulss   xmm4, xmm2   ;xmm4 now has 4 * (1-t)
    movss   xmm1, xmm6   ;load base ( t )
    mov     r15, r12     ;load exponent ( 3 )
    call    power
    movss   xmm7, xmm0   ;store t ^ 3 in xmm7
    mulss   xmm4, xmm7   ;xmm4 now has 4 * (1-t) * t^3
    cvtsi2ss xmm2, rcx  ;convert d into float
    mulss   xmm4, xmm2   ;multiply xmm4 by d
    addss   xmm3, xmm4   ;add to result
    inc     r12

    movss   xmm1, xmm6   ;load base ( t )
    mov     r15, r12     ;load exponent ( 4 )
    call    power
    movss   xmm4, xmm0   ;xmm4 now has t^4
    cvtsi2ss xmm2, r8   ;convert e into float
    mulss   xmm4, xmm2   ;multiply xmm4 by e
    addss   xmm3, xmm4   ;add to result
    movss   xmm0, xmm3   ;store the final result in xmm0
    jmp     end

power:      ; xmm1 - base, r15- exponent, xmm0 - result
    push    rbp         ;epilogue
    mov     rbp, rsp
    xorps   xmm0, xmm0  ;clear xmm0 register
    cmp     r15, 0      ;if exponent is equal to 0, go to power_end_zero
    je      power_end_zero
    movss   xmm0, xmm1  ;add for the 1st time
power_loop:
    cmp     r15, 1
    je      power_end
    mulss   xmm0, xmm1  ;
    dec     r15
    jmp     power_loop
power_end_zero:
    cvtsi2ss xmm0, r11 ; store 1
power_end:
    mov     rsp, rbp
    pop     rbp
    ret

end:
    mov     rax, r14
    mov     rsp, rbp
    pop     rbp
    ret
