
	.text
wl_f:
	pushq %rbp
	movq %rsp, %rbp
	movq 24(%rbp), %rax
	leaq str0(%rip), %rbx
	cmpq %rax, %rbx
	jnz label636
label634:
	movq $0, %rbx
	movq %rbx, 16(%rbp)
	jmp label632
	jmp label635
label636:
	leaq str1(%rip), %rbx
	cmpq %rax, %rbx
	jnz label638
label635:
	movq $1, %rbx
	movq %rbx, 16(%rbp)
	jmp label632
	jmp label637
label638:
	leaq str2(%rip), %rbx
	cmpq %rax, %rbx
	jnz label640
label637:
	movq $2, %rbx
	movq %rbx, 16(%rbp)
	jmp label632
label640:
label633:
	movq $-1, %rax
	movq %rax, 16(%rbp)
	jmp label632
label632:
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
	jnz label643
	movq $1, %rax
	jmp label644
label643:
	movq $0, %rax
label644:
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
	jnz label645
	movq $1, %rax
	jmp label646
label645:
	movq $0, %rax
label646:
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
	jnz label647
	movq $1, %rax
	jmp label648
label647:
	movq $0, %rax
label648:
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
	jnz label649
	movq $1, %rax
	jmp label650
label649:
	movq $0, %rax
label650:
	movq %rax, %rdi
	call _assertion
label642:
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
