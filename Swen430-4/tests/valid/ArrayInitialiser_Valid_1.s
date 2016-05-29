
	.text
wl_f:
	pushq %rbp
	movq %rsp, %rbp
	movq $32, %rax
	movq %rax, %rdi
	call _malloc
	movq %rax, %rax
	movq %rax, 16(%rbp)
	movq $3, %rbx
	movq %rbx, 0(%rax)
	movq 40(%rbp), %rbx
	movq %rbx, 8(%rax)
	movq 32(%rbp), %rbx
	movq %rbx, 16(%rax)
	movq 24(%rbp), %rbx
	movq %rbx, 24(%rax)
	jmp label6
label6:
	movq %rbp, %rsp
	popq %rbp
	ret
wl_main:
	pushq %rbp
	movq %rsp, %rbp
	subq $16, %rsp
	subq $32, %rsp
	movq $3, %rax
	movq %rax, 8(%rsp)
	movq $2, %rax
	movq %rax, 16(%rsp)
	movq $1, %rax
	movq %rax, 24(%rsp)
	call wl_f
	addq $32, %rsp
	movq -32(%rsp), %rax
	movq %rax, -8(%rbp)
	movq -8(%rbp), %rax
	movq 0(%rax), %rax
	movq $3, %rbx
	cmpq %rax, %rbx
	jnz label8
	movq $1, %rax
	jmp label9
label8:
	movq $0, %rax
label9:
	movq %rax, %rdi
	call _assertion
	movq $0, %rax
	incq %rax
	movq -8(%rbp), %rbx
	movq (%rbx,%rax,8), %rcx
	movq %rcx, %rax
	movq $1, %rbx
	cmpq %rax, %rbx
	jnz label10
	movq $1, %rax
	jmp label11
label10:
	movq $0, %rax
label11:
	movq %rax, %rdi
	call _assertion
	movq $1, %rax
	incq %rax
	movq -8(%rbp), %rbx
	movq (%rbx,%rax,8), %rcx
	movq %rcx, %rax
	movq $2, %rbx
	cmpq %rax, %rbx
	jnz label12
	movq $1, %rax
	jmp label13
label12:
	movq $0, %rax
label13:
	movq %rax, %rdi
	call _assertion
	movq $2, %rax
	incq %rax
	movq -8(%rbp), %rbx
	movq (%rbx,%rax,8), %rcx
	movq %rcx, %rax
	movq $3, %rbx
	cmpq %rax, %rbx
	jnz label14
	movq $1, %rax
	jmp label15
label14:
	movq $0, %rax
label15:
	movq %rax, %rdi
	call _assertion
	subq $32, %rsp
	movq $1, %rax
	movq %rax, 8(%rsp)
	movq $0, %rax
	movq %rax, 16(%rsp)
	movq $0, %rax
	movq %rax, 24(%rsp)
	call wl_f
	addq $32, %rsp
	movq -32(%rsp), %rax
	movq %rax, -8(%rbp)
	movq $0, %rax
	incq %rax
	movq -8(%rbp), %rbx
	movq (%rbx,%rax,8), %rcx
	movq %rcx, %rax
	movq $0, %rbx
	cmpq %rax, %rbx
	jnz label16
	movq $1, %rax
	jmp label17
label16:
	movq $0, %rax
label17:
	movq %rax, %rdi
	call _assertion
	movq $1, %rax
	incq %rax
	movq -8(%rbp), %rbx
	movq (%rbx,%rax,8), %rcx
	movq %rcx, %rax
	movq $0, %rbx
	cmpq %rax, %rbx
	jnz label18
	movq $1, %rax
	jmp label19
label18:
	movq $0, %rax
label19:
	movq %rax, %rdi
	call _assertion
	movq $2, %rax
	incq %rax
	movq -8(%rbp), %rbx
	movq (%rbx,%rax,8), %rcx
	movq %rcx, %rax
	movq $1, %rbx
	cmpq %rax, %rbx
	jnz label20
	movq $1, %rax
	jmp label21
label20:
	movq $0, %rax
label21:
	movq %rax, %rdi
	call _assertion
label7:
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
