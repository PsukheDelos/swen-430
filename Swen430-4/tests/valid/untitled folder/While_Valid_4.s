
	.text
wl_trim:
	pushq %rbp
	movq %rsp, %rbp
	subq $16, %rsp
	movq $0, %rax
	movq %rax, -16(%rbp)
label1053:
	movq -16(%rbp), %rax
	movq 24(%rbp), %rbx
	cmpq %rbx, %rax
	jge label1054
	movq -16(%rbp), %rax
	movq $1, %rbx
	addq %rbx, %rax
	movq %rax, -16(%rbp)
	jmp label1053
label1054:
	movq -8(%rbp), %rax
	movq %rax, 16(%rbp)
	jmp label1052
label1052:
	movq %rbp, %rsp
	popq %rbp
	ret
wl_main:
	pushq %rbp
	movq %rsp, %rbp
	subq $16, %rsp
	subq $32, %rsp
	movq $4, %rax
	movq %rax, 8(%rsp)
	movq $80, %rax
	movq %rax, %rdi
	call _malloc
	movq %rax, %rax
	movq %rax, 16(%rsp)
	movq $9, %rax
	movq %rax, 16(%rsp)
	call wl_trim
	addq $32, %rsp
	movq -32(%rsp), %rax
	movq %rax, -8(%rbp)
	movq $1, %rax
	movq $1, %rbx
	cmpq %rax, %rbx
	jnz label1056
	movq $1, %rax
	jmp label1057
label1056:
	movq $0, %rax
label1057:
	movq %rax, %rdi
	call _assertion
label1055:
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
