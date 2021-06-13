    ;============================================================================
    ;============================ Bartosz Latosek ===============================
    ;============== Interactive drawing of 5-point Bezieur's curve ==============
    ;============================================================================

    ; ------------- Register Legend ---------------
    ; xmm0 - register for returning power function value
    ; xmm3 - register for holding ingridients of result in calc_bezieur
    ; xmm4 - register for holding and adding ingridients from xmm3 in calc_bezieur
    ; xmm5 - register holding (1-t) in calc_bezieur
    ; xmm6 - register holding jump parameter
    ; xmm7 - calculations in calc_bezieur
    ; xmm8 - current t
    ; xmm13 - temporary register for storing current x parameter in bezieur_loop
    ; xmm15- constant 1.0
    ; r10  - colour
    ; r11  - list of points
    ; r12  - register designated for holding current power exponent in loop
    ; r13  - register for holding numbers for calculations in calc_bezieur
    ; r14  - register for holding image pointer
    ; rbx  - row size


    bits    64
    section    .text

    global put_pixel
    global f
;------------- Preparations --------------
f:
    push    rbp              ;prologue
    mov     rbp, rsp

    mov     r11, rdi        ; r11 = *points
    mov     r14, rsi        ; r14 = *image_buff

    mov     rbx, [rsi+18]   ; rbx = width of image
    imul    rbx, 3          ; rbx = rbx * 3
    add     rbx, 3
    and     ebx, 0xFFFFFFFC ; padding, rbx now has the row size

    xorps  xmm8, xmm8       ;set t = 0
    movss   xmm6, xmm0      ;store jump parameter
    mov     r9, 1
    cvtsi2ss xmm15, r9      ;constant floating point 1
    mov     r10, 0x329632   ;r10 = green

    jmp bezieur_loop

;--------- Helper functions -----------
store_x_coordinates:        ;The following two functions are making the bezieur loop function easier
    mov edi, [r11]          ;rdi = xa
    mov esi, [r11 + 8]      ;rsi = xb
    mov edx, [r11 + 16]     ;rdx = xc
    mov ecx, [r11 + 24]     ;rdx = xd
    mov r8d, [r11 + 32]     ;r8 = xe

    ret
store_y_coordinates:
    mov edi, [r11 + 4]      ;rdi = ya
    mov esi, [r11 + 12]     ;rsi = yb
    mov edx, [r11 + 20]     ;rdx = yc
    mov ecx, [r11 + 28]     ;rcx = yd
    mov r8d, [r11 + 36]     ;r8 = ye

    ret

