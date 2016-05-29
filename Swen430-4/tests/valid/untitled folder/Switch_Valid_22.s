
	.text
wl_f:
	pushq %rbp
	movq %rsp, %rbp
	movq 24(%rbp), %rax
	movq $0, %rbx
	cmpq %rax, %rbx
	jnz label843
label841:
	jmp label842
label843:
	movq $1, %rbx
	cmpq %rax, %rbx
	jnz label845
label842:
	jmp label844
label845:
	movq $2, %rbx
	cmpq %rax, %rbx
	jnz label847
label844:
	movq 24(%rbp), %rbx
	movq $0, %rcx
	cmpq %rbx, %rcx
	jnz label848
	jmp label840
	jmp label848
label848:
	movq 24(%rbp), %rbx
	movq $1, %rcx
	subq %rcx, %rbx
	movq %rbx, 24(%rbp)
	jmp label840
	jmp label846
label847:
label846:
	movq 24(%rbp), %rbx
	movq $1, %rcx
	addq %rcx, %rbx
	movq %rbx, 24(%rbp)
	jmp label840
label850:
label840:
	movq 24(%rbp), %rax
	movq %rax, 16(%rbp)
	jmp label839
label839:
	movq %rbp, %rsp
	popq %rbp
	ret
wl_main:
	pushq %rbp
	movq %rsp, %rbp
	movq $1, %rax
	movq $1, %rbx
	cmpq %rax, %rbx
	jnz label853
	movq $1, %rax
	jmp label854
label853:
	movq $0, %rax
label854:
	movq %rax, %rdi
	call _assertion
	movq $1, %rax
	movq $1, %rbx
	cmpq %rax, %rbx
	jnz label855
	movq $1, %rax
	jmp label856
label855:
	movq $0, %rax
label856:
	movq %rax, %rdi
	call _assertion
	movq $1, %rax
	movq $1, %rbx
	cmpq %rax, %rbx
	jnz label857
	movq $1, %rax
	jmp label858
label857:
	movq $0, %rax
label858:
	movq %rax, %rdi
	call _assertion
	movq $1, %rax
	movq $1, %rbx
	cmpq %rax, %rbx
	jnz label859
	movq $1, %rax
	jmp label860
label859:
	movq $0, %rax
label860:
	movq %rax, %rdi
	call _assertion
label852:
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
