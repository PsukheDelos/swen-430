
	.text
wl_f:
	pushq %rbp
	movq %rsp, %rbp
	movq 32(%rbp), %rax
	movq $0, %rbx
	cmpq %rax, %rbx
	jnz label540
label538:
	movq 24(%rbp), %rbx
	movq $0, %rcx
	cmpq %rbx, %rcx
	jnz label544
label542:
	leaq str0(%rip), %rcx
	movq %rcx, 16(%rbp)
	jmp label536
	jmp label543
label544:
	movq $1, %rcx
	cmpq %rbx, %rcx
	jnz label546
label543:
	leaq str1(%rip), %rcx
	movq %rcx, 16(%rbp)
	jmp label536
	jmp label545
label546:
	movq $2, %rcx
	cmpq %rbx, %rcx
	jnz label548
label545:
	leaq str2(%rip), %rcx
	movq %rcx, 16(%rbp)
	jmp label536
	jmp label547
label548:
label541:
	jmp label539
label540:
	movq $1, %rbx
	cmpq %rax, %rbx
	jnz label551
label539:
	leaq str3(%rip), %rbx
	movq %rbx, 16(%rbp)
	jmp label536
	jmp label550
label551:
	movq $2, %rbx
	cmpq %rax, %rbx
	jnz label553
label550:
	leaq str4(%rip), %rbx
	movq %rbx, 16(%rbp)
	jmp label536
	jmp label552
label553:
label537:
	leaq str5(%rip), %rax
	movq %rax, 16(%rbp)
	jmp label536
label536:
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
	jnz label556
	movq $1, %rax
	jmp label557
label556:
	movq $0, %rax
label557:
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
	jnz label558
	movq $1, %rax
	jmp label559
label558:
	movq $0, %rax
label559:
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
	jnz label560
	movq $1, %rax
	jmp label561
label560:
	movq $0, %rax
label561:
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
	jnz label562
	movq $1, %rax
	jmp label563
label562:
	movq $0, %rax
label563:
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
	jnz label564
	movq $1, %rax
	jmp label565
label564:
	movq $0, %rax
label565:
	movq %rax, %rdi
	call _assertion
label555:
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
