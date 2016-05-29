
	.text
wl_f:
	pushq %rbp
	movq %rsp, %rbp
	movq 24(%rbp), %rax
	cmpq $0, %rax
	jz label162
	leaq str0(%rip), %rax
	movq %rax, 16(%rbp)
	jmp label160
	jmp label161
label162:
	leaq str1(%rip), %rax
	movq %rax, 16(%rbp)
	jmp label160
label161:
label160:
	movq %rbp, %rsp
	popq %rbp
	ret
wl_main:
	pushq %rbp
	movq %rsp, %rbp
	movq $1, %rax
	movq $1, %rbx
	cmpq %rax, %rbx
	jnz label164
	movq $1, %rax
	jmp label165
label164:
	movq $0, %rax
label165:
	movq %rax, %rdi
	call _assertion
	movq $1, %rax
	movq $1, %rbx
	cmpq %rax, %rbx
	jnz label166
	movq $1, %rax
	jmp label167
label166:
	movq $0, %rax
label167:
	movq %rax, %rdi
	call _assertion
label163:
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
