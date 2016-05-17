
	.text
wl_sum1:
	pushq %rbp
	movq %rsp, %rbp
	subq $16, %rsp
	movq 24(%rbp), %rax
	movq %rax, 0(%rsp)
	movq 32(%rbp), %rax
	movq %rax, 8(%rsp)
	movq 0(%rsp), %rax
	addq $16, %rsp
	subq $16, %rsp
	movq 24(%rbp), %rbx
	movq %rbx, 0(%rsp)
	movq 32(%rbp), %rbx
	movq %rbx, 8(%rsp)
	movq 8(%rsp), %rbx
	addq $16, %rsp
	addq %rbx, %rax
	movq %rax, 16(%rbp)
	jmp label341
label341:
	movq %rbp, %rsp
	popq %rbp
	ret
wl_sum2:
	pushq %rbp
	movq %rsp, %rbp
	subq $16, %rsp
	movq 24(%rbp), %rax
	movq %rax, 0(%rsp)
	movq 32(%rbp), %rax
	movq %rax, 8(%rsp)
	movq 0(%rsp), %rax
	addq $16, %rsp
	cmpq $0, %rax
	jz label343
	subq $16, %rsp
	movq 24(%rbp), %rax
	movq %rax, 0(%rsp)
	movq 32(%rbp), %rax
	movq %rax, 8(%rsp)
	movq 8(%rsp), %rax
	addq $16, %rsp
	cmpq $0, %rax
	jz label343
	movq $1, %rax
	jmp label344
label343:
	movq $0, %rax
label344:
	movq %rax, 16(%rbp)
	jmp label342
label342:
	movq %rbp, %rsp
	popq %rbp
	ret
wl_main:
	pushq %rbp
	movq %rsp, %rbp
	subq $32, %rsp
	movq $1, %rax
	movq %rax, -16(%rbp)
	movq $2, %rax
	movq %rax, -8(%rbp)
	subq $32, %rsp
	movq -16(%rbp), %rax
	movq %rax, 8(%rsp)
	movq -8(%rbp), %rax
	movq %rax, 16(%rsp)
	call wl_sum1
	addq $32, %rsp
	movq -32(%rsp), %rax
	movq $3, %rbx
	cmpq %rax, %rbx
	jnz label346
	movq $1, %rax
	jmp label347
label346:
	movq $0, %rax
label347:
	movq %rax, %rdi
	call _assertion
	movq $1, %rax
	movq %rax, -32(%rbp)
	movq $0, %rax
	movq %rax, -24(%rbp)
	subq $32, %rsp
	movq -32(%rbp), %rax
	movq %rax, 8(%rsp)
	movq -24(%rbp), %rax
	movq %rax, 16(%rsp)
	call wl_sum2
	addq $32, %rsp
	movq -32(%rsp), %rax
	movq $0, %rbx
	cmpq %rax, %rbx
	jnz label348
	movq $1, %rax
	jmp label349
label348:
	movq $0, %rax
label349:
	movq %rax, %rdi
	call _assertion
label345:
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
