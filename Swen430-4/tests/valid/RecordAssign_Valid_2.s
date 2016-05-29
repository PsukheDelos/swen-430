
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
	jmp label483
label483:
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
	subq $32, %rsp
	movq -16(%rbp), %rax
	movq %rax, 0(%rsp)
	movq -8(%rbp), %rax
	movq %rax, 8(%rsp)
	movq $2, %rax
	movq %rax, 16(%rsp)
	movq $3, %rax
	movq %rax, 24(%rsp)
	movq 0(%rsp), %rax
	movq 16(%rsp), %rbx
	cmpq %rbx, %rax
	jnz label485
	movq 8(%rsp), %rax
	movq 24(%rsp), %rbx
	cmpq %rbx, %rax
	jnz label485
	addq $32, %rsp
	movq $1, %rax
	jmp label486
label485:
	movq $0, %rax
label486:
	movq %rax, %rdi
	call _assertion
	subq $16, %rsp
	movq -16(%rbp), %rax
	movq %rax, 0(%rsp)
	movq -8(%rbp), %rax
	movq %rax, 8(%rsp)
	movq 0(%rsp), %rax
	addq $16, %rsp
	movq $2, %rbx
	cmpq %rax, %rbx
	jnz label487
	movq $1, %rax
	jmp label488
label487:
	movq $0, %rax
label488:
	movq %rax, %rdi
	call _assertion
	subq $16, %rsp
	movq -16(%rbp), %rax
	movq %rax, 0(%rsp)
	movq -8(%rbp), %rax
	movq %rax, 8(%rsp)
	movq 8(%rsp), %rax
	addq $16, %rsp
	movq $3, %rbx
	cmpq %rax, %rbx
	jnz label489
	movq $1, %rax
	jmp label490
label489:
	movq $0, %rax
label490:
	movq %rax, %rdi
	call _assertion
	movq $1, %rax
	movq %rax, -16(%rbp)
	subq $32, %rsp
	movq -16(%rbp), %rax
	movq %rax, 0(%rsp)
	movq -8(%rbp), %rax
	movq %rax, 8(%rsp)
	movq $1, %rax
	movq %rax, 16(%rsp)
	movq $3, %rax
	movq %rax, 24(%rsp)
	movq 0(%rsp), %rax
	movq 16(%rsp), %rbx
	cmpq %rbx, %rax
	jnz label491
	movq 8(%rsp), %rax
	movq 24(%rsp), %rbx
	cmpq %rbx, %rax
	jnz label491
	addq $32, %rsp
	movq $1, %rax
	jmp label492
label491:
	movq $0, %rax
label492:
	movq %rax, %rdi
	call _assertion
	subq $16, %rsp
	movq -16(%rbp), %rax
	movq %rax, 0(%rsp)
	movq -8(%rbp), %rax
	movq %rax, 8(%rsp)
	movq 0(%rsp), %rax
	addq $16, %rsp
	movq $1, %rbx
	cmpq %rax, %rbx
	jnz label493
	movq $1, %rax
	jmp label494
label493:
	movq $0, %rax
label494:
	movq %rax, %rdi
	call _assertion
	subq $16, %rsp
	movq -16(%rbp), %rax
	movq %rax, 0(%rsp)
	movq -8(%rbp), %rax
	movq %rax, 8(%rsp)
	movq 8(%rsp), %rax
	addq $16, %rsp
	movq $3, %rbx
	cmpq %rax, %rbx
	jnz label495
	movq $1, %rax
	jmp label496
label495:
	movq $0, %rax
label496:
	movq %rax, %rdi
	call _assertion
	subq $32, %rsp
	movq -16(%rbp), %rax
	movq %rax, 16(%rsp)
	movq -8(%rbp), %rax
	movq %rax, 24(%rsp)
	call wl_f
	addq $32, %rsp
	movq -32(%rsp), %rax
	movq %rax, -32(%rbp)
	movq -24(%rsp), %rax
	movq %rax, -24(%rbp)
	subq $32, %rsp
	movq -32(%rbp), %rax
	movq %rax, 0(%rsp)
	movq -24(%rbp), %rax
	movq %rax, 8(%rsp)
	movq $0, %rax
	movq %rax, 16(%rsp)
	movq $3, %rax
	movq %rax, 24(%rsp)
	movq 0(%rsp), %rax
	movq 16(%rsp), %rbx
	cmpq %rbx, %rax
	jnz label497
	movq 8(%rsp), %rax
	movq 24(%rsp), %rbx
	cmpq %rbx, %rax
	jnz label497
	addq $32, %rsp
	movq $1, %rax
	jmp label498
label497:
	movq $0, %rax
label498:
	movq %rax, %rdi
	call _assertion
	subq $16, %rsp
	movq -32(%rbp), %rax
	movq %rax, 0(%rsp)
	movq -24(%rbp), %rax
	movq %rax, 8(%rsp)
	movq 0(%rsp), %rax
	addq $16, %rsp
	movq $0, %rbx
	cmpq %rax, %rbx
	jnz label499
	movq $1, %rax
	jmp label500
label499:
	movq $0, %rax
label500:
	movq %rax, %rdi
	call _assertion
	subq $16, %rsp
	movq -32(%rbp), %rax
	movq %rax, 0(%rsp)
	movq -24(%rbp), %rax
	movq %rax, 8(%rsp)
	movq 8(%rsp), %rax
	addq $16, %rsp
	movq $3, %rbx
	cmpq %rax, %rbx
	jnz label501
	movq $1, %rax
	jmp label502
label501:
	movq $0, %rax
label502:
	movq %rax, %rdi
	call _assertion
label484:
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
