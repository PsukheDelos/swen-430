
	.text
wl_f:
	pushq %rbp
	movq %rsp, %rbp
	movq 24(%rbp), %rax
	leaq str0(%rip), %rbx
	cmpq %rax, %rbx
	jnz label521
label519:
	movq $0, %rbx
	movq %rbx, 16(%rbp)
	jmp label517
	jmp label520
label521:
	leaq str1(%rip), %rbx
	cmpq %rax, %rbx
	jnz label523
label520:
	movq $1, %rbx
	movq %rbx, 16(%rbp)
	jmp label517
	jmp label522
label523:
	leaq str2(%rip), %rbx
	cmpq %rax, %rbx
	jnz label525
label522:
	movq $2, %rbx
	movq %rbx, 16(%rbp)
	jmp label517
	jmp label524
label525:
label518:
	movq $-1, %rax
	movq %rax, 16(%rbp)
	jmp label517
label517:
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
	jnz label528
	movq $1, %rax
	jmp label529
label528:
	movq $0, %rax
label529:
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
	jnz label530
	movq $1, %rax
	jmp label531
label530:
	movq $0, %rax
label531:
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
	jnz label532
	movq $1, %rax
	jmp label533
label532:
	movq $0, %rax
label533:
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
	jnz label534
	movq $1, %rax
	jmp label535
label534:
	movq $0, %rax
label535:
	movq %rax, %rdi
	call _assertion
label527:
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
