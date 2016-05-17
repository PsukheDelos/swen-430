
	.text
wl_f:
	pushq %rbp
	movq %rsp, %rbp
	movq 24(%rbp), %rax
	movq $1, %rbx
	cmpq %rax, %rbx
	jnz label625
	movq $123, %rbx
	movq %rbx, 16(%rbp)
	jmp label623
label625:
	movq $2, %rbx
	cmpq %rax, %rbx
	jnz label626
	movq $234, %rbx
	movq %rbx, 16(%rbp)
	jmp label623
label626:
	movq $456, %rbx
	movq %rbx, 16(%rbp)
	jmp label623
label627:
label624:
label623:
	movq %rbp, %rsp
	popq %rbp
	ret
wl_main:
	pushq %rbp
	movq %rsp, %rbp
	movq $123, %rax
	subq $16, %rsp
	movq %rax, 0(%rsp)
	subq $16, %rsp
	movq $1, %rbx
	movq %rbx, 8(%rsp)
	call wl_f
	addq $16, %rsp
	movq 0(%rsp), %rax
	addq $16, %rsp
	movq -32(%rsp), %rbx
	cmpq %rax, %rbx
	jnz label629
	movq $1, %rax
	jmp label630
label629:
	movq $0, %rax
label630:
	movq %rax, %rdi
	call _assertion
	movq $234, %rax
	subq $16, %rsp
	movq %rax, 0(%rsp)
	subq $16, %rsp
	movq $2, %rbx
	movq %rbx, 8(%rsp)
	call wl_f
	addq $16, %rsp
	movq 0(%rsp), %rax
	addq $16, %rsp
	movq -32(%rsp), %rbx
	cmpq %rax, %rbx
	jnz label631
	movq $1, %rax
	jmp label632
label631:
	movq $0, %rax
label632:
	movq %rax, %rdi
	call _assertion
	movq $456, %rax
	subq $16, %rsp
	movq %rax, 0(%rsp)
	subq $16, %rsp
	movq $3, %rbx
	movq %rbx, 8(%rsp)
	call wl_f
	addq $16, %rsp
	movq 0(%rsp), %rax
	addq $16, %rsp
	movq -32(%rsp), %rbx
	cmpq %rax, %rbx
	jnz label633
	movq $1, %rax
	jmp label634
label633:
	movq $0, %rax
label634:
	movq %rax, %rdi
	call _assertion
label628:
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
