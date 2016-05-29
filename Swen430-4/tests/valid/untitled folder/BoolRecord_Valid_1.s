
	.text
wl_main:
	pushq %rbp
	movq %rsp, %rbp
	subq $16, %rsp
	movq $1, %rax
	movq %rax, -16(%rbp)
	movq $0, %rax
	movq %rax, -8(%rbp)
	movq $1, %rax
	movq $1, %rbx
	cmpq %rax, %rbx
	jnz label177
	movq $1, %rax
	jmp label178
label177:
	movq $0, %rax
label178:
	movq %rax, %rdi
	call _assertion
	movq $1, %rax
	movq $1, %rbx
	cmpq %rax, %rbx
	jnz label179
	movq $1, %rax
	jmp label180
label179:
	movq $0, %rax
label180:
	movq %rax, %rdi
	call _assertion
	movq $1, %rax
	movq $1, %rbx
	cmpq %rax, %rbx
	jnz label181
	movq $1, %rax
	jmp label182
label181:
	movq $0, %rax
label182:
	movq %rax, %rdi
	call _assertion
	movq $0, %rax
	movq %rax, -16(%rbp)
	movq $1, %rax
	movq $1, %rbx
	cmpq %rax, %rbx
	jnz label183
	movq $1, %rax
	jmp label184
label183:
	movq $0, %rax
label184:
	movq %rax, %rdi
	call _assertion
	movq $1, %rax
	movq $1, %rbx
	cmpq %rax, %rbx
	jnz label185
	movq $1, %rax
	jmp label186
label185:
	movq $0, %rax
label186:
	movq %rax, %rdi
	call _assertion
	movq $1, %rax
	movq $1, %rbx
	cmpq %rax, %rbx
	jnz label187
	movq $1, %rax
	jmp label188
label187:
	movq $0, %rax
label188:
	movq %rax, %rdi
	call _assertion
label176:
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
