
	.text
wl_f:
	pushq %rbp
	movq %rsp, %rbp
	movq 24(%rbp), %rax
	movq $0, %rbx
	cmpq %rax, %rbx
	jnz label631
label629:
	movq 24(%rbp), %rbx
	movq $10, %rcx
	addq %rcx, %rbx
	movq %rbx, 24(%rbp)
	jmp label630
label631:
	movq $1, %rbx
	cmpq %rax, %rbx
	jnz label633
label630:
	movq 24(%rbp), %rbx
	movq %rbx, 16(%rbp)
	jmp label627
	jmp label632
label633:
label632:
	movq $0, %rbx
	movq %rbx, 16(%rbp)
	jmp label627
label635:
label628:
label627:
	movq %rbp, %rsp
	popq %rbp
	ret
wl_main:
	pushq %rbp
	movq %rsp, %rbp
	movq $1, %rax
	movq $1, %rbx
	cmpq %rax, %rbx
	jnz label638
	movq $1, %rax
	jmp label639
label638:
	movq $0, %rax
label639:
	movq %rax, %rdi
	call _assertion
	movq $1, %rax
	movq $1, %rbx
	cmpq %rax, %rbx
	jnz label640
	movq $1, %rax
	jmp label641
label640:
	movq $0, %rax
label641:
	movq %rax, %rdi
	call _assertion
	movq $1, %rax
	movq $1, %rbx
	cmpq %rax, %rbx
	jnz label642
	movq $1, %rax
	jmp label643
label642:
	movq $0, %rax
label643:
	movq %rax, %rdi
	call _assertion
label637:
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
