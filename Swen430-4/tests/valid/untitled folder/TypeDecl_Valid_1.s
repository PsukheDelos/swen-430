
	.text
wl_main:
	pushq %rbp
	movq %rsp, %rbp
	subq $32, %rsp
	movq $32, %rax
	movq %rax, %rdi
	call _malloc
	movq %rax, %rax
	movq %rax, -32(%rbp)
	movq $3, %rax
	movq %rax, -32(%rbp)
	movq $1, %rax
	movq %rax, -16(%rbp)
	movq $2, %rax
	movq %rax, -8(%rbp)
	subq $16, %rsp
	movq -16(%rbp), %rax
	movq %rax, 0(%rsp)
	movq -8(%rbp), %rax
	movq %rax, 8(%rsp)
	movq 0(%rsp), %rax
	movq %rax, -24(%rbp)
	addq $16, %rsp
	movq $1, %rax
	movq $1, %rbx
	cmpq %rax, %rbx
	jnz label1004
	movq $1, %rax
	jmp label1005
label1004:
	movq $0, %rax
label1005:
	movq %rax, %rdi
	call _assertion
	movq $1, %rax
	movq $1, %rbx
	cmpq %rax, %rbx
	jnz label1006
	movq $1, %rax
	jmp label1007
label1006:
	movq $0, %rax
label1007:
	movq %rax, %rdi
	call _assertion
	movq $1, %rax
	movq $1, %rbx
	cmpq %rax, %rbx
	jnz label1008
	movq $1, %rax
	jmp label1009
label1008:
	movq $0, %rax
label1009:
	movq %rax, %rdi
	call _assertion
	movq $1, %rax
	movq $1, %rbx
	cmpq %rax, %rbx
	jnz label1010
	movq $1, %rax
	jmp label1011
label1010:
	movq $0, %rax
label1011:
	movq %rax, %rdi
	call _assertion
	movq $1, %rax
	movq $1, %rbx
	cmpq %rax, %rbx
	jnz label1012
	movq $1, %rax
	jmp label1013
label1012:
	movq $0, %rax
label1013:
	movq %rax, %rdi
	call _assertion
	movq $1, %rax
	movq $1, %rbx
	cmpq %rax, %rbx
	jnz label1014
	movq $1, %rax
	jmp label1015
label1014:
	movq $0, %rax
label1015:
	movq %rax, %rdi
	call _assertion
label1003:
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
