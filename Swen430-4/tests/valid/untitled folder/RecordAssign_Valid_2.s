
	.text
wl_f:
	pushq %rbp
	movq %rsp, %rbp
	subq $16, %rsp
	movq 32(%rbp), %rax
	movq %rax, 0(%rsp)
	movq 40(%rbp), %rax
	movq %rax, 8(%rsp)
	movq 0(%rsp), %rax
	addq $16, %rsp
	movq $1, %rbx
	subq %rbx, %rax
	movq %rax, 16(%rbp)
	subq $16, %rsp
	movq 32(%rbp), %rax
	movq %rax, 0(%rsp)
	movq 40(%rbp), %rax
	movq %rax, 8(%rsp)
	movq 8(%rsp), %rax
	movq %rax, 24(%rbp)
	addq $16, %rsp
	jmp label515
label515:
	movq %rbp, %rsp
	popq %rbp
	ret
wl_main:
	pushq %rbp
	movq %rsp, %rbp
	subq $32, %rsp
	movq $2, %rax
	movq %rax, -16(%rbp)
	movq $3, %rax
	movq %rax, -8(%rbp)
	movq $1, %rax
	movq %rax, -16(%rbp)
	movq $2, %rax
	movq %rax, -24(%rbp)
label516:
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
