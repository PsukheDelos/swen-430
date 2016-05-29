
	.text
wl_f:
	pushq %rbp
	movq %rsp, %rbp
	movq 24(%rbp), %rax
label905:
label907:
label904:
	movq $10, %rax
	movq %rax, 16(%rbp)
	jmp label903
label903:
	movq %rbp, %rsp
	popq %rbp
	ret
wl_main:
	pushq %rbp
	movq %rsp, %rbp
	movq $1, %rax
	movq $1, %rbx
	cmpq %rax, %rbx
	jnz label910
	movq $1, %rax
	jmp label911
label910:
	movq $0, %rax
label911:
	movq %rax, %rdi
	call _assertion
	movq $1, %rax
	movq $1, %rbx
	cmpq %rax, %rbx
	jnz label912
	movq $1, %rax
	jmp label913
label912:
	movq $0, %rax
label913:
	movq %rax, %rdi
	call _assertion
	movq $1, %rax
	movq $1, %rbx
	cmpq %rax, %rbx
	jnz label914
	movq $1, %rax
	jmp label915
label914:
	movq $0, %rax
label915:
	movq %rax, %rdi
	call _assertion
	movq $1, %rax
	movq $1, %rbx
	cmpq %rax, %rbx
	jnz label916
	movq $1, %rax
	jmp label917
label916:
	movq $0, %rax
label917:
	movq %rax, %rdi
	call _assertion
label909:
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
