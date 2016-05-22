
	.text
wl_f:
	pushq %rbp
	movq %rsp, %rbp
	subq $16, %rsp
	movq 24(%rbp), %rax
	movq $1, %rbx
	cmpq %rax, %rbx
	jnz label776
label774:
	movq $-1, %rbx
	movq %rbx, -8(%rbp)
	jmp label773
	jmp label775
label776:
	movq $2, %rbx
	cmpq %rax, %rbx
	jnz label778
label775:
	movq $-2, %rbx
	movq %rbx, -8(%rbp)
	jmp label773
	jmp label777
label778:
label777:
	movq $0, %rbx
	movq %rbx, -8(%rbp)
label780:
label773:
	movq -8(%rbp), %rax
	movq %rax, 16(%rbp)
	jmp label772
label772:
	movq %rbp, %rsp
	popq %rbp
	ret
wl_main:
	pushq %rbp
	movq %rsp, %rbp
	movq $-1, %rax
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
	jnz label783
	movq $1, %rax
	jmp label784
label783:
	movq $0, %rax
label784:
	movq %rax, %rdi
	call _assertion
	movq $-2, %rax
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
	jnz label785
	movq $1, %rax
	jmp label786
label785:
	movq $0, %rax
label786:
	movq %rax, %rdi
	call _assertion
	movq $0, %rax
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
	jnz label787
	movq $1, %rax
	jmp label788
label787:
	movq $0, %rax
label788:
	movq %rax, %rdi
	call _assertion
	movq $0, %rax
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
	jnz label789
	movq $1, %rax
	jmp label790
label789:
	movq $0, %rax
label790:
	movq %rax, %rdi
	call _assertion
label782:
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
