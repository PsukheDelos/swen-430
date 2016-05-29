
	.text
wl_main:
	pushq %rbp
	movq %rsp, %rbp
	subq $16, %rsp
	leaq str0(%rip), %rax
	movq %rax, -8(%rbp)
	leaq str0(%rip), %rax
	movq %rax, -16(%rbp)
	movq $1, %rax
	movq $1, %rbx
	cmpq %rax, %rbx
	jnz label599
	movq $1, %rax
	jmp label600
label599:
	movq $0, %rax
label600:
	movq %rax, %rdi
	call _assertion
label598:
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