;--------- main -----------
bezieur_loop:
    comisd xmm8, xmm15      ; compare current t (xmm8) to 1
    ja end                  ; if t > 1, go to end

    call store_x_coordinates;store x coordinates in proper registers
    call calc_bezieur       ;calculate current x
    movss xmm13, xmm0       ;temporarly store x in xmm13
    call store_y_coordinates;store y coordinates in proper registers
    call calc_bezieur       ;calculate current y
    xor rcx, rcx            ;rcx = 0
    mov ecx, [r14 + 22]     ;(allegro lib has (0,0) in the upper left corner, so that we have to reverse the height
    cvtss2si rdi, xmm0      ;convert y into int
    sub rcx, rdi            ;actual y = height - calculated y
    xor rdx, rdx            ;rdx = 0
    cvtss2si rdx, xmm13     ;convert x into int
    call put_pixel          ;put_pixel (x in rdx, y in rcx )

    addss xmm8, xmm6        ;t += jump
    jmp bezieur_loop        ;repeat the loop

;---------- main calculations ------------------
calc_bezieur: ; [arguments in rdi, rsi, rdx, rcx, r8, xmm8 - t]
    movss   xmm5, xmm15     ;xmm5 = 1
    subss   xmm5, xmm8      ;xmm5 = 1-t
    mov     r12, 4          ;r12 = 4, power
    xorps   xmm3, xmm3      ;xmm3 = 0

    movss   xmm1, xmm5      ;xmm1 = 1-t
    mov     r15, r12        ;r15 = r12 (current power)
    call    power           ;calculate power, get the result in xmm0
    movss   xmm4, xmm0      ;xmm4 contains (1-t)^4
    cvtsi2ss xmm2, rdi      ;convert a into float
    mulss   xmm4, xmm2      ;multiply xmm4 by a
    movss   xmm3, xmm4      ;add to result
    dec     r12             ;reduce power

    movss   xmm1, xmm5      ;xmm1 = 1-t
    mov     r15, r12        ;r15 = r12 (current power)
    call    power           ;calculate power, get the result in xmm0
    movss   xmm4, xmm0      ;xmm4 contains (1-t)^3
    mov     r13, 4          ;store 4
    cvtsi2ss xmm2, r13      ;convert 4 into float
    mulss   xmm4, xmm2      ;xmm4 now has 4 * (1-t)^3
    mulss   xmm4, xmm8      ;xmm4 now has 4 * (1-t)^3 * t
    cvtsi2ss xmm2, rsi      ;convert b into float
    mulss   xmm4, xmm2      ;multiply xmm4 by b
    addss   xmm3, xmm4      ;add to result
    dec     r12             ;reduce power

    movss   xmm1, xmm5      ;xmm1 = 1-t
    mov     r15, r12        ;r15 = r12 (current power)
    call    power           ;calculate power, get result in xmm0
    movss   xmm4, xmm0      ;xmm4 contains (1-t)^n
    mov     r13, 6          ;store 6
    cvtsi2ss xmm2, r13      ;convert 6 into float
    mulss   xmm4, xmm2      ;xmm4 now has 6 * (1-t)^2
    movss   xmm1, xmm8      ;load base ( t )
    mov     r15, r12        ;load exponent ( 2 )
    call    power           ;calculate power
    movss   xmm7, xmm0      ;store t ^ 2 in xmm7
    mulss   xmm4, xmm7      ;xmm4 now has 6 * (1-t)^2 * t^2
    cvtsi2ss xmm2, rdx      ;convert c into float
    mulss   xmm4, xmm2      ;multiply xmm4 by c
    addss   xmm3, xmm4      ;add to result
    inc     r12             ;now increase power

    movss   xmm4, xmm5      ;xmm4 contains (1-t)
    mov     r13, 4          ;store 4
    cvtsi2ss xmm2, r13      ;convert 4 into float
    mulss   xmm4, xmm2      ;xmm4 now has 4 * (1-t)
    movss   xmm1, xmm8      ;load base ( t )
    mov     r15, r12        ;load exponent ( 3 )
    call    power           ;calculate power, store the result in xmm0
    movss   xmm7, xmm0      ;store t ^ 3 in xmm7
    mulss   xmm4, xmm7      ;xmm4 now has 4 * (1-t) * t^3
    cvtsi2ss xmm2, rcx      ;convert d into float
    mulss   xmm4, xmm2      ;multiply xmm4 by d
    addss   xmm3, xmm4      ;add to result
    inc     r12

    movss   xmm1, xmm8      ;load base ( t )
    mov     r15, r12        ;load exponent ( 4 )
    call    power           ;calculate power, store the result in xmm0
    movss   xmm4, xmm0      ;xmm4 now has t^4
    cvtsi2ss xmm2, r8       ;convert e into float
    mulss   xmm4, xmm2      ;multiply xmm4 by e
    addss   xmm3, xmm4      ;add to result
    movss   xmm0, xmm3      ;store the final result in xmm0

    ret

;---------- power function -------------
power:      ; [xmm1 - base, r15- exponent, xmm0 - result]
    push    rbp             ;prologue
    mov     rbp, rsp

    xorps   xmm0, xmm0      ;clear xmm0 register
    cmp     r15, 0          ;if exponent is equal to 0, go to power_end_zero
    je      power_end_zero
    movss   xmm0, xmm1      ;add for the 1st time (if exponent = 1, we'll go straight to returing the value)
power_loop:
    cmp     r15, 1          ;compare the exponent to 1
    je      power_end       ;if its equal, go to end
    mulss   xmm0, xmm1      ;else multiply the result by base
    dec     r15             ;power -= 1
    jmp     power_loop      ;repeat
power_end_zero:
    movss xmm0, xmm15       ;if the exponent is equal to 0, store 1
power_end:
    mov     rsp, rbp        ;epilogue
    pop     rbp
    ret

;----------- Drawing pixels ---------------
put_pixel:  ; [rcx - y, rdx - x, r10 - colour]
    imul    rcx, rbx        ;rcx = y * row_size
    imul    rdx, 3          ;rdx = x*3
    add     rcx, rdx        ;rcx = pixel address
    add     rcx, r14        ;rcx = pixel address + image buffer address
    add     rcx, 54         ;rcx = pixel absolute address

    mov     rdx, r10        ;rdx = 0x00RRGGBB
    mov     [rcx], dx       ;store GG, BB
    shr     rdx, 16         ;edx now has RR
    mov     [rcx+2], dl     ;store RR

    ret

;----------- End --------------------------
end:
    mov     rsp, rbp        ;epilogue
    pop     rbp
    ret
