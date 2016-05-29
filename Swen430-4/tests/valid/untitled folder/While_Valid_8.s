
	.text
wl_f:
	pushq %rbp
	movq %rsp, %rbp
	subq $16, %rsp
label1082:
	movq 24(%rbp), %rax
	movq $0, %rbx
	cmpq %rbx, %rax
	jl label1083
	movq 24(%rbp), %rax
	movq $0, %rbx
	cmpq %rbx, %rax
	jge label1085
	movq $0, %rax
	movq %rax, 16(%rbp)
	jmp label1081
	jmp label1084
label1085:
	movq 24(%rbp), %rax
	movq %rax, -8(%rbp)
label1084:
	movq -8(%rbp), %rax
	movq %rax, 16(%rbp)
	jmp label1081
	jmp label1082
label1083:
	movq $0, %rax
	movq %rax, 16(%rbp)
	jmp label1081
label1081:
	movq %rbp, %rsp
	popq %rbp
	ret
wl_main:
	pushq %rbp
	movq %rsp, %rbp
	movq $1, %rax
	movq $1, %rbx
	cmpq %rax, %rbx
	jnz label1087
	movq $1, %rax
	jmp label1088
label1087:
	movq $0, %rax
label1088:
	movq %rax, %rdi
	call _assertion
	movq $1, %rax
	movq $1, %rbx
	cmpq %rax, %rbx
	jnz label1089
	movq $1, %rax
	jmp label1090
label1089:
	movq $0, %rax
label1090:
	movq %rax, %rdi
	call _assertion
	movq $1, %rax
	movq $1, %rbx
	cmpq %rax, %rbx
	jnz label1091
	movq $1, %rax
	jmp label1092
label1091:
	movq $0, %rax
label1092:
	movq %rax, %rdi
	call _assertion
	movq $1, %rax
	movq $1, %rbx
	cmpq %rax, %rbx
	jnz label1093
	movq $1, %rax
	jmp label1094
label1093:
	movq $0, %rax
label1094:
	movq %rax, %rdi
	call _assertion
	movq $1, %rax
	movq $1, %rbx
	cmpq %rax, %rbx
	jnz label1095
	movq $1, %rax
	jmp label1096
label1095:
	movq $0, %rax
label1096:
	movq %rax, %rdi
	call _assertion
label1086:
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
