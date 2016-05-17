
	.text
wl_f:
	pushq %rbp
	movq %rsp, %rbp
	movq 24(%rbp), %rax
	movq $10, %rbx
	cmpq %rbx, %rax
	jge label142
	leaq str0(%rip), %rax
	movq %rax, 16(%rbp)
	jmp label140
	jmp label141
label142:
	movq 24(%rbp), %rax
	movq $10, %rbx
	cmpq %rbx, %rax
	jle label144
	leaq str1(%rip), %rax
	movq %rax, 16(%rbp)
	jmp label140
	jmp label143
label144:
	leaq str2(%rip), %rax
	movq %rax, 16(%rbp)
	jmp label140
label143:
label141:
label140:
	movq %rbp, %rsp
	popq %rbp
	ret
wl_main:
	pushq %rbp
	movq %rsp, %rbp
	leaq str0(%rip), %rax
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
	jnz label146
	movq $1, %rax
	jmp label147
label146:
	movq $0, %rax
label147:
	movq %rax, %rdi
	call _assertion
	leaq str2(%rip), %rax
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
	jnz label148
	movq $1, %rax
	jmp label149
label148:
	movq $0, %rax
label149:
	movq %rax, %rdi
	call _assertion
	leaq str1(%rip), %rax
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
	jnz label150
	movq $1, %rax
	jmp label151
label150:
	movq $0, %rax
label151:
	movq %rax, %rdi
	call _assertion
	leaq str1(%rip), %rax
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
	jnz label152
	movq $1, %rax
	jmp label153
label152:
	movq $0, %rax
label153:
	movq %rax, %rdi
	call _assertion
	leaq str0(%rip), %rax
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
	jnz label154
	movq $1, %rax
	jmp label155
label154:
	movq $0, %rax
label155:
	movq %rax, %rdi
	call _assertion
label145:
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
str0:
	.asciz "LESS THAN"
str1:
	.asciz "GREATER THAN"
str2:
	.asciz "EQUALS"
