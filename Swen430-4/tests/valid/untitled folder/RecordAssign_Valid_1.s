
	.text
wl_f:
	pushq %rbp
	movq %rsp, %rbp
	movq $2, %rax
	movq %rax, 16(%rbp)
	movq $3, %rax
	movq %rax, 24(%rbp)
	jmp label509
label509:
	movq %rbp, %rsp
	popq %rbp
	ret
wl_main:
	pushq %rbp
	movq %rsp, %rbp
	subq $16, %rsp
	subq $16, %rsp
	call wl_f
	addq $16, %rsp
	movq -16(%rsp), %rax
	movq %rax, -16(%rbp)
	movq -8(%rsp), %rax
	movq %rax, -8(%rbp)
	movq $1, %rax
	movq $1, %rbx
	cmpq %rax, %rbx
	jnz label511
	movq $1, %rax
	jmp label512
label511:
	movq $0, %rax
label512:
	movq %rax, %rdi
	call _assertion
	subq $16, %rsp
	movq -16(%rbp), %rax
	movq %rax, 0(%rsp)
	movq -8(%rbp), %rax
	movq %rax, 8(%rsp)
	movq 8(%rsp), %rax
	addq $16, %rsp
	movq $2, %rbx
	subq %rbx, %rax
	movq %rax, -16(%rbp)
	movq $1, %rax
	movq $1, %rbx
	cmpq %rax, %rbx
	jnz label513
	movq $1, %rax
	jmp label514
label513:
	movq $0, %rax
label514:
	movq %rax, %rdi
	call _assertion
label510:
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
