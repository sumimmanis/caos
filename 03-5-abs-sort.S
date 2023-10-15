.global cmp
cmp:
        mov     4(%esp), %ecx
        mov     8(%esp), %edx

        movswl  (%ecx), %ecx
        movswl  (%edx), %edx

        cmp     $0, %ecx
        jl      1f
        neg     %ecx

1:
        cmp     $0, %edx
        jl      1f
        neg     %edx

1:
        cmp     %ecx, %edx
        jl      L
        je      E

        mov     $1, %eax

continue:
        ret

L:
        mov     $-1, %eax
        jmp     continue

E:
        mov     $0, %eax
        jmp     continue


.text
.global sort_by_abs
sort_by_abs:
        push    %ebp
        mov     %esp, %ebp

        mov     8(%esp), %ecx    // int16_t[] ptr
        mov     12(%esp), %edx   // len

        push    $cmp
        push    $2
        push    %edx
        push    %ecx
        call    qsort
        add     $16, %esp

        mov     $0, %ecx
        mov     $0, %edx
        mov     $0, %eax


        leave                                                                                                                
        ret  
