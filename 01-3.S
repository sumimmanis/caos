// write x, ... 1, 0
// using simpleio.S

.global main
main:
	call readi32
	movl %eax, %ebx

	cmpl $0, %eax
	jge loop
	call finish


loop:
	call writei32
	subl $1, %eax
	jge loop
	call finish
