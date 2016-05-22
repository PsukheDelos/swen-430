
	.text
wl_f:
	pushq %rbp
	movq %rsp, %rbp
	movq 32(%rbp), %rax
	movq $0, %rbx
	cmpq %rax, %rbx
	jnz label530
label528:
	movq 24(%rbp), %rbx
	movq $0, %rcx
	cmpq %rbx, %rcx
	jnz label534
label532:
	leaq str0(%rip), %rcx
	movq %rcx, 16(%rbp)
	jmp label526
	jmp label533
label534:
	movq $1, %rcx
	cmpq %rbx, %rcx
	jnz label536
label533:
	leaq str1(%rip), %rcx
	movq %rcx, 16(%rbp)
	jmp label526
	jmp label535
label536:
	movq $2, %rcx
	cmpq %rbx, %rcx
	jnz label538
label535:
	leaq str2(%rip), %rcx
	movq %rcx, 16(%rbp)
	jmp label526
	jmp label537
label538:
label531:
	jmp label529
label530:
	movq $1, %rbx
	cmpq %rax, %rbx
	jnz label541
label529:
	leaq str3(%rip), %rbx
	movq %rbx, 16(%rbp)
	jmp label526
	jmp label540
label541:
	movq $2, %rbx
	cmpq %rax, %rbx
	jnz label543
label540:
	leaq str4(%rip), %rbx
	movq %rbx, 16(%rbp)
	jmp label526
	jmp label542
label543:
label527:
	leaq str5(%rip), %rax
	movq %rax, 16(%rbp)
	jmp label526
label526:
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
	leaq str0(%rip), %rax
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
	jnz label546
	movq $1, %rax
	jmp label547
label546:
	movq $0, %rax
label547:
	movq %rax, %rdi
	call _assertion
	leaq str1(%rip), %rax
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
	jnz label548
	movq $1, %rax
	jmp label549
label548:
	movq $0, %rax
label549:
	movq %rax, %rdi
	call _assertion
	leaq str2(%rip), %rax
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
	jnz label550
	movq $1, %rax
	jmp label551
label550:
	movq $0, %rax
label551:
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
	jnz label552
	movq $1, %rax
	jmp label553
label552:
	movq $0, %rax
label553:
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
	jnz label554
	movq $1, %rax
	jmp label555
label554:
	movq $0, %rax
label555:
	movq %rax, %rdi
	call _assertion
label545:
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
	.asciz "RED RED"
str1:
	.asciz "RED BLUE"
str2:
	.asciz "RED GREEN"
str3:
	.asciz "BLUE ???"
str4:
	.asciz "GREEN ???"
str5:
	.asciz ""
