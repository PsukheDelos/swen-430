
	.text
wl_main:
	pushq %rbp
	movq %rsp, %rbp
	subq $16, %rsp
	movq $1, %rax
	movq %rax, -8(%rbp)
	movq -8(%rbp), %rax
	movq $1, %rbx
	cmpq %rax, %rbx
	jnz label809
label807:
	movq $1, %rbx
	movq $1, %rcx
	cmpq %rbx, %rcx
	jnz label810
	movq $1, %rbx
	jmp label811
label810:
	movq $0, %rbx
label811:
	subq $16, %rsp
	movq %rax, 0(%rsp)
	movq %rbx, %rdi
	call _assertion
	movq 0(%rsp), %rax
	addq $16, %rsp
	jmp label805
	jmp label808
label809:
	movq $2, %rbx
	cmpq %rax, %rbx
	jnz label813
label808:
	movq $1, %rbx
	movq $1, %rcx
	cmpq %rbx, %rcx
	jnz label814
	movq $1, %rbx
	jmp label815
label814:
	movq $0, %rbx
label815:
	subq $16, %rsp
	movq %rax, 0(%rsp)
	movq %rbx, %rdi
	call _assertion
	movq 0(%rsp), %rax
	addq $16, %rsp
	jmp label805
	jmp label812
label813:
label806:
	movq $1, %rax
	movq $1, %rbx
	cmpq %rax, %rbx
	jnz label817
	movq $1, %rax
	jmp label818
label817:
	movq $0, %rax
label818:
	movq %rax, %rdi
	call _assertion
label805:
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
