
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
	jmp label293
label293:
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
	jnz label295
	movq $1, %rax
	jmp label296
label295:
	movq $0, %rax
label296:
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
	jnz label297
	movq $1, %rax
	jmp label298
label297:
	movq $0, %rax
label298:
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
	jnz label299
	movq $1, %rax
	jmp label300
label299:
	movq $0, %rax
label300:
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
	jnz label301
	movq $1, %rax
	jmp label302
label301:
	movq $0, %rax
label302:
	movq %rax, %rdi
	call _assertion
label294:
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
