
	.text
wl_f:
	pushq %rbp
	movq %rsp, %rbp
	subq $16, %rsp
	movq $0, %rax
	movq %rax, -8(%rbp)
	movq 24(%rbp), %rax
	movq %rax, -16(%rbp)
label1098:
	movq -16(%rbp), %rax
	movq $10, %rbx
	cmpq %rbx, %rax
	jge label1099
	movq -16(%rbp), %rax
	movq $0, %rbx
	cmpq %rax, %rbx
	jnz label1103
label1101:
	movq -8(%rbp), %rbx
	movq $1, %rcx
	addq %rcx, %rbx
	movq %rbx, -8(%rbp)
	movq -16(%rbp), %rbx
	movq $1, %rcx
	addq %rcx, %rbx
	movq %rbx, -16(%rbp)
	jmp label1098
	jmp label1102
label1103:
	movq $1, %rbx
	cmpq %rax, %rbx
	jnz label1105
label1102:
	movq -8(%rbp), %rbx
	movq $10, %rcx
	addq %rcx, %rbx
	movq %rbx, -8(%rbp)
	jmp label1104
label1105:
	movq $2, %rbx
	cmpq %rax, %rbx
	jnz label1107
label1104:
	movq -8(%rbp), %rbx
	movq $100, %rcx
	addq %rcx, %rbx
	movq %rbx, -8(%rbp)
	jmp label1100
	jmp label1106
label1107:
	movq $3, %rbx
	cmpq %rax, %rbx
	jnz label1109
label1106:
	movq -8(%rbp), %rbx
	movq $1000, %rcx
	addq %rcx, %rbx
	movq %rbx, -8(%rbp)
	movq -8(%rbp), %rbx
	movq %rbx, 16(%rbp)
	jmp label1097
	jmp label1108
label1109:
label1108:
	movq -8(%rbp), %rbx
	movq $10000, %rcx
	addq %rcx, %rbx
	movq %rbx, -8(%rbp)
label1111:
label1100:
	movq -16(%rbp), %rax
	movq $1, %rbx
	addq %rbx, %rax
	movq %rax, -16(%rbp)
	movq -16(%rbp), %rax
	movq $5, %rbx
	cmpq %rax, %rbx
	jnz label1113
	jmp label1099
	jmp label1113
label1113:
	jmp label1098
label1099:
	movq -8(%rbp), %rax
	movq %rax, 16(%rbp)
	jmp label1097
label1097:
	movq %rbp, %rsp
	popq %rbp
	ret
wl_main:
	pushq %rbp
	movq %rsp, %rbp
	movq $1, %rax
	movq $1, %rbx
	cmpq %rax, %rbx
	jnz label1115
	movq $1, %rax
	jmp label1116
label1115:
	movq $0, %rax
label1116:
	movq %rax, %rdi
	call _assertion
	movq $1, %rax
	movq $1, %rbx
	cmpq %rax, %rbx
	jnz label1117
	movq $1, %rax
	jmp label1118
label1117:
	movq $0, %rax
label1118:
	movq %rax, %rdi
	call _assertion
	movq $1, %rax
	movq $1, %rbx
	cmpq %rax, %rbx
	jnz label1119
	movq $1, %rax
	jmp label1120
label1119:
	movq $0, %rax
label1120:
	movq %rax, %rdi
	call _assertion
	movq $1, %rax
	movq $1, %rbx
	cmpq %rax, %rbx
	jnz label1121
	movq $1, %rax
	jmp label1122
label1121:
	movq $0, %rax
label1122:
	movq %rax, %rdi
	call _assertion
	movq $1, %rax
	movq $1, %rbx
	cmpq %rax, %rbx
	jnz label1123
	movq $1, %rax
	jmp label1124
label1123:
	movq $0, %rax
label1124:
	movq %rax, %rdi
	call _assertion
	movq $1, %rax
	movq $1, %rbx
	cmpq %rax, %rbx
	jnz label1125
	movq $1, %rax
	jmp label1126
label1125:
	movq $0, %rax
label1126:
	movq %rax, %rdi
	call _assertion
	movq $1, %rax
	movq $1, %rbx
	cmpq %rax, %rbx
	jnz label1127
	movq $1, %rax
	jmp label1128
label1127:
	movq $0, %rax
label1128:
	movq %rax, %rdi
	call _assertion
label1114:
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
