
	.text
wl_f:
	pushq %rbp
	movq %rsp, %rbp
	subq $16, %rsp
	movq 24(%rbp), %rax
	movq %rax, -16(%rbp)
label124:
	movq -16(%rbp), %rax
	movq $0, %rbx
	cmpq %rbx, %rax
	jl label125
	movq 24(%rbp), %rax
	movq $0, %rbx
	cmpq %rbx, %rax
	jge label128
	movq $0, %rax
	movq %rax, 16(%rbp)
	jmp label123
	jmp label127
label128:
	movq 24(%rbp), %rax
	movq %rax, -8(%rbp)
label127:
	movq -8(%rbp), %rax
	movq %rax, 16(%rbp)
	jmp label123
label126:
	movq -16(%rbp), %rax
	movq $1, %rbx
	subq %rbx, %rax
	movq %rax, -16(%rbp)
	jmp label124
label125:
	movq $0, %rax
	movq %rax, 16(%rbp)
	jmp label123
label123:
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
	jnz label130
	movq $1, %rax
	jmp label131
label130:
	movq $0, %rax
label131:
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
	jnz label132
	movq $1, %rax
	jmp label133
label132:
	movq $0, %rax
label133:
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
	jnz label134
	movq $1, %rax
	jmp label135
label134:
	movq $0, %rax
label135:
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
	jnz label136
	movq $1, %rax
	jmp label137
label136:
	movq $0, %rax
label137:
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
	jnz label138
	movq $1, %rax
	jmp label139
label138:
	movq $0, %rax
label139:
	movq %rax, %rdi
	call _assertion
label129:
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
