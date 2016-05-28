
	.text
wl_f:
	pushq %rbp
	movq %rsp, %rbp
	subq $16, %rsp
label888:
	movq 24(%rbp), %rax
	movq $0, %rbx
	cmpq %rbx, %rax
	jl label889
	movq 24(%rbp), %rax
	movq $0, %rbx
	cmpq %rbx, %rax
	jge label891
	movq $0, %rax
	movq %rax, 16(%rbp)
	jmp label887
	jmp label890
label891:
	movq 24(%rbp), %rax
	movq %rax, -8(%rbp)
label890:
	movq -8(%rbp), %rax
	movq %rax, 16(%rbp)
	jmp label887
	jmp label888
label889:
	movq $0, %rax
	movq %rax, 16(%rbp)
	jmp label887
label887:
	movq %rbp, %rsp
	popq %rbp
	ret
wl_main:
	pushq %rbp
	movq %rsp, %rbp
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
	jnz label893
	movq $1, %rax
	jmp label894
label893:
	movq $0, %rax
label894:
	movq %rax, %rdi
	call _assertion
	movq $10, %rax
	subq $16, %rsp
	movq %rax, 0(%rsp)
	subq $16, %rsp
	movq $10, %rbx
	movq %rbx, 8(%rsp)
	call wl_f
	addq $16, %rsp
	movq 0(%rsp), %rax
	addq $16, %rsp
	movq -32(%rsp), %rbx
	cmpq %rax, %rbx
	jnz label895
	movq $1, %rax
	jmp label896
label895:
	movq $0, %rax
label896:
	movq %rax, %rdi
	call _assertion
	movq $11, %rax
	subq $16, %rsp
	movq %rax, 0(%rsp)
	subq $16, %rsp
	movq $11, %rbx
	movq %rbx, 8(%rsp)
	call wl_f
	addq $16, %rsp
	movq 0(%rsp), %rax
	addq $16, %rsp
	movq -32(%rsp), %rbx
	cmpq %rax, %rbx
	jnz label897
	movq $1, %rax
	jmp label898
label897:
	movq $0, %rax
label898:
	movq %rax, %rdi
	call _assertion
	movq $1212, %rax
	subq $16, %rsp
	movq %rax, 0(%rsp)
	subq $16, %rsp
	movq $1212, %rbx
	movq %rbx, 8(%rsp)
	call wl_f
	addq $16, %rsp
	movq 0(%rsp), %rax
	addq $16, %rsp
	movq -32(%rsp), %rbx
	cmpq %rax, %rbx
	jnz label899
	movq $1, %rax
	jmp label900
label899:
	movq $0, %rax
label900:
	movq %rax, %rdi
	call _assertion
	movq $0, %rax
	subq $16, %rsp
	movq %rax, 0(%rsp)
	subq $16, %rsp
	movq $-1212, %rbx
	movq %rbx, 8(%rsp)
	call wl_f
	addq $16, %rsp
	movq 0(%rsp), %rax
	addq $16, %rsp
	movq -32(%rsp), %rbx
	cmpq %rax, %rbx
	jnz label901
	movq $1, %rax
	jmp label902
label901:
	movq $0, %rax
label902:
	movq %rax, %rdi
	call _assertion
label892:
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
