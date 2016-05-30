
	.text
wl_f:
	pushq %rbp
	movq %rsp, %rbp
	movq 24(%rbp), %rax
	leaq str0(%rip), %rbx
	cmpq %rax, %rbx
	jnz label641
label639:
	movq $0, %rbx
	movq %rbx, 16(%rbp)
	jmp label637
	jmp label640
label641:
	leaq str1(%rip), %rbx
	cmpq %rax, %rbx
	jnz label643
label640:
	movq $1, %rbx
	movq %rbx, 16(%rbp)
	jmp label637
	jmp label642
label643:
	leaq str2(%rip), %rbx
	cmpq %rax, %rbx
	jnz label645
label642:
	movq $2, %rbx
	movq %rbx, 16(%rbp)
	jmp label637
label645:
label638:
	movq $-1, %rax
	movq %rax, 16(%rbp)
	jmp label637
label637:
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
	leaq str0(%rip), %rbx
	movq %rbx, 8(%rsp)
	call wl_f
	addq $16, %rsp
	movq 0(%rsp), %rax
	addq $16, %rsp
	movq -32(%rsp), %rbx
	cmpq %rax, %rbx
	jnz label648
	movq $1, %rax
	jmp label649
label648:
	movq $0, %rax
label649:
	movq %rax, %rdi
	call _assertion
	movq $1, %rax
	subq $16, %rsp
	movq %rax, 0(%rsp)
	subq $16, %rsp
	leaq str1(%rip), %rbx
	movq %rbx, 8(%rsp)
	call wl_f
	addq $16, %rsp
	movq 0(%rsp), %rax
	addq $16, %rsp
	movq -32(%rsp), %rbx
	cmpq %rax, %rbx
	jnz label650
	movq $1, %rax
	jmp label651
label650:
	movq $0, %rax
label651:
	movq %rax, %rdi
	call _assertion
	movq $2, %rax
	subq $16, %rsp
	movq %rax, 0(%rsp)
	subq $16, %rsp
	leaq str2(%rip), %rbx
	movq %rbx, 8(%rsp)
	call wl_f
	addq $16, %rsp
	movq 0(%rsp), %rax
	addq $16, %rsp
	movq -32(%rsp), %rbx
	cmpq %rax, %rbx
	jnz label652
	movq $1, %rax
	jmp label653
label652:
	movq $0, %rax
label653:
	movq %rax, %rdi
	call _assertion
	movq $-1, %rax
	subq $16, %rsp
	movq %rax, 0(%rsp)
	subq $16, %rsp
	leaq str3(%rip), %rbx
	movq %rbx, 8(%rsp)
	call wl_f
	addq $16, %rsp
	movq 0(%rsp), %rax
	addq $16, %rsp
	movq -32(%rsp), %rbx
	cmpq %rax, %rbx
	jnz label654
	movq $1, %rax
	jmp label655
label654:
	movq $0, %rax
label655:
	movq %rax, %rdi
	call _assertion
label647:
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
	.asciz "Red"
str1:
	.asciz "Blue"
str2:
	.asciz "Green"
str3:
	.asciz "Dave"
