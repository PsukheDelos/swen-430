
	.text
wl_f:
	pushq %rbp
	movq %rsp, %rbp
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
	movq %rcx, 16(%rbp)
	jmp label34
label34:
	movq %rbp, %rsp
	popq %rbp
	ret
wl_main:
	pushq %rbp
	movq %rsp, %rbp
	movq $24, %rax
	movq %rax, %rdi
	call _malloc
	movq %rax, %rax
	movq $2, %rbx
	movq %rbx, 0(%rax)
	movq $1, %rbx
	movq %rbx, 8(%rax)
	movq $4, %rbx
	movq %rbx, 16(%rax)
	subq $16, %rsp
	movq %rax, 0(%rsp)
	subq $16, %rsp
	movq $24, %rbx
	subq $16, %rsp
	movq %rax, 0(%rsp)
	movq %rbx, %rdi
	call _malloc
	movq %rax, %rbx
	movq 0(%rsp), %rax
	addq $16, %rsp
	movq %rbx, 8(%rsp)
	movq $2, %rcx
	movq %rcx, 0(%rbx)
	movq $1, %rcx
	movq %rcx, 8(%rbx)
	movq $4, %rcx
	movq %rcx, 16(%rbx)
	call wl_f
	addq $16, %rsp
	movq 0(%rsp), %rax
	addq $16, %rsp
	movq -32(%rsp), %rbx
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
	jz label36
	movq $1, %rax
	jmp label37
label36:
	movq $0, %rax
label37:
	movq %rax, %rdi
	call _assertion
	movq $8, %rax
	movq %rax, %rdi
	call _malloc
	movq %rax, %rax
	movq $0, %rbx
	movq %rbx, 0(%rax)
	subq $16, %rsp
	movq %rax, 0(%rsp)
	subq $16, %rsp
	movq $8, %rbx
	subq $16, %rsp
	movq %rax, 0(%rsp)
	movq %rbx, %rdi
	call _malloc
	movq %rax, %rbx
	movq 0(%rsp), %rax
	addq $16, %rsp
	movq %rbx, 8(%rsp)
	movq $0, %rcx
	movq %rcx, 0(%rbx)
	call wl_f
	addq $16, %rsp
	movq 0(%rsp), %rax
	addq $16, %rsp
	movq -32(%rsp), %rbx
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
	jz label38
	movq $1, %rax
	jmp label39
label38:
	movq $0, %rax
label39:
	movq %rax, %rdi
	call _assertion
label35:
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
