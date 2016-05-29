
	.text
wl_sum:
	pushq %rbp
	movq %rsp, %rbp
	subq $16, %rsp
	movq $0, %rax
	movq %rax, -8(%rbp)
	movq $0, %rax
	movq %rax, -16(%rbp)
label1038:
	movq -8(%rbp), %rax
	movq 24(%rbp), %rbx
	cmpq %rbx, %rax
	jge label1039
	movq $0, %rbx
	cmpq %rbx, %rax
	jge label1040
	movq -8(%rbp), %rax
	movq $1, %rbx
	addq %rbx, %rax
	movq %rax, -8(%rbp)
	jmp label1038
	jmp label1040
label1040:
	movq -16(%rbp), %rax
	addq %rbx, %rax
	movq %rax, -16(%rbp)
	movq -8(%rbp), %rax
	movq $1, %rbx
	addq %rbx, %rax
	movq %rax, -8(%rbp)
	jmp label1038
label1039:
	movq -16(%rbp), %rax
	movq %rax, 16(%rbp)
	jmp label1037
label1037:
	movq %rbp, %rsp
	popq %rbp
	ret
wl_main:
	pushq %rbp
	movq %rsp, %rbp
	movq $1, %rax
	movq $1, %rbx
	cmpq %rax, %rbx
	jnz label1042
	movq $1, %rax
	jmp label1043
label1042:
	movq $0, %rax
label1043:
	movq %rax, %rdi
	call _assertion
	movq $1, %rax
	movq $1, %rbx
	cmpq %rax, %rbx
	jnz label1044
	movq $1, %rax
	jmp label1045
label1044:
	movq $0, %rax
label1045:
	movq %rax, %rdi
	call _assertion
	movq $1, %rax
	movq $1, %rbx
	cmpq %rax, %rbx
	jnz label1046
	movq $1, %rax
	jmp label1047
label1046:
	movq $0, %rax
label1047:
	movq %rax, %rdi
	call _assertion
	movq $1, %rax
	movq $1, %rbx
	cmpq %rax, %rbx
	jnz label1048
	movq $1, %rax
	jmp label1049
label1048:
	movq $0, %rax
label1049:
	movq %rax, %rdi
	call _assertion
	movq $1, %rax
	movq $1, %rbx
	cmpq %rax, %rbx
	jnz label1050
	movq $1, %rax
	jmp label1051
label1050:
	movq $0, %rax
label1051:
	movq %rax, %rdi
	call _assertion
label1041:
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
