
	.text
wl_sum1:
	pushq %rbp
	movq %rsp, %rbp
	subq $16, %rsp
	movq 24(%rbp), %rax
	movq %rax, 0(%rsp)
	movq 32(%rbp), %rax
	movq %rax, 8(%rsp)
	movq 0(%rsp), %rax
	addq $16, %rsp
	subq $16, %rsp
	movq 24(%rbp), %rbx
	movq %rbx, 0(%rsp)
	movq 32(%rbp), %rbx
	movq %rbx, 8(%rsp)
	movq 8(%rsp), %rbx
	addq $16, %rsp
	addq %rbx, %rax
	movq %rax, 16(%rbp)
	jmp label500
label500:
	movq %rbp, %rsp
	popq %rbp
	ret
wl_sum2:
	pushq %rbp
	movq %rsp, %rbp
	subq $16, %rsp
	movq 24(%rbp), %rax
	movq %rax, 0(%rsp)
	movq 32(%rbp), %rax
	movq %rax, 8(%rsp)
	movq 0(%rsp), %rax
	addq $16, %rsp
	cmpq $0, %rax
	jz label502
	subq $16, %rsp
	movq 24(%rbp), %rax
	movq %rax, 0(%rsp)
	movq 32(%rbp), %rax
	movq %rax, 8(%rsp)
	movq 8(%rsp), %rax
	addq $16, %rsp
	cmpq $0, %rax
	jz label502
	movq $1, %rax
	jmp label503
label502:
	movq $0, %rax
label503:
	movq %rax, 16(%rbp)
	jmp label501
label501:
	movq %rbp, %rsp
	popq %rbp
	ret
wl_main:
	pushq %rbp
	movq %rsp, %rbp
	subq $32, %rsp
	movq $1, %rax
	movq %rax, -16(%rbp)
	movq $2, %rax
	movq %rax, -8(%rbp)
	movq $1, %rax
	movq $1, %rbx
	cmpq %rax, %rbx
	jnz label505
	movq $1, %rax
	jmp label506
label505:
	movq $0, %rax
label506:
	movq %rax, %rdi
	call _assertion
	movq $1, %rax
	movq %rax, -32(%rbp)
	movq $0, %rax
	movq %rax, -24(%rbp)
	movq $1, %rax
	movq $1, %rbx
	cmpq %rax, %rbx
	jnz label507
	movq $1, %rax
	jmp label508
label507:
	movq $0, %rax
label508:
	movq %rax, %rdi
	call _assertion
label504:
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
