
	.text
wl_f:
	pushq %rbp
	movq %rsp, %rbp
	movq 32(%rbp), %rax
	movq $0, %rbx
	cmpq %rax, %rbx
	jnz label492
	movq 24(%rbp), %rbx
	movq $0, %rcx
	cmpq %rbx, %rcx
	jnz label494
	leaq str0(%rip), %rcx
	movq %rcx, 16(%rbp)
	jmp label490
label494:
	movq $1, %rcx
	cmpq %rbx, %rcx
	jnz label495
	leaq str1(%rip), %rcx
	movq %rcx, 16(%rbp)
	jmp label490
label495:
	movq $2, %rcx
	cmpq %rbx, %rcx
	jnz label496
	leaq str2(%rip), %rcx
	movq %rcx, 16(%rbp)
	jmp label490
label496:
label493:
label492:
	movq $1, %rbx
	cmpq %rax, %rbx
	jnz label497
	leaq str3(%rip), %rbx
	movq %rbx, 16(%rbp)
	jmp label490
label497:
	movq $2, %rbx
	cmpq %rax, %rbx
	jnz label498
	leaq str4(%rip), %rbx
	movq %rbx, 16(%rbp)
	jmp label490
label498:
label491:
	leaq str5(%rip), %rax
	movq %rax, 16(%rbp)
	jmp label490
label490:
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
	jnz label500
	movq $1, %rax
	jmp label501
label500:
	movq $0, %rax
label501:
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
	jnz label502
	movq $1, %rax
	jmp label503
label502:
	movq $0, %rax
label503:
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
	jnz label504
	movq $1, %rax
	jmp label505
label504:
	movq $0, %rax
label505:
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
	jnz label506
	movq $1, %rax
	jmp label507
label506:
	movq $0, %rax
label507:
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
	jnz label508
	movq $1, %rax
	jmp label509
label508:
	movq $0, %rax
label509:
	movq %rax, %rdi
	call _assertion
label499:
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
