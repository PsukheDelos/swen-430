
	.text
wl_f:
	pushq %rbp
	movq %rsp, %rbp
	movq 32(%rbp), %rax
	movq %rax, 16(%rbp)
	movq $2, %rax
	movq %rax, 24(%rbp)
	jmp label370
label370:
	movq %rbp, %rsp
	popq %rbp
	ret
wl_main:
	pushq %rbp
	movq %rsp, %rbp
	subq $32, %rsp
	movq $1, %rax
	movq %rax, -24(%rbp)
	subq $32, %rsp
	movq -24(%rbp), %rax
	movq %rax, 16(%rsp)
	call wl_f
	addq $32, %rsp
	movq -32(%rsp), %rax
	movq %rax, -16(%rbp)
	movq -24(%rsp), %rax
	movq %rax, -8(%rbp)
	subq $32, %rsp
	movq -16(%rbp), %rax
	movq %rax, 0(%rsp)
	movq -8(%rbp), %rax
	movq %rax, 8(%rsp)
	movq $1, %rax
	movq %rax, 16(%rsp)
	movq $2, %rax
	movq %rax, 24(%rsp)
	movq 0(%rsp), %rax
	movq 16(%rsp), %rbx
	cmpq %rbx, %rax
	jnz label372
	movq 8(%rsp), %rax
	movq 24(%rsp), %rbx
	cmpq %rbx, %rax
	jnz label372
	addq $32, %rsp
	movq $1, %rax
	jmp label373
label372:
	movq $0, %rax
label373:
	movq %rax, %rdi
	call _assertion
	movq -24(%rbp), %rax
	movq %rax, -16(%rbp)
	movq -24(%rbp), %rax
	movq %rax, -8(%rbp)
	subq $32, %rsp
	movq -16(%rbp), %rax
	movq %rax, 0(%rsp)
	movq -8(%rbp), %rax
	movq %rax, 8(%rsp)
	movq $1, %rax
	movq %rax, 16(%rsp)
	movq $1, %rax
	movq %rax, 24(%rsp)
	movq 0(%rsp), %rax
	movq 16(%rsp), %rbx
	cmpq %rbx, %rax
	jnz label374
	movq 8(%rsp), %rax
	movq 24(%rsp), %rbx
	cmpq %rbx, %rax
	jnz label374
	addq $32, %rsp
	movq $1, %rax
	jmp label375
label374:
	movq $0, %rax
label375:
	movq %rax, %rdi
	call _assertion
label371:
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
