
	.text
wl_f:
	pushq %rbp
	movq %rsp, %rbp
	movq 24(%rbp), %rax
	movq $114, %rbx
	cmpq %rax, %rbx
	jnz label737
label735:
	leaq str0(%rip), %rbx
	movq %rbx, 16(%rbp)
	jmp label733
	jmp label736
label737:
	movq $98, %rbx
	cmpq %rax, %rbx
	jnz label739
label736:
	leaq str1(%rip), %rbx
	movq %rbx, 16(%rbp)
	jmp label733
	jmp label738
label739:
	movq $103, %rbx
	cmpq %rax, %rbx
	jnz label741
label738:
	leaq str2(%rip), %rbx
	movq %rbx, 16(%rbp)
	jmp label733
label741:
label734:
	leaq str3(%rip), %rax
	movq %rax, 16(%rbp)
	jmp label733
label733:
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
	jnz label744
	movq $1, %rax
	jmp label745
label744:
	movq $0, %rax
label745:
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
	jnz label746
	movq $1, %rax
	jmp label747
label746:
	movq $0, %rax
label747:
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
	jnz label748
	movq $1, %rax
	jmp label749
label748:
	movq $0, %rax
label749:
	movq %rax, %rdi
	call _assertion
label743:
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
