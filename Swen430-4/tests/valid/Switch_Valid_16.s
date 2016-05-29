
	.text
wl_f:
	pushq %rbp
	movq %rsp, %rbp
	movq 24(%rbp), %rax
	movq 0(%rax), %rbx
	incq %rbx
	movq %rbx, %rcx
	imulq $8, %rcx
	subq $16, %rsp
	movq %rax, 0(%rsp)
	movq %rbx, 8(%rsp)
	movq %rcx, %rdi
	call _malloc
	movq %rax, %rcx
	movq 0(%rsp), %rax
	movq 8(%rsp), %rbx
	addq $16, %rsp
	subq $32, %rsp
	movq %rax, 0(%rsp)
	movq %rbx, 8(%rsp)
	movq %rcx, 16(%rsp)
	movq %rcx, %rdi
	movq %rax, %rsi
	movq %rbx, %rdx
	call _intncpy
	movq 0(%rsp), %rax
	movq 8(%rsp), %rbx
	movq 16(%rsp), %rcx
	addq $32, %rsp
	movq %rcx, %rax
	leaq arr0(%rip), %rbx
	cmpq %rax, %rbx
	jnz label4
label2:
	movq $0, %rbx
	movq %rbx, 16(%rbp)
	jmp label0
	jmp label3
label4:
	leaq arr1(%rip), %rbx
	cmpq %rax, %rbx
	jnz label6
label3:
	movq $1, %rbx
	movq %rbx, 16(%rbp)
	jmp label0
	jmp label5
label6:
	leaq arr2(%rip), %rbx
	cmpq %rax, %rbx
	jnz label8
label5:
	movq $2, %rbx
	movq %rbx, 16(%rbp)
	jmp label0
label8:
label1:
	movq $3, %rax
	movq %rax, 16(%rbp)
	jmp label0
label0:
	movq %rbp, %rsp
	popq %rbp
	ret
wl_main:
	pushq %rbp
	movq %rsp, %rbp
label10:
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
arr0:
	.asciz ""
arr1:
	.asciz "0"
arr2:
	.asciz "01"
