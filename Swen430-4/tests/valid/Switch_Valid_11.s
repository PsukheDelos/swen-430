
	.text
wl_f:
	pushq %rbp
	movq %rsp, %rbp
	movq 24(%rbp), %rax
	leaq str0(%rip), %rbx
	cmpq %rax, %rbx
	jnz label511
label509:
	movq $0, %rbx
	movq %rbx, 16(%rbp)
	jmp label507
	jmp label510
label511:
	leaq str1(%rip), %rbx
	cmpq %rax, %rbx
	jnz label513
label510:
	movq $1, %rbx
	movq %rbx, 16(%rbp)
	jmp label507
	jmp label512
label513:
	leaq str2(%rip), %rbx
	cmpq %rax, %rbx
	jnz label515
label512:
	movq $2, %rbx
	movq %rbx, 16(%rbp)
	jmp label507
	jmp label514
label515:
label508:
	movq $-1, %rax
	movq %rax, 16(%rbp)
	jmp label507
label507:
	movq %rbp, %rsp
	popq %rbp
	ret
wl_main:
	pushq %rbp
	movq %rsp, %rbp
	movq $0, %rax
	subq $16, %rsp
	movq %rax, 0(%rsp)
	subq $16, %rsp
	leaq str0(%rip), %rbx
	movq %rbx, 8(%rsp)
	call wl_f
	addq $16, %rsp
	movq 0(%rsp), %rax
	addq $16, %rsp
	movq -32(%rsp), %rbx
	cmpq %rax, %rbx
	jnz label518
	movq $1, %rax
	jmp label519
label518:
	movq $0, %rax
label519:
	movq %rax, %rdi
	call _assertion
	movq $1, %rax
	subq $16, %rsp
	movq %rax, 0(%rsp)
	subq $16, %rsp
	leaq str1(%rip), %rbx
	movq %rbx, 8(%rsp)
	call wl_f
	addq $16, %rsp
	movq 0(%rsp), %rax
	addq $16, %rsp
	movq -32(%rsp), %rbx
	cmpq %rax, %rbx
	jnz label520
	movq $1, %rax
	jmp label521
label520:
	movq $0, %rax
label521:
	movq %rax, %rdi
	call _assertion
	movq $2, %rax
	subq $16, %rsp
	movq %rax, 0(%rsp)
	subq $16, %rsp
	leaq str2(%rip), %rbx
	movq %rbx, 8(%rsp)
	call wl_f
	addq $16, %rsp
	movq 0(%rsp), %rax
	addq $16, %rsp
	movq -32(%rsp), %rbx
	cmpq %rax, %rbx
	jnz label522
	movq $1, %rax
	jmp label523
label522:
	movq $0, %rax
label523:
	movq %rax, %rdi
	call _assertion
	movq $-1, %rax
	subq $16, %rsp
	movq %rax, 0(%rsp)
	subq $16, %rsp
	leaq str3(%rip), %rbx
	movq %rbx, 8(%rsp)
	call wl_f
	addq $16, %rsp
	movq 0(%rsp), %rax
	addq $16, %rsp
	movq -32(%rsp), %rbx
	cmpq %rax, %rbx
	jnz label524
	movq $1, %rax
	jmp label525
label524:
	movq $0, %rax
label525:
	movq %rax, %rdi
	call _assertion
label517:
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
	.asciz "Red"
str1:
	.asciz "Blue"
str2:
	.asciz "Green"
str3:
	.asciz "Dave"
