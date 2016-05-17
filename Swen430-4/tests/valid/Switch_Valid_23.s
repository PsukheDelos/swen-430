
	.text
wl_f:
	pushq %rbp
	movq %rsp, %rbp
	subq $16, %rsp
	movq 24(%rbp), %rax
	movq %rax, 0(%rsp)
	movq $0, %rax
	movq %rax, 8(%rsp)
	movq 0(%rsp), %rax
	movq 8(%rsp), %rbx
	cmpq %rbx, %rax
	jnz label574
	movq $0, %rax
	movq %rax, 16(%rbp)
	jmp label572
label574:
	movq $1, %rax
	movq %rax, 8(%rsp)
	movq 0(%rsp), %rax
	movq 8(%rsp), %rbx
	cmpq %rbx, %rax
	jnz label575
	movq $1, %rax
	movq %rax, 16(%rbp)
	jmp label572
label575:
	movq $2, %rax
	movq %rax, 8(%rsp)
	movq 0(%rsp), %rax
	movq 8(%rsp), %rbx
	cmpq %rbx, %rax
	jnz label576
	movq $2, %rax
	movq %rax, 16(%rbp)
	jmp label572
label576:
label573:
	addq $16, %rsp
	movq $3, %rax
	movq %rax, 16(%rbp)
	jmp label572
label572:
	movq %rbp, %rsp
	popq %rbp
	ret
wl_main:
	pushq %rbp
	movq %rsp, %rbp
	movq $3, %rax
	subq $16, %rsp
	movq %rax, 0(%rsp)
	subq $16, %rsp
	movq $-1, %rbx
	movq %rbx, 8(%rsp)
	call wl_f
	addq $16, %rsp
	movq 0(%rsp), %rax
	addq $16, %rsp
	movq -32(%rsp), %rbx
	cmpq %rax, %rbx
	jnz label578
	movq $1, %rax
	jmp label579
label578:
	movq $0, %rax
label579:
	movq %rax, %rdi
	call _assertion
	movq $0, %rax
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
	jnz label580
	movq $1, %rax
	jmp label581
label580:
	movq $0, %rax
label581:
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
	jnz label582
	movq $1, %rax
	jmp label583
label582:
	movq $0, %rax
label583:
	movq %rax, %rdi
	call _assertion
	movq $2, %rax
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
	jnz label584
	movq $1, %rax
	jmp label585
label584:
	movq $0, %rax
label585:
	movq %rax, %rdi
	call _assertion
	movq $3, %rax
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
	jnz label586
	movq $1, %rax
	jmp label587
label586:
	movq $0, %rax
label587:
	movq %rax, %rdi
	call _assertion
label577:
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
