
	.text
wl_f:
	pushq %rbp
	movq %rsp, %rbp
	subq $16, %rsp
	movq 32(%rbp), %rax
	movq %rax, -16(%rbp)
	movq 32(%rbp), %rax
	movq $1, %rbx
	addq %rbx, %rax
	movq %rax, -8(%rbp)
	movq -16(%rbp), %rax
	movq %rax, 16(%rbp)
	movq -8(%rbp), %rax
	movq %rax, 24(%rbp)
	jmp label521
label521:
	movq %rbp, %rsp
	popq %rbp
	ret
wl_main:
	pushq %rbp
	movq %rsp, %rbp
	subq $32, %rsp
	movq $1, %rax
	movq %rax, 0(%rsp)
	movq $2, %rax
	movq %rax, 8(%rsp)
	subq $32, %rsp
	movq $1, %rax
	movq %rax, 16(%rsp)
	call wl_f
	addq $32, %rsp
	movq -32(%rsp), %rax
	movq %rax, 16(%rsp)
	movq -24(%rsp), %rax
	movq %rax, 24(%rsp)
	movq 0(%rsp), %rax
	movq 16(%rsp), %rbx
	cmpq %rbx, %rax
	jnz label523
	movq 8(%rsp), %rax
	movq 24(%rsp), %rbx
	cmpq %rbx, %rax
	jnz label523
	addq $32, %rsp
	movq $1, %rax
	jmp label524
label523:
	movq $0, %rax
label524:
	movq %rax, %rdi
	call _assertion
	subq $32, %rsp
	movq $2, %rax
	movq %rax, 0(%rsp)
	movq $3, %rax
	movq %rax, 8(%rsp)
	subq $32, %rsp
	movq $2, %rax
	movq %rax, 16(%rsp)
	call wl_f
	addq $32, %rsp
	movq -32(%rsp), %rax
	movq %rax, 16(%rsp)
	movq -24(%rsp), %rax
	movq %rax, 24(%rsp)
	movq 0(%rsp), %rax
	movq 16(%rsp), %rbx
	cmpq %rbx, %rax
	jnz label525
	movq 8(%rsp), %rax
	movq 24(%rsp), %rbx
	cmpq %rbx, %rax
	jnz label525
	addq $32, %rsp
	movq $1, %rax
	jmp label526
label525:
	movq $0, %rax
label526:
	movq %rax, %rdi
	call _assertion
	subq $32, %rsp
	movq $9, %rax
	movq %rax, 0(%rsp)
	movq $10, %rax
	movq %rax, 8(%rsp)
	subq $32, %rsp
	movq $9, %rax
	movq %rax, 16(%rsp)
	call wl_f
	addq $32, %rsp
	movq -32(%rsp), %rax
	movq %rax, 16(%rsp)
	movq -24(%rsp), %rax
	movq %rax, 24(%rsp)
	movq 0(%rsp), %rax
	movq 16(%rsp), %rbx
	cmpq %rbx, %rax
	jnz label527
	movq 8(%rsp), %rax
	movq 24(%rsp), %rbx
	cmpq %rbx, %rax
	jnz label527
	addq $32, %rsp
	movq $1, %rax
	jmp label528
label527:
	movq $0, %rax
label528:
	movq %rax, %rdi
	call _assertion
label522:
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
