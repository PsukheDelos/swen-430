
	.text
wl_f:
	pushq %rbp
	movq %rsp, %rbp
	movq 24(%rbp), %rax
	movq $0, %rbx
	cmpq %rax, %rbx
	jnz label727
label725:
	leaq str0(%rip), %rbx
	movq %rbx, 16(%rbp)
	jmp label723
	jmp label726
label727:
	movq $1, %rbx
	cmpq %rax, %rbx
	jnz label729
label726:
	jmp label728
label729:
label728:
	leaq str1(%rip), %rbx
	movq %rbx, 16(%rbp)
	jmp label723
label731:
label724:
label723:
	movq %rbp, %rsp
	popq %rbp
	ret
wl_main:
	pushq %rbp
	movq %rsp, %rbp
	movq $1, %rax
	movq $1, %rbx
	cmpq %rax, %rbx
	jnz label734
	movq $1, %rax
	jmp label735
label734:
	movq $0, %rax
label735:
	movq %rax, %rdi
	call _assertion
	movq $1, %rax
	movq $1, %rbx
	cmpq %rax, %rbx
	jnz label736
	movq $1, %rax
	jmp label737
label736:
	movq $0, %rax
label737:
	movq %rax, %rdi
	call _assertion
	movq $1, %rax
	movq $1, %rbx
	cmpq %rax, %rbx
	jnz label738
	movq $1, %rax
	jmp label739
label738:
	movq $0, %rax
label739:
	movq %rax, %rdi
	call _assertion
label733:
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
	.asciz "Other"
