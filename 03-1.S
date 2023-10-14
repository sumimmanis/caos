// check if palindrome

.data
table:
        .zero  512

yes:
        .asciz "YES"

no:
        .asciz "NO"

.text
.global main
main:
        push    %ebp
        mov     %esp, %ebp


L1:
        call    getchar
        cmp     $10, %eax        // ends with '\n'
        je      L2
        incl    table(, %eax, 4)
        jmp     L1

L2:
        call    getchar
        cmp     $10, %eax        // ends with '\n'
        je      P3
        decl    table(, %eax, 4)
        jmp     L2

P3:
        movl    $65, %eax

L3:
        cmp     $91, %eax
        je      SC
        movl    table(, %eax, 4), %ecx
        addl    %ecx, table+128(, %eax, 4)
        movl    $0, table(, %eax, 4)
        incl    %eax
        jmp     L3

SC:
        movl    $0, table+128     // ignore spaces

P4:
        movl    $0, %eax

L4:
        cmpl    $128, %eax
        je      YES
        cmpl    $0, table(, %eax, 4)
        jne     NO
        incl    %eax
        jmp     L4

YES:
        pushl   $yes
        call    puts
        addl    $4, %esp
        mov     $0, %eax
        mov     $0, %ecx
        leave
        ret

NO:
        pushl   $no
        call    puts
        addl    $4, %esp
        mov     $0, %eax
        mov     $0, %ecx
        leave
        ret    
