
	.text
wl_f:
	pushq %rbp
	movq %rsp, %rbp
	subq $16, %rsp
	movq 32(%rbp), %rax
	movq 24(%rbp), %rbx
	cmpq %rax, %rbx
	jnz label125
	movq $1, %rax
	jmp label126
label125:
	movq $0, %rax
label126:
	movq %rax, -8(%rbp)
	movq -8(%rbp), %rax
	cmpq $0, %rax
	jz label128
	movq $1, %rax
	movq %rax, 16(%rbp)
	jmp label124
	jmp label127
label128:
	movq 32(%rbp), %rax
	movq 24(%rbp), %rbx
	addq %rbx, %rax
	movq %rax, 16(%rbp)
	jmp label124
label127:
label124:
	movq %rbp, %rsp
	popq %rbp
	ret
wl_g:
	pushq %rbp
	movq %rsp, %rbp
	subq $16, %rsp
	movq 32(%rbp), %rax
	movq 24(%rbp), %rbx
	cmpq %rbx, %rax
	jl label130
	movq $1, %rax
	jmp label131
label130:
	movq $0, %rax
label131:
	movq %rax, -8(%rbp)
	movq -8(%rbp), %rax
	cmpq $0, %rax
	jz label134
	jmp label133
label134:
	movq 32(%rbp), %rax
	movq 24(%rbp), %rbx
	addq %rbx, %rax
	movq %rax, 16(%rbp)
	jmp label129
	jmp label132
label133:
	movq $1, %rax
	movq %rax, 16(%rbp)
	jmp label129
label132:
label129:
	movq %rbp, %rsp
	popq %rbp
	ret
wl_main:
	pushq %rbp
	movq %rsp, %rbp
	movq $1, %rax
	movq $1, %rbx
	cmpq %rax, %rbx
	jnz label136
	movq $1, %rax
	jmp label137
label136:
	movq $0, %rax
label137:
	movq %rax, %rdi
	call _assertion
	movq $1, %rax
	movq $1, %rbx
	cmpq %rax, %rbx
	jnz label138
	movq $1, %rax
	jmp label139
label138:
	movq $0, %rax
label139:
	movq %rax, %rdi
	call _assertion
	movq $1, %rax
	movq $1, %rbx
	cmpq %rax, %rbx
	jnz label140
	movq $1, %rax
	jmp label141
label140:
	movq $0, %rax
label141:
	movq %rax, %rdi
	call _assertion
	movq $1, %rax
	movq $1, %rbx
	cmpq %rax, %rbx
	jnz label142
	movq $1, %rax
	jmp label143
label142:
	movq $0, %rax
label143:
	movq %rax, %rdi
	call _assertion
	movq $1, %rax
	movq $1, %rbx
	cmpq %rax, %rbx
	jnz label144
	movq $1, %rax
	jmp label145
label144:
	movq $0, %rax
label145:
	movq %rax, %rdi
	call _assertion
	movq $1, %rax
	movq $1, %rbx
	cmpq %rax, %rbx
	jnz label146
	movq $1, %rax
	jmp label147
label146:
	movq $0, %rax
label147:
	movq %rax, %rdi
	call _assertion
label135:
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
