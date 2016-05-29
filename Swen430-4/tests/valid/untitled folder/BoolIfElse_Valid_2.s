
	.text
wl_f:
	pushq %rbp
	movq %rsp, %rbp
	movq 24(%rbp), %rax
	movq $1, %rbx
	cmpq %rax, %rbx
	jnz label170
	leaq str0(%rip), %rax
	movq %rax, 16(%rbp)
	jmp label168
	jmp label169
label170:
	leaq str1(%rip), %rax
	movq %rax, 16(%rbp)
	jmp label168
label169:
label168:
	movq %rbp, %rsp
	popq %rbp
	ret
wl_main:
	pushq %rbp
	movq %rsp, %rbp
	movq $1, %rax
	movq $1, %rbx
	cmpq %rax, %rbx
	jnz label172
	movq $1, %rax
	jmp label173
label172:
	movq $0, %rax
label173:
	movq %rax, %rdi
	call _assertion
	movq $1, %rax
	movq $1, %rbx
	cmpq %rax, %rbx
	jnz label174
	movq $1, %rax
	jmp label175
label174:
	movq $0, %rax
label175:
	movq %rax, %rdi
	call _assertion
label171:
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
str0:
	.asciz "TRUE"
str1:
	.asciz "FALSE"
