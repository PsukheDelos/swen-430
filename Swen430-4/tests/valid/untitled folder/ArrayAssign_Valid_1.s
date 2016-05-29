
	.text
wl_main:
	pushq %rbp
	movq %rsp, %rbp
	subq $16, %rsp
	movq $32, %rax
	movq %rax, %rdi
	call _malloc
	movq %rax, %rax
	movq %rax, -16(%rbp)
	movq $3, %rax
	movq %rax, -16(%rbp)
	movq -16(%rbp), %rax
	movq %rax, -8(%rbp)
	movq $1, %rax
	movq $1, %rbx
	cmpq %rax, %rbx
	jnz label7
	movq $1, %rax
	jmp label8
label7:
	movq $0, %rax
label8:
	movq %rax, %rdi
	call _assertion
	movq $1, %rax
	movq $1, %rbx
	cmpq %rax, %rbx
	jnz label9
	movq $1, %rax
	jmp label10
label9:
	movq $0, %rax
label10:
	movq %rax, %rdi
	call _assertion
label6:
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
