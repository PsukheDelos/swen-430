
	.text
wl_inc:
	pushq %rbp
	movq %rsp, %rbp
	subq $16, %rsp
	movq 24(%rbp), %rax
	movq 0(%rax), %rbx
	incq %rbx
	movq %rbx, %rcx
	imulq $8, %rcx
	subq $16, %rsp
	movq %rax, 0(%rsp)
	movq %rbx, 8(%rsp)
	movq %rcx, %rdi
	call _malloc
	movq %rax, %rcx
	movq 0(%rsp), %rax
	movq 8(%rsp), %rbx
	addq $16, %rsp
	subq $32, %rsp
	movq %rax, 0(%rsp)
	movq %rbx, 8(%rsp)
	movq %rcx, 16(%rsp)
	movq %rcx, %rdi
	movq %rax, %rsi
	movq %rbx, %rdx
	call _intncpy
	movq 0(%rsp), %rax
	movq 8(%rsp), %rbx
	movq 16(%rsp), %rcx
	addq $32, %rsp
	movq %rcx, %rax
	movq 0(%rax), %rax
	movq %rax, %rbx
	incq %rbx
	imulq $8, %rbx
	subq $16, %rsp
	movq %rax, 0(%rsp)
	movq %rbx, %rdi
	call _malloc
	movq %rax, %rbx
	movq 0(%rsp), %rax
	addq $16, %rsp
	movq %rbx, -8(%rbp)
	movq %rax, 0(%rbx)
	movq $0, %rcx
	addq $8, %rbx
	subq $32, %rsp
	movq %rax, 0(%rsp)
	movq %rbx, 8(%rsp)
	movq %rcx, 16(%rsp)
	movq %rbx, %rdi
	movq %rax, %rsi
	movq %rcx, %rdx
	call _intnfill
	movq 0(%rsp), %rax
	movq 8(%rsp), %rbx
	movq 16(%rsp), %rcx
	addq $32, %rsp
	movq $0, %rax
	movq %rax, -16(%rbp)
label52:
	movq -16(%rbp), %rax
	movq 24(%rbp), %rbx
	movq 0(%rbx), %rcx
	incq %rcx
	movq %rcx, %rdx
	imulq $8, %rdx
	subq $32, %rsp
	movq %rax, 0(%rsp)
	movq %rbx, 8(%rsp)
	movq %rcx, 16(%rsp)
	movq %rdx, %rdi
	call _malloc
	movq %rax, %rdx
	movq 0(%rsp), %rax
	movq 8(%rsp), %rbx
	movq 16(%rsp), %rcx
	addq $32, %rsp
	subq $32, %rsp
	movq %rax, 0(%rsp)
	movq %rbx, 8(%rsp)
	movq %rcx, 16(%rsp)
	movq %rdx, 24(%rsp)
	movq %rdx, %rdi
	movq %rbx, %rsi
	movq %rcx, %rdx
	call _intncpy
	movq 0(%rsp), %rax
	movq 8(%rsp), %rbx
	movq 16(%rsp), %rcx
	movq 24(%rsp), %rdx
	addq $32, %rsp
	movq %rdx, %rbx
	movq 0(%rbx), %rbx
	cmpq %rax, %rbx
	jnz label55
	jmp label53
label55:
	movq -8(%rbp), %rax
	movq 0(%rax), %rbx
	incq %rbx
	movq %rbx, %rcx
	imulq $8, %rcx
	subq $16, %rsp
	movq %rax, 0(%rsp)
	movq %rbx, 8(%rsp)
	movq %rcx, %rdi
	call _malloc
	movq %rax, %rcx
	movq 0(%rsp), %rax
	movq 8(%rsp), %rbx
	addq $16, %rsp
	subq $32, %rsp
	movq %rax, 0(%rsp)
	movq %rbx, 8(%rsp)
	movq %rcx, 16(%rsp)
	movq %rcx, %rdi
	movq %rax, %rsi
	movq %rbx, %rdx
	call _intncpy
	movq 0(%rsp), %rax
	movq 8(%rsp), %rbx
	movq 16(%rsp), %rcx
	addq $32, %rsp
	movq %rcx, %rax
	movq -16(%rbp), %rbx
	incq %rbx
	movq 24(%rbp), %rcx
	movq 0(%rcx), %rdx
	incq %rdx
	movq %rdx, %rdi
	imulq $8, %rdi
	subq $32, %rsp
	movq %rax, 0(%rsp)
	movq %rbx, 8(%rsp)
	movq %rcx, 16(%rsp)
	movq %rdx, 24(%rsp)
	call _malloc
	movq %rax, %rdi
	movq 0(%rsp), %rax
	movq 8(%rsp), %rbx
	movq 16(%rsp), %rcx
	movq 24(%rsp), %rdx
	addq $32, %rsp
	subq $48, %rsp
	movq %rax, 0(%rsp)
	movq %rbx, 8(%rsp)
	movq %rcx, 16(%rsp)
	movq %rdx, 24(%rsp)
	movq %rdi, 32(%rsp)
	movq %rcx, %rsi
	call _intncpy
	movq 0(%rsp), %rax
	movq 8(%rsp), %rbx
	movq 16(%rsp), %rcx
	movq 24(%rsp), %rdx
	movq 32(%rsp), %rdi
	addq $48, %rsp
	movq %rdi, %rcx
	movq (%rcx,%rbx,8), %rdx
	movq %rdx, %rbx
	movq $1, %rcx
	addq %rcx, %rbx
	movq -16(%rbp), %rcx
	incq %rcx
	movq %rbx, (%rax,%rcx,8)
	movq %rax, -8(%rbp)
