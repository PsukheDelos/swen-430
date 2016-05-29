
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
	jnz label571
	jmp label569
label571:
	movq $1, %rax
	jmp label570
label569:
	movq $0, %rax
label570:
	movq %rax, %rdi
	call _assertion
	movq -8(%rbp), %rax
	movq %rax, -16(%rbp)
	subq $16, %rsp
	movq -16(%rbp), %rax
	movq %rax, 0(%rsp)
	movq 0(%rsp), %rax
	addq $16, %rsp
	movq -8(%rbp), %rbx
	cmpq %rax, %rbx
	jnz label572
	movq $1, %rax
	jmp label573
label572:
	movq $0, %rax
label573:
	movq %rax, %rdi
	call _assertion
label568:
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
