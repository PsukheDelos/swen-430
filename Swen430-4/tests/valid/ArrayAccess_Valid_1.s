
	.text
wl_f:
	pushq %rbp
	movq %rsp, %rbp
	subq $16, %rsp
	movq $0, %rax
	incq %rax
	movq 24(%rbp), %rbx
	movq (%rbx,%rax,8), %rcx
	movq %rcx, -8(%rbp)
	movq $0, %rax
	incq %rax
	movq 24(%rbp), %rbx
	movq (%rbx,%rax,8), %rcx
	movq %rcx, -16(%rbp)
	movq -16(%rbp), %rax
	movq -8(%rbp), %rbx
	addq %rbx, %rax
	movq %rax, 16(%rbp)
	jmp label0
label0:
	movq %rbp, %rsp
	popq %rbp
	ret
wl_main:
	pushq %rbp
	movq %rsp, %rbp
	subq $16, %rsp
	movq $32, %rax
	movq %rax, %rdi
	call _malloc
	movq %rax, %rax
	movq %rax, -8(%rbp)
	movq $3, %rbx
	movq %rbx, 0(%rax)
	movq $1, %rbx
	movq %rbx, 8(%rax)
	movq $2, %rbx
	movq %rbx, 16(%rax)
	movq $3, %rbx
	movq %rbx, 24(%rax)
	movq $0, %rax
	incq %rax
	movq -8(%rbp), %rbx
	movq (%rbx,%rax,8), %rcx
	movq %rcx, %rax
	movq %rax, %rdi
	call _prnint
	subq $16, %rsp
	movq -8(%rbp), %rax
	movq %rax, 8(%rsp)
	call wl_f
	addq $16, %rsp
	movq -16(%rsp), %rax
	movq $2, %rbx
	cmpq %rax, %rbx
	jnz label2
	movq $1, %rax
	jmp label3
label2:
	movq $0, %rax
label3:
	movq %rax, %rdi
	call _assertion
	movq -8(%rbp), %rax
	movq $32, %rbx
	subq $16, %rsp
	movq %rax, 0(%rsp)
	movq %rbx, %rdi
	call _malloc
	movq %rax, %rbx
	movq 0(%rsp), %rax
	addq $16, %rsp
	movq $3, %rcx
	movq %rcx, 0(%rbx)
	movq $1, %rcx
	movq %rcx, 8(%rbx)
	movq $2, %rcx
	movq %rcx, 16(%rbx)
	movq $3, %rcx
	movq %rcx, 24(%rbx)
	movq 0(%rax), %rcx
	incq %rcx
	subq $32, %rsp
	movq %rax, 0(%rsp)
	movq %rbx, 8(%rsp)
	movq %rcx, 16(%rsp)
	movq %rax, %rdi
	movq %rbx, %rsi
	movq %rcx, %rdx
	call _intncmp
	movq %rax, %rdx
	movq 0(%rsp), %rax
	movq 8(%rsp), %rbx
	movq 16(%rsp), %rcx
	addq $32, %rsp
	cmpq $0, %rdx
	jz label4
	movq $1, %rax
	jmp label5
label4:
	movq $0, %rax
label5:
	movq %rax, %rdi
	call _assertion
label1:
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
