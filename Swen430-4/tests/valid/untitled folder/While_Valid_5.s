
	.text
wl_trim:
	pushq %rbp
	movq %rsp, %rbp
	subq $16, %rsp
	movq $0, %rax
	movq %rax, -16(%rbp)
label1059:
	movq -16(%rbp), %rax
	movq 24(%rbp), %rbx
	cmpq %rbx, %rax
	jge label1060
	movq 24(%rbp), %rbx
	cmpq %rax, %rbx
	jnz label1061
	jmp label1060
	jmp label1061
label1061:
	movq -16(%rbp), %rax
	movq $1, %rbx
	addq %rbx, %rax
	movq %rax, -16(%rbp)
	jmp label1059
label1060:
	movq -8(%rbp), %rax
	movq %rax, 16(%rbp)
	jmp label1058
label1058:
	movq %rbp, %rsp
	popq %rbp
	ret
wl_main:
	pushq %rbp
	movq %rsp, %rbp
	movq $1, %rax
	movq $1, %rbx
	cmpq %rax, %rbx
	jnz label1063
	movq $1, %rax
	jmp label1064
label1063:
	movq $0, %rax
label1064:
	movq %rax, %rdi
	call _assertion
	movq $1, %rax
	movq $1, %rbx
	cmpq %rax, %rbx
	jnz label1065
	movq $1, %rax
	jmp label1066
label1065:
	movq $0, %rax
label1066:
	movq %rax, %rdi
	call _assertion
label1062:
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
