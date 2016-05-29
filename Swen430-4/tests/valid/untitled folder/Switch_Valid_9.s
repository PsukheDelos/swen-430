
	.text
wl_f:
	pushq %rbp
	movq %rsp, %rbp
	movq 24(%rbp), %rax
	movq $1, %rbx
	cmpq %rax, %rbx
	jnz label994
label992:
	movq $0, %rbx
	movq %rbx, 16(%rbp)
	jmp label990
	jmp label993
label994:
	movq $0, %rbx
	cmpq %rax, %rbx
	jnz label996
label993:
	movq $1, %rbx
	movq %rbx, 16(%rbp)
	jmp label990
	jmp label995
label996:
label991:
	movq $3, %rax
	movq %rax, 16(%rbp)
	jmp label990
label990:
	movq %rbp, %rsp
	popq %rbp
	ret
wl_main:
	pushq %rbp
	movq %rsp, %rbp
	movq $1, %rax
	movq $1, %rbx
	cmpq %rax, %rbx
	jnz label999
	movq $1, %rax
	jmp label1000
label999:
	movq $0, %rax
label1000:
	movq %rax, %rdi
	call _assertion
	movq $1, %rax
	movq $1, %rbx
	cmpq %rax, %rbx
	jnz label1001
	movq $1, %rax
	jmp label1002
label1001:
	movq $0, %rax
label1002:
	movq %rax, %rdi
	call _assertion
label998:
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
