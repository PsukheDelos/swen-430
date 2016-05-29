
	.text
wl_f:
	pushq %rbp
	movq %rsp, %rbp
	movq 24(%rbp), %rax
	movq 0(%rax), %rax
	movq %rax, 16(%rbp)
	jmp label22
label22:
	movq %rbp, %rsp
	popq %rbp
	ret
wl_main:
	pushq %rbp
	movq %rsp, %rbp
	subq $16, %rsp
	movq $8, %rax
	movq %rax, %rdi
	call _malloc
	movq %rax, %rax
	movq %rax, 8(%rsp)
	movq $0, %rbx
	movq %rbx, 0(%rax)
	call wl_f
	addq $16, %rsp
	movq -16(%rsp), %rax
	movq $0, %rbx
	cmpq %rax, %rbx
	jnz label24
	movq $1, %rax
	jmp label25
label24:
	movq $0, %rax
label25:
	movq %rax, %rdi
	call _assertion
	subq $16, %rsp
	movq $16, %rax
	movq %rax, %rdi
	call _malloc
	movq %rax, %rax
	movq %rax, 8(%rsp)
	movq $1, %rbx
	movq %rbx, 0(%rax)
	movq $5, %rbx
	movq %rbx, 8(%rax)
	call wl_f
	addq $16, %rsp
	movq -16(%rsp), %rax
	movq $1, %rbx
	cmpq %rax, %rbx
	jnz label26
	movq $1, %rax
	jmp label27
label26:
	movq $0, %rax
label27:
	movq %rax, %rdi
	call _assertion
	subq $16, %rsp
	movq $24, %rax
	movq %rax, %rdi
	call _malloc
	movq %rax, %rax
	movq %rax, 8(%rsp)
	movq $2, %rbx
	movq %rbx, 0(%rax)
	movq $5, %rbx
	movq %rbx, 8(%rax)
	movq $5, %rbx
	movq %rbx, 16(%rax)
	call wl_f
	addq $16, %rsp
	movq -16(%rsp), %rax
	movq $2, %rbx
	cmpq %rax, %rbx
	jnz label28
	movq $1, %rax
	jmp label29
label28:
	movq $0, %rax
label29:
	movq %rax, %rdi
	call _assertion
	subq $16, %rsp
	movq $32, %rax
	movq %rax, %rdi
	call _malloc
	movq %rax, %rax
	movq %rax, 8(%rsp)
	movq $3, %rbx
	movq %rbx, 0(%rax)
	movq $5, %rbx
	movq %rbx, 8(%rax)
	movq $5, %rbx
	movq %rbx, 16(%rax)
	movq $5, %rbx
	movq %rbx, 24(%rax)
	call wl_f
	addq $16, %rsp
	movq -16(%rsp), %rax
	movq $3, %rbx
	cmpq %rax, %rbx
	jnz label30
	movq $1, %rax
	jmp label31
label30:
	movq $0, %rax
label31:
	movq %rax, %rdi
	call _assertion
	subq $16, %rsp
	movq $40, %rax
	movq %rax, %rdi
	call _malloc
	movq %rax, %rax
	movq %rax, 8(%rsp)
	movq $4, %rbx
	movq %rbx, 0(%rax)
	movq $5, %rbx
	movq %rbx, 8(%rax)
	movq $5, %rbx
	movq %rbx, 16(%rax)
	movq $5, %rbx
	movq %rbx, 24(%rax)
	movq $5, %rbx
	movq %rbx, 32(%rax)
	call wl_f
	addq $16, %rsp
	movq -16(%rsp), %rax
	movq $4, %rbx
	cmpq %rax, %rbx
	jnz label32
	movq $1, %rax
	jmp label33
label32:
	movq $0, %rax
label33:
	movq %rax, %rdi
	call _assertion
label23:
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
