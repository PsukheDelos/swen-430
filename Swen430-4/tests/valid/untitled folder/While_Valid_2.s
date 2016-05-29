
	.text
wl_sum:
	pushq %rbp
	movq %rsp, %rbp
	subq $16, %rsp
	movq $0, %rax
	movq %rax, -8(%rbp)
	movq $0, %rax
	movq %rax, -16(%rbp)
label1028:
	movq -8(%rbp), %rax
	movq 24(%rbp), %rbx
	cmpq %rbx, %rax
	jge label1029
	movq -16(%rbp), %rax
	addq %rbx, %rax
	movq %rax, -16(%rbp)
	movq -8(%rbp), %rax
	movq $1, %rbx
	addq %rbx, %rax
	movq %rax, -8(%rbp)
	jmp label1028
label1029:
	movq -16(%rbp), %rax
	movq %rax, 16(%rbp)
	jmp label1027
label1027:
	movq %rbp, %rsp
	popq %rbp
	ret
wl_main:
	pushq %rbp
	movq %rsp, %rbp
	movq $1, %rax
	movq $1, %rbx
	cmpq %rax, %rbx
	jnz label1031
	movq $1, %rax
	jmp label1032
label1031:
	movq $0, %rax
label1032:
	movq %rax, %rdi
	call _assertion
	movq $1, %rax
	movq $1, %rbx
	cmpq %rax, %rbx
	jnz label1033
	movq $1, %rax
	jmp label1034
label1033:
	movq $0, %rax
label1034:
	movq %rax, %rdi
	call _assertion
	movq $1, %rax
	movq $1, %rbx
	cmpq %rax, %rbx
	jnz label1035
	movq $1, %rax
	jmp label1036
label1035:
	movq $0, %rax
label1036:
	movq %rax, %rdi
	call _assertion
label1030:
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
