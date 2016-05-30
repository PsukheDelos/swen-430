
	.text
wl_f:
	pushq %rbp
	movq %rsp, %rbp
	subq $16, %rsp
	movq 24(%rbp), %rax
	movq $1, %rbx
	cmpq %rax, %rbx
	jnz label914
label912:
	movq $-1, %rbx
	movq %rbx, -8(%rbp)
	jmp label911
	jmp label913
label914:
	movq $2, %rbx
	cmpq %rax, %rbx
	jnz label916
label913:
	movq $-2, %rbx
	movq %rbx, -8(%rbp)
	jmp label911
	jmp label915
label916:
label915:
	movq $0, %rbx
	movq %rbx, -8(%rbp)
label918:
label911:
	movq -8(%rbp), %rax
	movq %rax, 16(%rbp)
	jmp label910
label910:
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
	jnz label921
	movq $1, %rax
	jmp label922
label921:
	movq $0, %rax
label922:
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
	jnz label923
	movq $1, %rax
	jmp label924
label923:
	movq $0, %rax
label924:
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
	jnz label925
	movq $1, %rax
	jmp label926
label925:
	movq $0, %rax
label926:
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
	jnz label927
	movq $1, %rax
	jmp label928
label927:
	movq $0, %rax
label928:
	movq %rax, %rdi
	call _assertion
label920:
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
