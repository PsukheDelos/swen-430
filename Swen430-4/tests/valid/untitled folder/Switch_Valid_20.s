
	.text
wl_f:
	pushq %rbp
	movq %rsp, %rbp
	movq 24(%rbp), %rax
	movq $0, %rbx
	cmpq %rax, %rbx
	jnz label686
label684:
	jmp label685
label686:
	movq $1, %rbx
	cmpq %rax, %rbx
	jnz label688
label685:
	jmp label687
label688:
	movq $2, %rbx
	cmpq %rax, %rbx
	jnz label690
label687:
	movq 24(%rbp), %rbx
	movq $0, %rcx
	cmpq %rbx, %rcx
	jnz label691
	jmp label683
	jmp label691
label691:
	jmp label689
label690:
label689:
	movq 24(%rbp), %rbx
	movq $1, %rcx
	addq %rcx, %rbx
	movq %rbx, 24(%rbp)
label693:
label683:
	movq 24(%rbp), %rax
	movq %rax, 16(%rbp)
	jmp label682
label682:
	movq %rbp, %rsp
	popq %rbp
	ret
wl_main:
	pushq %rbp
	movq %rsp, %rbp
	movq $0, %rax
	subq $16, %rsp
	movq %rax, 0(%rsp)
	subq $16, %rsp
	movq $0, %rbx
	movq %rbx, 8(%rsp)
	call wl_f
	addq $16, %rsp
	movq 0(%rsp), %rax
	addq $16, %rsp
	movq -32(%rsp), %rbx
	cmpq %rax, %rbx
	jnz label696
	movq $1, %rax
	jmp label697
label696:
	movq $0, %rax
label697:
	movq %rax, %rdi
	call _assertion
	movq $2, %rax
	subq $16, %rsp
	movq %rax, 0(%rsp)
	subq $16, %rsp
	movq $1, %rbx
	movq %rbx, 8(%rsp)
	call wl_f
	addq $16, %rsp
	movq 0(%rsp), %rax
	addq $16, %rsp
	movq -32(%rsp), %rbx
	cmpq %rax, %rbx
	jnz label698
	movq $1, %rax
	jmp label699
label698:
	movq $0, %rax
label699:
	movq %rax, %rdi
	call _assertion
	movq $3, %rax
	subq $16, %rsp
	movq %rax, 0(%rsp)
	subq $16, %rsp
	movq $2, %rbx
	movq %rbx, 8(%rsp)
	call wl_f
	addq $16, %rsp
	movq 0(%rsp), %rax
	addq $16, %rsp
	movq -32(%rsp), %rbx
	cmpq %rax, %rbx
	jnz label700
	movq $1, %rax
	jmp label701
label700:
	movq $0, %rax
label701:
	movq %rax, %rdi
	call _assertion
label695:
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