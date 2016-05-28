
	.text
wl_main:
	pushq %rbp
	movq %rsp, %rbp
	subq $16, %rsp
	movq $1, %rax
	movq %rax, -16(%rbp)
	movq $0, %rax
	movq %rax, -8(%rbp)
	subq $16, %rsp
	movq -16(%rbp), %rax
	movq %rax, 0(%rsp)
	movq -8(%rbp), %rax
	movq %rax, 8(%rsp)
	movq 0(%rsp), %rax
	addq $16, %rsp
	movq $1, %rbx
	cmpq %rax, %rbx
	jnz label76
	movq $1, %rax
	jmp label77
label76:
	movq $0, %rax
label77:
	movq %rax, %rdi
	call _assertion
	subq $16, %rsp
	movq -16(%rbp), %rax
	movq %rax, 0(%rsp)
	movq -8(%rbp), %rax
	movq %rax, 8(%rsp)
	movq 8(%rsp), %rax
	addq $16, %rsp
	movq $0, %rbx
	cmpq %rax, %rbx
	jnz label78
	movq $1, %rax
	jmp label79
label78:
	movq $0, %rax
label79:
	movq %rax, %rdi
	call _assertion
	subq $32, %rsp
	movq -16(%rbp), %rax
	movq %rax, 0(%rsp)
	movq -8(%rbp), %rax
	movq %rax, 8(%rsp)
	movq $1, %rax
	movq %rax, 16(%rsp)
	movq $0, %rax
	movq %rax, 24(%rsp)
	movq 0(%rsp), %rax
	movq 16(%rsp), %rbx
	cmpq %rbx, %rax
	jnz label80
	movq 8(%rsp), %rax
	movq 24(%rsp), %rbx
	cmpq %rbx, %rax
	jnz label80
	addq $32, %rsp
	movq $1, %rax
	jmp label81
label80:
	movq $0, %rax
label81:
	movq %rax, %rdi
	call _assertion
	subq $16, %rsp
	movq -16(%rbp), %rax
	movq %rax, 0(%rsp)
	movq -8(%rbp), %rax
	movq %rax, 8(%rsp)
	movq 0(%rsp), %rax
	addq $16, %rsp
	movq $0, %rbx
	cmpq %rax, %rbx
	jnz label82
	movq $1, %rax
	jmp label83
label82:
	movq $0, %rax
label83:
	movq %rax, %rdi
	call _assertion
	subq $16, %rsp
	movq -16(%rbp), %rax
	movq %rax, 0(%rsp)
	movq -8(%rbp), %rax
	movq %rax, 8(%rsp)
	movq 8(%rsp), %rax
	addq $16, %rsp
	movq $0, %rbx
	cmpq %rax, %rbx
	jnz label84
	movq $1, %rax
	jmp label85
label84:
	movq $0, %rax
label85:
	movq %rax, %rdi
	call _assertion
	subq $32, %rsp
	movq -16(%rbp), %rax
	movq %rax, 0(%rsp)
	movq -8(%rbp), %rax
	movq %rax, 8(%rsp)
	movq $0, %rax
	movq %rax, 16(%rsp)
	movq $0, %rax
	movq %rax, 24(%rsp)
	movq 0(%rsp), %rax
	movq 16(%rsp), %rbx
	cmpq %rbx, %rax
	jnz label86
	movq 8(%rsp), %rax
	movq 24(%rsp), %rbx
	cmpq %rbx, %rax
	jnz label86
	addq $32, %rsp
	movq $1, %rax
	jmp label87
label86:
	movq $0, %rax
label87:
	movq %rax, %rdi
	call _assertion
label75:
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
