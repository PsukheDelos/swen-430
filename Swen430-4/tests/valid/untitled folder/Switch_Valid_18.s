
	.text
wl_f:
	pushq %rbp
	movq %rsp, %rbp
	movq 24(%rbp), %rax
	movq $0, %rbx
	cmpq %rax, %rbx
	jnz label779
label777:
	jmp label776
	jmp label778
label779:
label778:
	movq 24(%rbp), %rbx
	movq $1, %rcx
	addq %rcx, %rbx
	movq %rbx, 16(%rbp)
	jmp label775
label781:
label776:
	movq 24(%rbp), %rax
	movq %rax, 16(%rbp)
	jmp label775
label775:
	movq %rbp, %rsp
	popq %rbp
	ret
wl_main:
	pushq %rbp
	movq %rsp, %rbp
	movq $1, %rax
	movq $1, %rbx
	cmpq %rax, %rbx
	jnz label784
	movq $1, %rax
	jmp label785
label784:
	movq $0, %rax
label785:
	movq %rax, %rdi
	call _assertion
	movq $1, %rax
	movq $1, %rbx
	cmpq %rax, %rbx
	jnz label786
	movq $1, %rax
	jmp label787
label786:
	movq $0, %rax
label787:
	movq %rax, %rdi
	call _assertion
	movq $1, %rax
	movq $1, %rbx
	cmpq %rax, %rbx
	jnz label788
	movq $1, %rax
	jmp label789
label788:
	movq $0, %rax
label789:
	movq %rax, %rdi
	call _assertion
label783:
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
