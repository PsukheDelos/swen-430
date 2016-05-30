
	.text
wl_f:
	pushq %rbp
	movq %rsp, %rbp
	movq $2, %rax
	movq %rax, 16(%rbp)
	movq $3, %rax
	movq %rax, 24(%rbp)
	jmp label477
label477:
	movq %rbp, %rsp
	popq %rbp
	ret
wl_main:
	pushq %rbp
	movq %rsp, %rbp
	subq $16, %rsp
	subq $16, %rsp
	call wl_f
	addq $16, %rsp
	movq -16(%rsp), %rax
	movq %rax, -16(%rbp)
	movq -8(%rsp), %rax
	movq %rax, -8(%rbp)
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
	jnz label479
	movq 8(%rsp), %rax
	movq 24(%rsp), %rbx
	cmpq %rbx, %rax
	jnz label479
	addq $32, %rsp
	movq $1, %rax
	jmp label480
label479:
	movq $0, %rax
label480:
	movq %rax, %rdi
	call _assertion
	subq $16, %rsp
	movq -16(%rbp), %rax
	movq %rax, 0(%rsp)
	movq -8(%rbp), %rax
	movq %rax, 8(%rsp)
	movq %rsp, %rax
	addq $16, %rsp
	movq 8(%rax), %rax
	movq $2, %rbx
	subq %rbx, %rax
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
	jnz label481
	movq 8(%rsp), %rax
	movq 24(%rsp), %rbx
	cmpq %rbx, %rax
	jnz label481
	addq $32, %rsp
	movq $1, %rax
	jmp label482
label481:
	movq $0, %rax
label482:
	movq %rax, %rdi
	call _assertion
label478:
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
