// count ones in binary reprsentation of a_

.global main
main:
        call readi32
        movl %eax, %ebx
        movl $31, %ecx

        cmp $0, %ebx
        jl if_signed


for:
        shl $1, %ebx
        subl $2147483647, %ebx
        jo if_one


continue:
        subl $1, %ecx
        jg for
        jmp print


if_one:
        addl $1, %edx
        jmp continue


if_signed:
        addl $1, %edx
        jmp for


print:
        movl %edx, %eax
        call writei32
        call finish
