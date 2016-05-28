
	.text
wl_main:
	pushq %rbp
	movq %rsp, %rbp
	subq $16, %rsp
	leaq str0(%rip), %rax
	movq %rax, -8(%rbp)
	leaq str1(%rip), %rax
	movq %rax, -16(%rbp)
	subq $16, %rsp
	movq -16(%rbp), %rax
	movq %rax, 0(%rsp)
	movq 0(%rsp), %rax
	addq $16, %rsp
	movq -8(%rbp), %rbx
	cmpq %rax, %rbx
	jnz label456
	jmp label454
label456:
	movq $1, %rax
	jmp label455
label454:
	movq $0, %rax
label455:
	movq %rax, %rdi
	call _assertion
	subq $16, %rsp
	movq -16(%rbp), %rax
	movq %rax, 0(%rsp)
	movq 0(%rsp), %rax
	addq $16, %rsp
	movq -8(%rbp), %rbx
	cmpq %rax, %rbx
	jnz label457
	movq $1, %rax
	jmp label458
label457:
	movq $0, %rax
label458:
	movq %rax, %rdi
	call _assertion
label453:
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
