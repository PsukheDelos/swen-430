
	.text
wl_main:
	pushq %rbp
	movq %rsp, %rbp
	movq $8, %rax
	movq %rax, %rdi
	call _malloc
	movq %rax, %rax
	movq $0, %rbx
	movq %rbx, 0(%rax)
	movq 0(%rax), %rax
	movq $0, %rbx
	cmpq %rax, %rbx
	jnz label100
	movq $1, %rax
	jmp label101
label100:
	movq $0, %rax
label101:
	movq %rax, %rdi
	call _assertion
	movq $16, %rax
	movq %rax, %rdi
	call _malloc
	movq %rax, %rax
	movq $1, %rbx
	movq %rbx, 0(%rax)
	movq $1, %rbx
	movq %rbx, 8(%rax)
	movq 0(%rax), %rax
	movq $1, %rbx
	cmpq %rax, %rbx
	jnz label102
	movq $1, %rax
	jmp label103
label102:
	movq $0, %rax
label103:
	movq %rax, %rdi
	call _assertion
	movq $24, %rax
	movq %rax, %rdi
	call _malloc
	movq %rax, %rax
	movq $2, %rbx
	movq %rbx, 0(%rax)
	movq $1, %rbx
	movq %rbx, 8(%rax)
	movq $2, %rbx
	movq %rbx, 16(%rax)
	movq 0(%rax), %rax
	movq $2, %rbx
	cmpq %rax, %rbx
	jnz label104
	movq $1, %rax
	jmp label105
label104:
	movq $0, %rax
label105:
	movq %rax, %rdi
	call _assertion
	movq $32, %rax
	movq %rax, %rdi
	call _malloc
	movq %rax, %rax
	movq $3, %rbx
	movq %rbx, 0(%rax)
	movq $1, %rbx
	movq %rbx, 8(%rax)
	movq $2, %rbx
	movq %rbx, 16(%rax)
	movq $3, %rbx
	movq %rbx, 24(%rax)
	movq 0(%rax), %rax
	movq $3, %rbx
	cmpq %rax, %rbx
	jnz label106
	movq $1, %rax
	jmp label107
label106:
	movq $0, %rax
label107:
	movq %rax, %rdi
	call _assertion
label99:
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
