
	.text
wl_f:
	pushq %rbp
	movq %rsp, %rbp
	subq $16, %rsp
	movq $0, %rax
	movq %rax, -8(%rbp)
	movq 24(%rbp), %rax
	movq %rax, -16(%rbp)
label904:
	movq -16(%rbp), %rax
	movq $10, %rbx
	cmpq %rbx, %rax
	jge label905
	movq -16(%rbp), %rax
	movq $0, %rbx
	cmpq %rax, %rbx
	jnz label909
label907:
	movq -8(%rbp), %rbx
	movq $1, %rcx
	addq %rcx, %rbx
	movq %rbx, -8(%rbp)
	movq -16(%rbp), %rbx
	movq $1, %rcx
	addq %rcx, %rbx
	movq %rbx, -16(%rbp)
	jmp label904
	jmp label908
label909:
	movq $1, %rbx
	cmpq %rax, %rbx
	jnz label911
label908:
	movq -8(%rbp), %rbx
	movq $10, %rcx
	addq %rcx, %rbx
	movq %rbx, -8(%rbp)
	jmp label910
label911:
	movq $2, %rbx
	cmpq %rax, %rbx
	jnz label913
label910:
	movq -8(%rbp), %rbx
	movq $100, %rcx
	addq %rcx, %rbx
	movq %rbx, -8(%rbp)
	jmp label906
	jmp label912
label913:
	movq $3, %rbx
	cmpq %rax, %rbx
	jnz label915
label912:
	movq -8(%rbp), %rbx
	movq $1000, %rcx
	addq %rcx, %rbx
	movq %rbx, -8(%rbp)
	movq -8(%rbp), %rbx
	movq %rbx, 16(%rbp)
	jmp label903
	jmp label914
label915:
label914:
	movq -8(%rbp), %rbx
	movq $10000, %rcx
	addq %rcx, %rbx
	movq %rbx, -8(%rbp)
label917:
label906:
	movq -16(%rbp), %rax
	movq $1, %rbx
	addq %rbx, %rax
	movq %rax, -16(%rbp)
	movq -16(%rbp), %rax
	movq $5, %rbx
	cmpq %rax, %rbx
	jnz label919
	jmp label905
	jmp label919
label919:
	jmp label904
label905:
	movq -8(%rbp), %rax
	movq %rax, 16(%rbp)
	jmp label903
label903:
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
	jnz label921
	movq $1, %rax
	jmp label922
label921:
	movq $0, %rax
label922:
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
	jnz label923
	movq $1, %rax
	jmp label924
label923:
	movq $0, %rax
label924:
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
	jnz label925
	movq $1, %rax
	jmp label926
label925:
	movq $0, %rax
label926:
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
	jnz label927
	movq $1, %rax
	jmp label928
label927:
	movq $0, %rax
label928:
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
	jnz label929
	movq $1, %rax
	jmp label930
label929:
	movq $0, %rax
label930:
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
	jnz label931
	movq $1, %rax
	jmp label932
label931:
	movq $0, %rax
label932:
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
	jnz label933
	movq $1, %rax
	jmp label934
label933:
	movq $0, %rax
label934:
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
