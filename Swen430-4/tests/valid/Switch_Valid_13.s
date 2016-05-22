
	.text
wl_f:
	pushq %rbp
	movq %rsp, %rbp
	movq 32(%rbp), %rax
	movq $0, %rbx
	cmpq %rax, %rbx
	jnz label560
label558:
	movq 24(%rbp), %rbx
	movq $0, %rcx
	cmpq %rbx, %rcx
	jnz label564
label562:
	jmp label561
	jmp label563
label564:
	movq $1, %rcx
	cmpq %rbx, %rcx
	jnz label566
label563:
	leaq str0(%rip), %rcx
	movq %rcx, 16(%rbp)
	jmp label556
	jmp label565
label566:
	movq $2, %rcx
	cmpq %rbx, %rcx
	jnz label568
label565:
	leaq str1(%rip), %rcx
	movq %rcx, 16(%rbp)
	jmp label556
	jmp label567
label568:
label561:
	leaq str2(%rip), %rbx
	movq %rbx, 16(%rbp)
	jmp label556
	jmp label559
label560:
	movq $1, %rbx
	cmpq %rax, %rbx
	jnz label571
label559:
	leaq str3(%rip), %rbx
	movq %rbx, 16(%rbp)
	jmp label556
	jmp label570
label571:
	movq $2, %rbx
	cmpq %rax, %rbx
	jnz label573
label570:
	leaq str4(%rip), %rbx
	movq %rbx, 16(%rbp)
	jmp label556
	jmp label572
label573:
label557:
	leaq str5(%rip), %rax
	movq %rax, 16(%rbp)
	jmp label556
label556:
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
	jnz label576
	movq $1, %rax
	jmp label577
label576:
	movq $0, %rax
label577:
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
	jnz label578
	movq $1, %rax
	jmp label579
label578:
	movq $0, %rax
label579:
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
	jnz label580
	movq $1, %rax
	jmp label581
label580:
	movq $0, %rax
label581:
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
	jnz label582
	movq $1, %rax
	jmp label583
label582:
	movq $0, %rax
label583:
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
	jnz label584
	movq $1, %rax
	jmp label585
label584:
	movq $0, %rax
label585:
	movq %rax, %rdi
	call _assertion
label575:
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
