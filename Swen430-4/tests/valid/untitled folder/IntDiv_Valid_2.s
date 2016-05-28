
	.text
wl_f:
	pushq %rbp
	movq %rsp, %rbp
	movq 32(%rbp), %rax
	movq 24(%rbp), %rbx
	movq %rax, %rax
	cqto
	idivq %rbx
	movq %rax, %rax
	movq %rax, 16(%rbp)
	jmp label321
label321:
	movq %rbp, %rsp
	popq %rbp
	ret
wl_main:
	pushq %rbp
	movq %rsp, %rbp
	subq $32, %rsp
	movq $2, %rax
	movq %rax, 8(%rsp)
	movq $10, %rax
	movq %rax, 16(%rsp)
	call wl_f
	addq $32, %rsp
	movq -32(%rsp), %rax
	movq $5, %rbx
	cmpq %rax, %rbx
	jnz label323
	movq $1, %rax
	jmp label324
label323:
	movq $0, %rax
label324:
	movq %rax, %rdi
	call _assertion
	subq $32, %rsp
	movq $3, %rax
	movq %rax, 8(%rsp)
	movq $10, %rax
	movq %rax, 16(%rsp)
	call wl_f
	addq $32, %rsp
	movq -32(%rsp), %rax
	movq $3, %rbx
	cmpq %rax, %rbx
	jnz label325
	movq $1, %rax
	jmp label326
label325:
	movq $0, %rax
label326:
	movq %rax, %rdi
	call _assertion
	subq $32, %rsp
	movq $3, %rax
	movq %rax, 8(%rsp)
	movq $-10, %rax
	movq %rax, 16(%rsp)
	call wl_f
	addq $32, %rsp
	movq -32(%rsp), %rax
	movq $-3, %rbx
	cmpq %rax, %rbx
	jnz label327
	movq $1, %rax
	jmp label328
label327:
	movq $0, %rax
label328:
	movq %rax, %rdi
	call _assertion
	subq $32, %rsp
	movq $4, %rax
	movq %rax, 8(%rsp)
	movq $1, %rax
	movq %rax, 16(%rsp)
	call wl_f
	addq $32, %rsp
	movq -32(%rsp), %rax
	movq $0, %rbx
	cmpq %rax, %rbx
	jnz label329
	movq $1, %rax
	jmp label330
label329:
	movq $0, %rax
label330:
	movq %rax, %rdi
	call _assertion
label322:
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
