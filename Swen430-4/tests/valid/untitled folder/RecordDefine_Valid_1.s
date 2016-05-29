
	.text
wl_f:
	pushq %rbp
	movq %rsp, %rbp
	movq 32(%rbp), %rax
	movq %rax, 16(%rbp)
	movq 40(%rbp), %rax
	movq %rax, 24(%rbp)
	jmp label545
label545:
	movq %rbp, %rsp
	popq %rbp
	ret
wl_main:
	pushq %rbp
	movq %rsp, %rbp
	subq $16, %rsp
	subq $32, %rsp
	movq $1, %rax
	movq %rax, 16(%rsp)
	movq $1, %rax
	movq %rax, 24(%rsp)
	call wl_f
	addq $32, %rsp
	movq -32(%rsp), %rax
	movq %rax, -16(%rbp)
	movq -24(%rsp), %rax
	movq %rax, -8(%rbp)
	movq $1, %rax
	movq $1, %rbx
	cmpq %rax, %rbx
	jnz label547
	movq $1, %rax
	jmp label548
label547:
	movq $0, %rax
label548:
	movq %rax, %rdi
	call _assertion
label546:
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
