
	.text
wl_f:
	pushq %rbp
	movq %rsp, %rbp
	movq 24(%rbp), %rax
	movq $114, %rbx
	cmpq %rax, %rbx
	jnz label607
label605:
	leaq str0(%rip), %rbx
	movq %rbx, 16(%rbp)
	jmp label603
	jmp label606
label607:
	movq $98, %rbx
	cmpq %rax, %rbx
	jnz label609
label606:
	leaq str1(%rip), %rbx
	movq %rbx, 16(%rbp)
	jmp label603
	jmp label608
label609:
	movq $103, %rbx
	cmpq %rax, %rbx
	jnz label611
label608:
	leaq str2(%rip), %rbx
	movq %rbx, 16(%rbp)
	jmp label603
	jmp label610
label611:
label604:
	leaq str3(%rip), %rax
	movq %rax, 16(%rbp)
	jmp label603
label603:
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
	jnz label614
	movq $1, %rax
	jmp label615
label614:
	movq $0, %rax
label615:
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
	jnz label616
	movq $1, %rax
	jmp label617
label616:
	movq $0, %rax
label617:
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
	jnz label618
	movq $1, %rax
	jmp label619
label618:
	movq $0, %rax
label619:
	movq %rax, %rdi
	call _assertion
label613:
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