label54:
	movq -16(%rbp), %rax
	movq $1, %rbx
	addq %rbx, %rax
	movq %rax, -16(%rbp)
	jmp label52
label53:
	movq -8(%rbp), %rax
	movq 0(%rax), %rbx
	incq %rbx
	movq %rbx, %rcx
	imulq $8, %rcx
	subq $16, %rsp
	movq %rax, 0(%rsp)
	movq %rbx, 8(%rsp)
	movq %rcx, %rdi
	call _malloc
	movq %rax, %rcx
	movq 0(%rsp), %rax
	movq 8(%rsp), %rbx
	addq $16, %rsp
	subq $32, %rsp
	movq %rax, 0(%rsp)
	movq %rbx, 8(%rsp)
	movq %rcx, 16(%rsp)
	movq %rcx, %rdi
	movq %rax, %rsi
	movq %rbx, %rdx
	call _intncpy
	movq 0(%rsp), %rax
	movq 8(%rsp), %rbx
	movq 16(%rsp), %rcx
	addq $32, %rsp
	movq %rcx, 16(%rbp)
	jmp label51
label51:
	movq %rbp, %rsp
	popq %rbp
	ret
wl_main:
	pushq %rbp
	movq %rsp, %rbp
	subq $16, %rsp
	subq $16, %rsp
	movq $32, %rax
	movq %rax, %rdi
	call _malloc
	movq %rax, %rax
	movq %rax, 8(%rsp)
	movq $3, %rbx
	movq %rbx, 0(%rax)
	movq $1, %rbx
	movq %rbx, 8(%rax)
	movq $2, %rbx
	movq %rbx, 16(%rax)
	movq $3, %rbx
	movq %rbx, 24(%rax)
	call wl_inc
	addq $16, %rsp
	movq -16(%rsp), %rax
	movq %rax, -8(%rbp)
	movq -8(%rbp), %rax
	movq 0(%rax), %rbx
	incq %rbx
	movq %rbx, %rcx
	imulq $8, %rcx
	subq $16, %rsp
	movq %rax, 0(%rsp)
	movq %rbx, 8(%rsp)
	movq %rcx, %rdi
	call _malloc
	movq %rax, %rcx
	movq 0(%rsp), %rax
	movq 8(%rsp), %rbx
	addq $16, %rsp
	subq $32, %rsp
	movq %rax, 0(%rsp)
	movq %rbx, 8(%rsp)
	movq %rcx, 16(%rsp)
	movq %rcx, %rdi
	movq %rax, %rsi
	movq %rbx, %rdx
	call _intncpy
	movq 0(%rsp), %rax
	movq 8(%rsp), %rbx
	movq 16(%rsp), %rcx
	addq $32, %rsp
	movq %rcx, %rax
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
	movq $2, %rcx
	movq %rcx, 8(%rbx)
	movq $3, %rcx
	movq %rcx, 16(%rbx)
	movq $4, %rcx
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
	jz label57
	movq $1, %rax
	jmp label58
label57:
	movq $0, %rax
label58:
	movq %rax, %rdi
	call _assertion
	subq $16, %rsp
	movq $8, %rax
	movq %rax, %rdi
	call _malloc
	movq %rax, %rax
	movq %rax, 8(%rsp)
	movq $0, %rbx
	movq %rbx, 0(%rax)
	call wl_inc
	addq $16, %rsp
	movq -16(%rsp), %rax
	movq %rax, -16(%rbp)
	movq -16(%rbp), %rax
	movq 0(%rax), %rbx
	incq %rbx
	movq %rbx, %rcx
	imulq $8, %rcx
	subq $16, %rsp
	movq %rax, 0(%rsp)
	movq %rbx, 8(%rsp)
	movq %rcx, %rdi
	call _malloc
	movq %rax, %rcx
	movq 0(%rsp), %rax
	movq 8(%rsp), %rbx
	addq $16, %rsp
	subq $32, %rsp
	movq %rax, 0(%rsp)
	movq %rbx, 8(%rsp)
	movq %rcx, 16(%rsp)
	movq %rcx, %rdi
	movq %rax, %rsi
	movq %rbx, %rdx
	call _intncpy
	movq 0(%rsp), %rax
	movq 8(%rsp), %rbx
	movq 16(%rsp), %rcx
	addq $32, %rsp
	movq %rcx, %rax
	movq $8, %rbx
	subq $16, %rsp
	movq %rax, 0(%rsp)
	movq %rbx, %rdi
	call _malloc
	movq %rax, %rbx
	movq 0(%rsp), %rax
	addq $16, %rsp
	movq $0, %rcx
	movq %rcx, 0(%rbx)
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
	jz label59
	movq $1, %rax
	jmp label60
label59:
	movq $0, %rax
label60:
	movq %rax, %rdi
	call _assertion
label56:
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
