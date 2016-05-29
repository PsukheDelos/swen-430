
	.text
wl_f:
	pushq %rbp
	movq %rsp, %rbp
	movq 24(%rbp), %rax
	leaq str0(%rip), %rbx
	cmpq %rax, %rbx
	jnz label648
label646:
	movq $0, %rbx
	movq %rbx, 16(%rbp)
	jmp label644
	jmp label647
label648:
	leaq str1(%rip), %rbx
	cmpq %rax, %rbx
	jnz label650
label647:
	movq $1, %rbx
	movq %rbx, 16(%rbp)
	jmp label644
	jmp label649
label650:
	leaq str2(%rip), %rbx
	cmpq %rax, %rbx
	jnz label652
label649:
	movq $2, %rbx
	movq %rbx, 16(%rbp)
	jmp label644
	jmp label651
label652:
label645:
	movq $-1, %rax
	movq %rax, 16(%rbp)
	jmp label644
label644:
	movq %rbp, %rsp
	popq %rbp
	ret
wl_main:
	pushq %rbp
	movq %rsp, %rbp
	movq $1, %rax
	movq $1, %rbx
	cmpq %rax, %rbx
	jnz label655
	movq $1, %rax
	jmp label656
label655:
	movq $0, %rax
label656:
	movq %rax, %rdi
	call _assertion
	movq $1, %rax
	movq $1, %rbx
	cmpq %rax, %rbx
	jnz label657
	movq $1, %rax
	jmp label658
label657:
	movq $0, %rax
label658:
	movq %rax, %rdi
	call _assertion
	movq $1, %rax
	movq $1, %rbx
	cmpq %rax, %rbx
	jnz label659
	movq $1, %rax
	jmp label660
label659:
	movq $0, %rax
label660:
	movq %rax, %rdi
	call _assertion
	movq $1, %rax
	movq $1, %rbx
	cmpq %rax, %rbx
	jnz label661
	movq $1, %rax
	jmp label662
label661:
	movq $0, %rax
label662:
	movq %rax, %rdi
	call _assertion
label654:
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
	.asciz "Red"
str1:
	.asciz "Blue"
str2:
	.asciz "Green"
