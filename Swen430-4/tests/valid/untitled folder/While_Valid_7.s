
	.text
wl_f:
	pushq %rbp
	movq %rsp, %rbp
	subq $16, %rsp
label1068:
	movq 24(%rbp), %rax
	movq $0, %rbx
	cmpq %rbx, %rax
	jl label1069
	movq 24(%rbp), %rax
	movq %rax, -8(%rbp)
	movq -8(%rbp), %rax
	movq %rax, 16(%rbp)
	jmp label1067
	jmp label1068
label1069:
	movq $0, %rax
	movq %rax, 16(%rbp)
	jmp label1067
label1067:
	movq %rbp, %rsp
	popq %rbp
	ret
wl_main:
	pushq %rbp
	movq %rsp, %rbp
	movq $1, %rax
	movq $1, %rbx
	cmpq %rax, %rbx
	jnz label1071
	movq $1, %rax
	jmp label1072
label1071:
	movq $0, %rax
label1072:
	movq %rax, %rdi
	call _assertion
	movq $1, %rax
	movq $1, %rbx
	cmpq %rax, %rbx
	jnz label1073
	movq $1, %rax
	jmp label1074
label1073:
	movq $0, %rax
label1074:
	movq %rax, %rdi
	call _assertion
	movq $1, %rax
	movq $1, %rbx
	cmpq %rax, %rbx
	jnz label1075
	movq $1, %rax
	jmp label1076
label1075:
	movq $0, %rax
label1076:
	movq %rax, %rdi
	call _assertion
	movq $1, %rax
	movq $1, %rbx
	cmpq %rax, %rbx
	jnz label1077
	movq $1, %rax
	jmp label1078
label1077:
	movq $0, %rax
label1078:
	movq %rax, %rdi
	call _assertion
	movq $1, %rax
	movq $1, %rbx
	cmpq %rax, %rbx
	jnz label1079
	movq $1, %rax
	jmp label1080
label1079:
	movq $0, %rax
label1080:
	movq %rax, %rdi
	call _assertion
label1070:
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
