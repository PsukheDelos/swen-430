
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
	jnz label865
label863:
	movq $0, %rax
	movq %rax, 16(%rbp)
	jmp label861
	jmp label864
label865:
	movq $1, %rax
	movq %rax, 8(%rsp)
	movq 0(%rsp), %rax
	movq 8(%rsp), %rbx
	cmpq %rbx, %rax
	jnz label867
label864:
	movq $1, %rax
	movq %rax, 16(%rbp)
	jmp label861
	jmp label866
label867:
	movq $2, %rax
	movq %rax, 8(%rsp)
	movq 0(%rsp), %rax
	movq 8(%rsp), %rbx
	cmpq %rbx, %rax
	jnz label869
label866:
	movq $2, %rax
	movq %rax, 16(%rbp)
	jmp label861
	jmp label868
label869:
label862:
	addq $16, %rsp
	movq $3, %rax
	movq %rax, 16(%rbp)
	jmp label861
label861:
	movq %rbp, %rsp
	popq %rbp
	ret
wl_main:
	pushq %rbp
	movq %rsp, %rbp
	movq $1, %rax
	movq $1, %rbx
	cmpq %rax, %rbx
	jnz label872
	movq $1, %rax
	jmp label873
label872:
	movq $0, %rax
label873:
	movq %rax, %rdi
	call _assertion
	movq $1, %rax
	movq $1, %rbx
	cmpq %rax, %rbx
	jnz label874
	movq $1, %rax
	jmp label875
label874:
	movq $0, %rax
label875:
	movq %rax, %rdi
	call _assertion
	movq $1, %rax
	movq $1, %rbx
	cmpq %rax, %rbx
	jnz label876
	movq $1, %rax
	jmp label877
label876:
	movq $0, %rax
label877:
	movq %rax, %rdi
	call _assertion
	movq $1, %rax
	movq $1, %rbx
	cmpq %rax, %rbx
	jnz label878
	movq $1, %rax
	jmp label879
label878:
	movq $0, %rax
label879:
	movq %rax, %rdi
	call _assertion
	movq $1, %rax
	movq $1, %rbx
	cmpq %rax, %rbx
	jnz label880
	movq $1, %rax
	jmp label881
label880:
	movq $0, %rax
label881:
	movq %rax, %rdi
	call _assertion
label871:
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
