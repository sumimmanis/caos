// for (i = a_; i >= 0; --i) { cout << i << '\n'; }
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
