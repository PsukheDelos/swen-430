
	.text
wl_f:
	pushq %rbp
	movq %rsp, %rbp
	subq $16, %rsp
	movq $1, %rax
	movq %rax, -8(%rbp)
	movq 32(%rbp), %rax
	movq 24(%rbp), %rbx
	cmpq %rbx, %rax
	jge label147
	movq $0, %rax
	movq %rax, -8(%rbp)
	jmp label147
label147:
	movq -8(%rbp), %rax
	cmpq $0, %rax
	jz label150
	jmp label149
label150:
	movq 32(%rbp), %rax
	movq 24(%rbp), %rbx
	addq %rbx, %rax
	movq %rax, 16(%rbp)
	jmp label146
	jmp label148
label149:
	movq $123, %rax
	movq %rax, 16(%rbp)
	jmp label146
label148:
label146:
	movq %rbp, %rsp
	popq %rbp
	ret
wl_main:
	pushq %rbp
	movq %rsp, %rbp
	subq $32, %rsp
	movq $1, %rax
	movq %rax, 8(%rsp)
	movq $1, %rax
	movq %rax, 16(%rsp)
	call wl_f
	addq $32, %rsp
	movq -32(%rsp), %rax
	movq $123, %rbx
	cmpq %rax, %rbx
	jnz label152
	movq $1, %rax
	jmp label153
label152:
	movq $0, %rax
label153:
	movq %rax, %rdi
	call _assertion
	subq $32, %rsp
	movq $11, %rax
	movq %rax, 8(%rsp)
	movq $0, %rax
	movq %rax, 16(%rsp)
	call wl_f
	addq $32, %rsp
	movq -32(%rsp), %rax
	movq $11, %rbx
	cmpq %rax, %rbx
	jnz label154
	movq $1, %rax
	jmp label155
label154:
	movq $0, %rax
label155:
	movq %rax, %rdi
	call _assertion
	subq $32, %rsp
	movq $0, %rax
	movq %rax, 8(%rsp)
	movq $11, %rax
	movq %rax, 16(%rsp)
	call wl_f
	addq $32, %rsp
	movq -32(%rsp), %rax
	movq $123, %rbx
	cmpq %rax, %rbx
	jnz label156
	movq $1, %rax
	jmp label157
label156:
	movq $0, %rax
label157:
	movq %rax, %rdi
	call _assertion
label151:
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
