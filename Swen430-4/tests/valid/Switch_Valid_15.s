
	.text
wl_f:
	pushq %rbp
	movq %rsp, %rbp
	movq 24(%rbp), %rax
	movq $114, %rbx
	cmpq %rax, %rbx
	jnz label732
label730:
	leaq str0(%rip), %rbx
	movq %rbx, 16(%rbp)
	jmp label728
	jmp label731
label732:
	movq $98, %rbx
	cmpq %rax, %rbx
	jnz label734
label731:
	leaq str1(%rip), %rbx
	movq %rbx, 16(%rbp)
	jmp label728
	jmp label733
label734:
	movq $103, %rbx
	cmpq %rax, %rbx
	jnz label736
label733:
	leaq str2(%rip), %rbx
	movq %rbx, 16(%rbp)
	jmp label728
label736:
label729:
	leaq str3(%rip), %rax
	movq %rax, 16(%rbp)
	jmp label728
label728:
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
	jnz label739
	movq $1, %rax
	jmp label740
label739:
	movq $0, %rax
label740:
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
	jnz label741
	movq $1, %rax
	jmp label742
label741:
	movq $0, %rax
label742:
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
	jnz label743
	movq $1, %rax
	jmp label744
label743:
	movq $0, %rax
label744:
	movq %rax, %rdi
	call _assertion
label738:
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
