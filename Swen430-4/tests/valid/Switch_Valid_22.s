
	.text
wl_f:
	pushq %rbp
	movq %rsp, %rbp
	movq 24(%rbp), %rax
	movq $0, %rbx
	cmpq %rax, %rbx
	jnz label825
label823:
	jmp label824
label825:
	movq $1, %rbx
	cmpq %rax, %rbx
	jnz label827
label824:
	jmp label826
label827:
	movq $2, %rbx
	cmpq %rax, %rbx
	jnz label829
label826:
	movq 24(%rbp), %rbx
	movq $0, %rcx
	cmpq %rbx, %rcx
	jnz label830
	jmp label822
	jmp label830
label830:
	movq 24(%rbp), %rbx
	movq $1, %rcx
	subq %rcx, %rbx
	movq %rbx, 24(%rbp)
	jmp label822
	jmp label828
label829:
label828:
	movq 24(%rbp), %rbx
	movq $1, %rcx
	addq %rcx, %rbx
	movq %rbx, 24(%rbp)
	jmp label822
label832:
label822:
	movq 24(%rbp), %rax
	movq %rax, 16(%rbp)
	jmp label821
label821:
	movq %rbp, %rsp
	popq %rbp
	ret
wl_main:
	pushq %rbp
	movq %rsp, %rbp
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
	jnz label835
	movq $1, %rax
	jmp label836
label835:
	movq $0, %rax
label836:
	movq %rax, %rdi
	call _assertion
	movq $0, %rax
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
	jnz label837
	movq $1, %rax
	jmp label838
label837:
	movq $0, %rax
label838:
	movq %rax, %rdi
	call _assertion
	movq $1, %rax
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
	jnz label839
	movq $1, %rax
	jmp label840
label839:
	movq $0, %rax
label840:
	movq %rax, %rdi
	call _assertion
	movq $4, %rax
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
	jnz label841
	movq $1, %rax
	jmp label842
label841:
	movq $0, %rax
label842:
	movq %rax, %rdi
	call _assertion
label834:
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
