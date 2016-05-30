
	.text
wl_f:
	pushq %rbp
	movq %rsp, %rbp
	movq 24(%rbp), %rax
	movq $0, %rbx
	cmpq %rax, %rbx
	jnz label624
label622:
	movq 24(%rbp), %rbx
	movq $10, %rcx
	addq %rcx, %rbx
	movq %rbx, 24(%rbp)
	jmp label623
label624:
	movq $1, %rbx
	cmpq %rax, %rbx
	jnz label626
label623:
	movq 24(%rbp), %rbx
	movq %rbx, 16(%rbp)
	jmp label620
	jmp label625
label626:
label625:
	movq $0, %rbx
	movq %rbx, 16(%rbp)
	jmp label620
label628:
label621:
label620:
	movq %rbp, %rsp
	popq %rbp
	ret
wl_main:
	pushq %rbp
	movq %rsp, %rbp
	movq $10, %rax
	subq $16, %rsp
	movq %rax, 0(%rsp)
	subq $16, %rsp
	movq $0, %rbx
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
	movq $1, %rax
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
	jnz label633
	movq $1, %rax
	jmp label634
label633:
	movq $0, %rax
label634:
	movq %rax, %rdi
	call _assertion
	movq $0, %rax
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
	jnz label635
	movq $1, %rax
	jmp label636
label635:
	movq $0, %rax
label636:
	movq %rax, %rdi
	call _assertion
label630:
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
