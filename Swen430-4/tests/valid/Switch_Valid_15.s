
	.text
wl_f:
	pushq %rbp
	movq %rsp, %rbp
	movq 24(%rbp), %rax
	movq $114, %rbx
	cmpq %rax, %rbx
	jnz label529
	leaq str0(%rip), %rbx
	movq %rbx, 16(%rbp)
	jmp label527
label529:
	movq $98, %rbx
	cmpq %rax, %rbx
	jnz label530
	leaq str1(%rip), %rbx
	movq %rbx, 16(%rbp)
	jmp label527
label530:
	movq $103, %rbx
	cmpq %rax, %rbx
	jnz label531
	leaq str2(%rip), %rbx
	movq %rbx, 16(%rbp)
	jmp label527
label531:
label528:
	leaq str3(%rip), %rax
	movq %rax, 16(%rbp)
	jmp label527
label527:
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
	jnz label533
	movq $1, %rax
	jmp label534
label533:
	movq $0, %rax
label534:
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
	jnz label535
	movq $1, %rax
	jmp label536
label535:
	movq $0, %rax
label536:
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
	jnz label537
	movq $1, %rax
	jmp label538
label537:
	movq $0, %rax
label538:
	movq %rax, %rdi
	call _assertion
label532:
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
