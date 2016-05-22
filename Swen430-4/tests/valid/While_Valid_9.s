
	.text
wl_f:
	pushq %rbp
	movq %rsp, %rbp
	subq $16, %rsp
	movq $0, %rax
	movq %rax, -8(%rbp)
	movq 24(%rbp), %rax
	movq %rax, -16(%rbp)
label894:
	movq -16(%rbp), %rax
	movq $10, %rbx
	cmpq %rbx, %rax
	jge label895
	movq -16(%rbp), %rax
	movq $0, %rbx
	cmpq %rax, %rbx
	jnz label899
label897:
	movq -8(%rbp), %rbx
	movq $1, %rcx
	addq %rcx, %rbx
	movq %rbx, -8(%rbp)
	movq -16(%rbp), %rbx
	movq $1, %rcx
	addq %rcx, %rbx
	movq %rbx, -16(%rbp)
	jmp label894
	jmp label898
label899:
	movq $1, %rbx
	cmpq %rax, %rbx
	jnz label901
label898:
	movq -8(%rbp), %rbx
	movq $10, %rcx
	addq %rcx, %rbx
	movq %rbx, -8(%rbp)
	jmp label900
label901:
	movq $2, %rbx
	cmpq %rax, %rbx
	jnz label903
label900:
	movq -8(%rbp), %rbx
	movq $100, %rcx
	addq %rcx, %rbx
	movq %rbx, -8(%rbp)
	jmp label896
	jmp label902
label903:
	movq $3, %rbx
	cmpq %rax, %rbx
	jnz label905
label902:
	movq -8(%rbp), %rbx
	movq $1000, %rcx
	addq %rcx, %rbx
	movq %rbx, -8(%rbp)
	movq -8(%rbp), %rbx
	movq %rbx, 16(%rbp)
	jmp label893
	jmp label904
label905:
label904:
	movq -8(%rbp), %rbx
	movq $10000, %rcx
	addq %rcx, %rbx
	movq %rbx, -8(%rbp)
label907:
label896:
	movq -16(%rbp), %rax
	movq $1, %rbx
	addq %rbx, %rax
	movq %rax, -16(%rbp)
	movq -16(%rbp), %rax
	movq $5, %rbx
	cmpq %rax, %rbx
	jnz label909
	jmp label895
	jmp label909
label909:
	jmp label894
label895:
	movq -8(%rbp), %rax
	movq %rax, 16(%rbp)
	jmp label893
label893:
	movq %rbp, %rsp
	popq %rbp
	ret
wl_main:
	pushq %rbp
	movq %rsp, %rbp
	subq $16, %rsp
	movq $0, %rax
	movq %rax, 8(%rsp)
	call wl_f
	addq $16, %rsp
	movq -16(%rsp), %rax
	movq $1211, %rbx
	cmpq %rax, %rbx
	jnz label911
	movq $1, %rax
	jmp label912
label911:
	movq $0, %rax
label912:
	movq %rax, %rdi
	call _assertion
	subq $16, %rsp
	movq $1, %rax
	movq %rax, 8(%rsp)
	call wl_f
	addq $16, %rsp
	movq -16(%rsp), %rax
	movq $1210, %rbx
	cmpq %rax, %rbx
	jnz label913
	movq $1, %rax
	jmp label914
label913:
	movq $0, %rax
label914:
	movq %rax, %rdi
	call _assertion
	subq $16, %rsp
	movq $2, %rax
	movq %rax, 8(%rsp)
	call wl_f
	addq $16, %rsp
	movq -16(%rsp), %rax
	movq $1100, %rbx
	cmpq %rax, %rbx
	jnz label915
	movq $1, %rax
	jmp label916
label915:
	movq $0, %rax
label916:
	movq %rax, %rdi
	call _assertion
	subq $16, %rsp
	movq $3, %rax
	movq %rax, 8(%rsp)
	call wl_f
	addq $16, %rsp
	movq -16(%rsp), %rax
	movq $1000, %rbx
	cmpq %rax, %rbx
	jnz label917
	movq $1, %rax
	jmp label918
label917:
	movq $0, %rax
label918:
	movq %rax, %rdi
	call _assertion
	subq $16, %rsp
	movq $4, %rax
	movq %rax, 8(%rsp)
	call wl_f
	addq $16, %rsp
	movq -16(%rsp), %rax
	movq $10000, %rbx
	cmpq %rax, %rbx
	jnz label919
	movq $1, %rax
	jmp label920
label919:
	movq $0, %rax
label920:
	movq %rax, %rdi
	call _assertion
	subq $16, %rsp
	movq $5, %rax
	movq %rax, 8(%rsp)
	call wl_f
	addq $16, %rsp
	movq -16(%rsp), %rax
	movq $50000, %rbx
	cmpq %rax, %rbx
	jnz label921
	movq $1, %rax
	jmp label922
label921:
	movq $0, %rax
label922:
	movq %rax, %rdi
	call _assertion
	subq $16, %rsp
	movq $6, %rax
	movq %rax, 8(%rsp)
	call wl_f
	addq $16, %rsp
	movq -16(%rsp), %rax
	movq $40000, %rbx
	cmpq %rax, %rbx
	jnz label923
	movq $1, %rax
	jmp label924
label923:
	movq $0, %rax
label924:
	movq %rax, %rdi
	call _assertion
label910:
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
