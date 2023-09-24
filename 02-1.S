// read x, y, ... z; write z, ... x, y
// using simpleio.S

.global main
main:
        xorl %ebx, %ebx
read:
        call readi32
        jc print

        pushl %eax
        incl %ebx
        jmp read


print:
        cmp $0, %ebx
        jz 1f
        popl %eax
        call writei32
        dec %ebx
        jnz print


1:
        call finish


