
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
	jge label149
	movq $0, %rax
	movq %rax, -8(%rbp)
	jmp label149
label149:
	movq -8(%rbp), %rax
	cmpq $0, %rax
	jz label152
	jmp label151
label152:
	movq 32(%rbp), %rax
	movq 24(%rbp), %rbx
	addq %rbx, %rax
	movq %rax, 16(%rbp)
	jmp label148
	jmp label150
label151:
	movq $123, %rax
	movq %rax, 16(%rbp)
	jmp label148
label150:
label148:
	movq %rbp, %rsp
	popq %rbp
	ret
wl_main:
	pushq %rbp
	movq %rsp, %rbp
	movq $1, %rax
	movq $1, %rbx
	cmpq %rax, %rbx
	jnz label154
	movq $1, %rax
	jmp label155
label154:
	movq $0, %rax
label155:
	movq %rax, %rdi
	call _assertion
	movq $1, %rax
	movq $1, %rbx
	cmpq %rax, %rbx
	jnz label156
	movq $1, %rax
	jmp label157
label156:
	movq $0, %rax
label157:
	movq %rax, %rdi
	call _assertion
	movq $1, %rax
	movq $1, %rbx
	cmpq %rax, %rbx
	jnz label158
	movq $1, %rax
	jmp label159
label158:
	movq $0, %rax
label159:
	movq %rax, %rdi
	call _assertion
label153:
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
