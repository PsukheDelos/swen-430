
	.text
wl_main:
	pushq %rbp
	movq %rsp, %rbp
	subq $32, %rsp
	movq $2, %rax
	movq %rax, -16(%rbp)
	movq $3, %rax
	movq %rax, -8(%rbp)
	movq $1, %rax
	movq %rax, -32(%rbp)
	movq $3, %rax
	movq %rax, -24(%rbp)
	subq $32, %rsp
	movq -16(%rbp), %rax
	movq %rax, 0(%rsp)
	movq -8(%rbp), %rax
	movq %rax, 8(%rsp)
	movq $2, %rax
	movq %rax, 16(%rsp)
	movq $3, %rax
	movq %rax, 24(%rsp)
	movq 0(%rsp), %rax
	movq 16(%rsp), %rbx
	cmpq %rbx, %rax
	jnz label9
	movq 8(%rsp), %rax
	movq 24(%rsp), %rbx
	cmpq %rbx, %rax
	jnz label9
	addq $32, %rsp
	movq $1, %rax
	jmp label10
label9:
	movq $0, %rax
label10:
	movq %rax, %rdi
	call _assertion
	subq $32, %rsp
	movq -32(%rbp), %rax
	movq %rax, 0(%rsp)
	movq -24(%rbp), %rax
	movq %rax, 8(%rsp)
	movq $1, %rax
	movq %rax, 16(%rsp)
	movq $3, %rax
	movq %rax, 24(%rsp)
	movq 0(%rsp), %rax
	movq 16(%rsp), %rbx
	cmpq %rbx, %rax
	jnz label11
	movq 8(%rsp), %rax
	movq 24(%rsp), %rbx
	cmpq %rbx, %rax
	jnz label11
	addq $32, %rsp
	movq $1, %rax
	jmp label12
label11:
	movq $0, %rax
label12:
	movq %rax, %rdi
	call _assertion
	subq $32, %rsp
	movq -16(%rbp), %rax
	movq %rax, 0(%rsp)
	movq -8(%rbp), %rax
	movq %rax, 8(%rsp)
	movq -32(%rbp), %rax
	movq %rax, 16(%rsp)
	movq -24(%rbp), %rax
	movq %rax, 24(%rsp)
	movq 0(%rsp), %rax
	movq 16(%rsp), %rbx
	cmpq %rbx, %rax
	jnz label15
	movq 8(%rsp), %rax
	movq 24(%rsp), %rbx
	cmpq %rbx, %rax
	jnz label15
	jmp label13
label15:
	addq $32, %rsp
	movq $1, %rax
	jmp label14
label13:
	movq $0, %rax
label14:
	movq %rax, %rdi
	call _assertion
	movq $1, %rax
	movq %rax, -16(%rbp)
	subq $32, %rsp
	movq -16(%rbp), %rax
	movq %rax, 0(%rsp)
	movq -8(%rbp), %rax
	movq %rax, 8(%rsp)
	movq $1, %rax
	movq %rax, 16(%rsp)
	movq $3, %rax
	movq %rax, 24(%rsp)
	movq 0(%rsp), %rax
	movq 16(%rsp), %rbx
	cmpq %rbx, %rax
	jnz label16
	movq 8(%rsp), %rax
	movq 24(%rsp), %rbx
	cmpq %rbx, %rax
	jnz label16
	addq $32, %rsp
	movq $1, %rax
	jmp label17
label16:
	movq $0, %rax
label17:
	movq %rax, %rdi
	call _assertion
	subq $32, %rsp
	movq -16(%rbp), %rax
	movq %rax, 0(%rsp)
	movq -8(%rbp), %rax
	movq %rax, 8(%rsp)
	movq -32(%rbp), %rax
	movq %rax, 16(%rsp)
	movq -24(%rbp), %rax
	movq %rax, 24(%rsp)
	movq 0(%rsp), %rax
	movq 16(%rsp), %rbx
	cmpq %rbx, %rax
	jnz label18
	movq 8(%rsp), %rax
	movq 24(%rsp), %rbx
	cmpq %rbx, %rax
	jnz label18
	addq $32, %rsp
	movq $1, %rax
	jmp label19
label18:
	movq $0, %rax
label19:
	movq %rax, %rdi
	call _assertion
label8:
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
