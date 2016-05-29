
	.text
wl_main:
	pushq %rbp
	movq %rsp, %rbp
	subq $16, %rsp
	leaq str0(%rip), %rax
	movq %rax, -8(%rbp)
	leaq str1(%rip), %rax
	movq %rax, -16(%rbp)
	movq $1, %rax
	movq $1, %rbx
	cmpq %rax, %rbx
	jnz label584
	movq $1, %rax
	jmp label585
label584:
	movq $0, %rax
label585:
	movq %rax, %rdi
	call _assertion
	movq -8(%rbp), %rax
	movq %rax, -16(%rbp)
	movq $1, %rax
	movq $1, %rbx
	cmpq %rax, %rbx
	jnz label586
	movq $1, %rax
	jmp label587
label586:
	movq $0, %rax
label587:
	movq %rax, %rdi
	call _assertion
label583:
	movq %rbp, %rsp
	popq %rbp
	ret
	.globl _main
_main:
	pushq %rbp
	call wl_main
	popq %rbp
	movq $0, %rax
	ret

	.data
str0:
	.asciz "Hello World"
str1:
	.asciz "blah"
