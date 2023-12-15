.global okay
okay:
    pushl   %ebp
    movl    %esp, %ebp

    movsd   8(%ebp), %xmm0  // xmm0 = a
    movsd   16(%ebp), %xmm1 // xmm1 = b
    mulsd   %xmm0, %xmm0    // xmm0 = a^2
    mulsd   %xmm0, %xmm0    // xmm0 = a^2
    mulsd   %xmm1, %xmm1    // xmm1 = b^2
    mulsd   %xmm1, %xmm1    // xmm1 = b^2
    addsd   %xmm0, %xmm1    // xmm1 = b += a

    sqrtsd  %xmm1, %xmm0    // xmm0 = sqrt(xmm1)

    movl 24(%ebp), %eax
    movsd %xmm0, (%eax)

    popl %ebp
    ret
