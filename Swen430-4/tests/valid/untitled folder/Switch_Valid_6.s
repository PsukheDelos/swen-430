
	.text
wl_f:
	pushq %rbp
	movq %rsp, %rbp
	subq $16, %rsp
	movq 24(%rbp), %rax
	movq $1, %rbx
	cmpq %rax, %rbx
	jnz label786
label784:
	movq $-1, %rbx
	movq %rbx, -8(%rbp)
	jmp label783
	jmp label785
label786:
	movq $2, %rbx
	cmpq %rax, %rbx
	jnz label788
label785:
	movq $-2, %rbx
	movq %rbx, -8(%rbp)
	jmp label783
	jmp label787
label788:
label787:
	movq $0, %rbx
	movq %rbx, -8(%rbp)
label790:
label783:
	movq -8(%rbp), %rax
	movq %rax, 16(%rbp)
	jmp label782
label782:
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
	jnz label793
	movq $1, %rax
	jmp label794
label793:
	movq $0, %rax
label794:
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
	jnz label795
	movq $1, %rax
	jmp label796
label795:
	movq $0, %rax
label796:
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
	jnz label797
	movq $1, %rax
	jmp label798
label797:
	movq $0, %rax
label798:
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
	jnz label799
	movq $1, %rax
	jmp label800
label799:
	movq $0, %rax
label800:
	movq %rax, %rdi
	call _assertion
label792:
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
