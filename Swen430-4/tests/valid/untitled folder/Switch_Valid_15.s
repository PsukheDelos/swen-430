
	.text
wl_f:
	pushq %rbp
	movq %rsp, %rbp
	movq 24(%rbp), %rax
	movq $114, %rbx
	cmpq %rax, %rbx
	jnz label744
label742:
	leaq str0(%rip), %rbx
	movq %rbx, 16(%rbp)
	jmp label740
	jmp label743
label744:
	movq $98, %rbx
	cmpq %rax, %rbx
	jnz label746
label743:
	leaq str1(%rip), %rbx
	movq %rbx, 16(%rbp)
	jmp label740
	jmp label745
label746:
	movq $103, %rbx
	cmpq %rax, %rbx
	jnz label748
label745:
	leaq str2(%rip), %rbx
	movq %rbx, 16(%rbp)
	jmp label740
	jmp label747
label748:
label741:
	leaq str3(%rip), %rax
	movq %rax, 16(%rbp)
	jmp label740
label740:
	movq %rbp, %rsp
	popq %rbp
	ret
wl_main:
	pushq %rbp
	movq %rsp, %rbp
	movq $1, %rax
	movq $1, %rbx
	cmpq %rax, %rbx
	jnz label751
	movq $1, %rax
	jmp label752
label751:
	movq $0, %rax
label752:
	movq %rax, %rdi
	call _assertion
	movq $1, %rax
	movq $1, %rbx
	cmpq %rax, %rbx
	jnz label753
	movq $1, %rax
	jmp label754
label753:
	movq $0, %rax
label754:
	movq %rax, %rdi
	call _assertion
	movq $1, %rax
	movq $1, %rbx
	cmpq %rax, %rbx
	jnz label755
	movq $1, %rax
	jmp label756
label755:
	movq $0, %rax
label756:
	movq %rax, %rdi
	call _assertion
label750:
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
