.global process
process:
        // missing prologue
        mov     $4, %eax
        mov     %ebp, %esp
        pop     %ebp
        ret

.data
format:
        .string "%d\n"

.text
.global main
main:
        push    %ebp
        mov     %esp, %ebp
        
        push    $r              // return adress
        push    %ebp            
        mov     %esp, %ebp      // prologue
        
        mov     $process, %eax
        jmp     *%eax
r:
        push    %eax
        push    $format
        call    printf
        addl    $8, %esp

        mov     $0, %eax

        leave
        ret