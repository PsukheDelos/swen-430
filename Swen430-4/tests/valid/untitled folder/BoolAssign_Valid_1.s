
	.text
wl_main:
	pushq %rbp
	movq %rsp, %rbp
	subq $16, %rsp
	movq $1, %rax
	movq %rax, -8(%rbp)
	movq -8(%rbp), %rax
	movq $1, %rbx
	cmpq %rax, %rbx
	jnz label16
	movq $1, %rax
	jmp label17
label16:
	movq $0, %rax
label17:
	movq %rax, %rdi
	call _assertion
	movq $0, %rax
	movq %rax, -8(%rbp)
	movq -8(%rbp), %rax
	movq $0, %rbx
	cmpq %rax, %rbx
	jnz label18
	movq $1, %rax
	jmp label19
label18:
	movq $0, %rax
label19:
	movq %rax, %rdi
	call _assertion
label15:
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
