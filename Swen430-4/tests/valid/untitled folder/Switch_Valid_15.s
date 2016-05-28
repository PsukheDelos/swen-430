
	.text
wl_f:
	pushq %rbp
	movq %rsp, %rbp
	movq 24(%rbp), %rax
	movq $114, %rbx
	cmpq %rax, %rbx
	jnz label617
label615:
	leaq str0(%rip), %rbx
	movq %rbx, 16(%rbp)
	jmp label613
	jmp label616
label617:
	movq $98, %rbx
	cmpq %rax, %rbx
	jnz label619
label616:
	leaq str1(%rip), %rbx
	movq %rbx, 16(%rbp)
	jmp label613
	jmp label618
label619:
	movq $103, %rbx
	cmpq %rax, %rbx
	jnz label621
label618:
	leaq str2(%rip), %rbx
	movq %rbx, 16(%rbp)
	jmp label613
	jmp label620
label621:
label614:
	leaq str3(%rip), %rax
	movq %rax, 16(%rbp)
	jmp label613
label613:
	movq %rbp, %rsp
	popq %rbp
	ret
wl_main:
	pushq %rbp
	movq %rsp, %rbp
	leaq str0(%rip), %rax
	subq $16, %rsp
	movq %rax, 0(%rsp)
	subq $16, %rsp
	movq $114, %rbx
	movq %rbx, 8(%rsp)
	call wl_f
	addq $16, %rsp
	movq 0(%rsp), %rax
	addq $16, %rsp
	movq -32(%rsp), %rbx
	cmpq %rax, %rbx
	jnz label624
	movq $1, %rax
	jmp label625
label624:
	movq $0, %rax
label625:
	movq %rax, %rdi
	call _assertion
	leaq str2(%rip), %rax
	subq $16, %rsp
	movq %rax, 0(%rsp)
	subq $16, %rsp
	movq $103, %rbx
	movq %rbx, 8(%rsp)
	call wl_f
	addq $16, %rsp
	movq 0(%rsp), %rax
	addq $16, %rsp
	movq -32(%rsp), %rbx
	cmpq %rax, %rbx
	jnz label626
	movq $1, %rax
	jmp label627
label626:
	movq $0, %rax
label627:
	movq %rax, %rdi
	call _assertion
	leaq str1(%rip), %rax
	subq $16, %rsp
	movq %rax, 0(%rsp)
	subq $16, %rsp
	movq $98, %rbx
	movq %rbx, 8(%rsp)
	call wl_f
	addq $16, %rsp
	movq 0(%rsp), %rax
	addq $16, %rsp
	movq -32(%rsp), %rbx
	cmpq %rax, %rbx
	jnz label628
	movq $1, %rax
	jmp label629
label628:
	movq $0, %rax
label629:
	movq %rax, %rdi
	call _assertion
label623:
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
	.asciz "RED"
str1:
	.asciz "BLUE"
str2:
	.asciz "GREEN"
str3:
	.asciz ""
