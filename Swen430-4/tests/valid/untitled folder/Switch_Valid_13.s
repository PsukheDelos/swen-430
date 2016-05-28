
	.text
wl_f:
	pushq %rbp
	movq %rsp, %rbp
	movq 32(%rbp), %rax
	movq $0, %rbx
	cmpq %rax, %rbx
	jnz label570
label568:
	movq 24(%rbp), %rbx
	movq $0, %rcx
	cmpq %rbx, %rcx
	jnz label574
label572:
	jmp label571
	jmp label573
label574:
	movq $1, %rcx
	cmpq %rbx, %rcx
	jnz label576
label573:
	leaq str0(%rip), %rcx
	movq %rcx, 16(%rbp)
	jmp label566
	jmp label575
label576:
	movq $2, %rcx
	cmpq %rbx, %rcx
	jnz label578
label575:
	leaq str1(%rip), %rcx
	movq %rcx, 16(%rbp)
	jmp label566
	jmp label577
label578:
label571:
	leaq str2(%rip), %rbx
	movq %rbx, 16(%rbp)
	jmp label566
	jmp label569
label570:
	movq $1, %rbx
	cmpq %rax, %rbx
	jnz label581
label569:
	leaq str3(%rip), %rbx
	movq %rbx, 16(%rbp)
	jmp label566
	jmp label580
label581:
	movq $2, %rbx
	cmpq %rax, %rbx
	jnz label583
label580:
	leaq str4(%rip), %rbx
	movq %rbx, 16(%rbp)
	jmp label566
	jmp label582
label583:
label567:
	leaq str5(%rip), %rax
	movq %rax, 16(%rbp)
	jmp label566
label566:
	movq %rbp, %rsp
	popq %rbp
	ret
wl_main:
	pushq %rbp
	movq %rsp, %rbp
	subq $32, %rsp
	movq $0, %rax
	movq %rax, -8(%rbp)
	movq $1, %rax
	movq %rax, -16(%rbp)
	movq $2, %rax
	movq %rax, -24(%rbp)
	leaq str2(%rip), %rax
	subq $16, %rsp
	movq %rax, 0(%rsp)
	subq $32, %rsp
	movq -8(%rbp), %rbx
	movq %rbx, 8(%rsp)
	movq -8(%rbp), %rbx
	movq %rbx, 16(%rsp)
	call wl_f
	addq $32, %rsp
	movq 0(%rsp), %rax
	addq $16, %rsp
	movq -48(%rsp), %rbx
	cmpq %rax, %rbx
	jnz label586
	movq $1, %rax
	jmp label587
label586:
	movq $0, %rax
label587:
	movq %rax, %rdi
	call _assertion
	leaq str0(%rip), %rax
	subq $16, %rsp
	movq %rax, 0(%rsp)
	subq $32, %rsp
	movq -16(%rbp), %rbx
	movq %rbx, 8(%rsp)
	movq -8(%rbp), %rbx
	movq %rbx, 16(%rsp)
	call wl_f
	addq $32, %rsp
	movq 0(%rsp), %rax
	addq $16, %rsp
	movq -48(%rsp), %rbx
	cmpq %rax, %rbx
	jnz label588
	movq $1, %rax
	jmp label589
label588:
	movq $0, %rax
label589:
	movq %rax, %rdi
	call _assertion
	leaq str1(%rip), %rax
	subq $16, %rsp
	movq %rax, 0(%rsp)
	subq $32, %rsp
	movq -24(%rbp), %rbx
	movq %rbx, 8(%rsp)
	movq -8(%rbp), %rbx
	movq %rbx, 16(%rsp)
	call wl_f
	addq $32, %rsp
	movq 0(%rsp), %rax
	addq $16, %rsp
	movq -48(%rsp), %rbx
	cmpq %rax, %rbx
	jnz label590
	movq $1, %rax
	jmp label591
label590:
	movq $0, %rax
label591:
	movq %rax, %rdi
	call _assertion
	leaq str3(%rip), %rax
	subq $16, %rsp
	movq %rax, 0(%rsp)
	subq $32, %rsp
	movq -8(%rbp), %rbx
	movq %rbx, 8(%rsp)
	movq -16(%rbp), %rbx
	movq %rbx, 16(%rsp)
	call wl_f
	addq $32, %rsp
	movq 0(%rsp), %rax
	addq $16, %rsp
	movq -48(%rsp), %rbx
	cmpq %rax, %rbx
	jnz label592
	movq $1, %rax
	jmp label593
label592:
	movq $0, %rax
label593:
	movq %rax, %rdi
	call _assertion
	leaq str4(%rip), %rax
	subq $16, %rsp
	movq %rax, 0(%rsp)
	subq $32, %rsp
	movq -8(%rbp), %rbx
	movq %rbx, 8(%rsp)
	movq -24(%rbp), %rbx
	movq %rbx, 16(%rsp)
	call wl_f
	addq $32, %rsp
	movq 0(%rsp), %rax
	addq $16, %rsp
	movq -48(%rsp), %rbx
	cmpq %rax, %rbx
	jnz label594
	movq $1, %rax
	jmp label595
label594:
	movq $0, %rax
label595:
	movq %rax, %rdi
	call _assertion
label585:
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
	.asciz "RED BLUE"
str1:
	.asciz "RED GREEN"
str2:
	.asciz "RED RED"
str3:
	.asciz "BLUE ???"
str4:
	.asciz "GREEN ???"
str5:
	.asciz ""
