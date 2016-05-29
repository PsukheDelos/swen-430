
	.text
wl_f:
	pushq %rbp
	movq %rsp, %rbp
	movq 24(%rbp), %rax
	movq $1, %rbx
	cmpq %rax, %rbx
	jnz label614
label612:
	movq $0, %rbx
	movq %rbx, 16(%rbp)
	jmp label610
	jmp label613
label614:
	movq $2, %rbx
	cmpq %rax, %rbx
	jnz label616
label613:
	movq $-1, %rbx
	movq %rbx, 16(%rbp)
	jmp label610
	jmp label615
label616:
label611:
	movq $10, %rax
	movq %rax, 16(%rbp)
	jmp label610
label610:
	movq %rbp, %rsp
	popq %rbp
	ret
wl_main:
	pushq %rbp
	movq %rsp, %rbp
	movq $1, %rax
	movq $1, %rbx
	cmpq %rax, %rbx
	jnz label619
	movq $1, %rax
	jmp label620
label619:
	movq $0, %rax
label620:
	movq %rax, %rdi
	call _assertion
	movq $1, %rax
	movq $1, %rbx
	cmpq %rax, %rbx
	jnz label621
	movq $1, %rax
	jmp label622
label621:
	movq $0, %rax
label622:
	movq %rax, %rdi
	call _assertion
	movq $1, %rax
	movq $1, %rbx
	cmpq %rax, %rbx
	jnz label623
	movq $1, %rax
	jmp label624
label623:
	movq $0, %rax
label624:
	movq %rax, %rdi
	call _assertion
	movq $1, %rax
	movq $1, %rbx
	cmpq %rax, %rbx
	jnz label625
	movq $1, %rax
	jmp label626
label625:
	movq $0, %rax
label626:
	movq %rax, %rdi
	call _assertion
label618:
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
