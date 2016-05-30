
	.text
wl_sum1:
	pushq %rbp
	movq %rsp, %rbp
	subq $16, %rsp
	movq 24(%rbp), %rax
	movq %rax, 0(%rsp)
	movq 32(%rbp), %rax
	movq %rax, 8(%rsp)
	movq %rsp, %rax
	addq $16, %rsp
	movq 0(%rax), %rax
	subq $16, %rsp
	movq 24(%rbp), %rbx
	movq %rbx, 0(%rsp)
	movq 32(%rbp), %rbx
	movq %rbx, 8(%rsp)
	movq %rsp, %rbx
	addq $16, %rsp
	movq 8(%rbx), %rbx
	addq %rbx, %rax
	movq %rax, 16(%rbp)
	jmp label468
label468:
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
	movq %rsp, %rax
	addq $16, %rsp
	movq 0(%rax), %rax
	cmpq $0, %rax
	jz label470
	subq $16, %rsp
	movq 24(%rbp), %rax
	movq %rax, 0(%rsp)
	movq 32(%rbp), %rax
	movq %rax, 8(%rsp)
	movq %rsp, %rax
	addq $16, %rsp
	movq 8(%rax), %rax
	cmpq $0, %rax
	jz label470
	movq $1, %rax
	jmp label471
label470:
	movq $0, %rax
label471:
	movq %rax, 16(%rbp)
	jmp label469
label469:
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
	jnz label473
	movq $1, %rax
	jmp label474
label473:
	movq $0, %rax
label474:
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
	jnz label475
	movq $1, %rax
	jmp label476
label475:
	movq $0, %rax
label476:
	movq %rax, %rdi
	call _assertion
label472:
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
