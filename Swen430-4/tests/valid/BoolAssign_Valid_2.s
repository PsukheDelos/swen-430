
	.text
wl_main:
	pushq %rbp
	movq %rsp, %rbp
	subq $16, %rsp
	movq $1, %rax
	movq %rax, -8(%rbp)
	movq $0, %rax
	movq %rax, -16(%rbp)
	movq -8(%rbp), %rax
	cmpq $0, %rax
	jz label21
	movq -16(%rbp), %rax
	cmpq $0, %rax
	jz label21
	movq $1, %rax
	jmp label22
label21:
	movq $0, %rax
label22:
	movq %rax, -8(%rbp)
	movq -8(%rbp), %rax
	notq %rax
	andq $1, %rax
	movq %rax, %rdi
	call _assertion
label20:
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
