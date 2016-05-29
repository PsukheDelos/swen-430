
	.text
wl_f:
	pushq %rbp
	movq %rsp, %rbp
	movq 24(%rbp), %rax
	leaq str0(%rip), %rbx
	cmpq %rax, %rbx
	jnz label886
label884:
	movq $0, %rbx
	movq %rbx, 16(%rbp)
	jmp label882
	jmp label885
label886:
	leaq str1(%rip), %rbx
	cmpq %rax, %rbx
	jnz label888
label885:
	movq $1, %rbx
	movq %rbx, 16(%rbp)
	jmp label882
	jmp label887
label888:
	leaq str2(%rip), %rbx
	cmpq %rax, %rbx
	jnz label890
label887:
	movq $2, %rbx
	movq %rbx, 16(%rbp)
	jmp label882
	jmp label889
label890:
label883:
	movq $3, %rax
	movq %rax, 16(%rbp)
	jmp label882
label882:
	movq %rbp, %rsp
	popq %rbp
	ret
wl_main:
	pushq %rbp
	movq %rsp, %rbp
	movq $1, %rax
	movq $1, %rbx
	cmpq %rax, %rbx
	jnz label893
	movq $1, %rax
	jmp label894
label893:
	movq $0, %rax
label894:
	movq %rax, %rdi
	call _assertion
	movq $1, %rax
	movq $1, %rbx
	cmpq %rax, %rbx
	jnz label895
	movq $1, %rax
	jmp label896
label895:
	movq $0, %rax
label896:
	movq %rax, %rdi
	call _assertion
	movq $1, %rax
	movq $1, %rbx
	cmpq %rax, %rbx
	jnz label897
	movq $1, %rax
	jmp label898
label897:
	movq $0, %rax
label898:
	movq %rax, %rdi
	call _assertion
	movq $1, %rax
	movq $1, %rbx
	cmpq %rax, %rbx
	jnz label899
	movq $1, %rax
	jmp label900
label899:
	movq $0, %rax
label900:
	movq %rax, %rdi
	call _assertion
	movq $1, %rax
	movq $1, %rbx
	cmpq %rax, %rbx
	jnz label901
	movq $1, %rax
	jmp label902
label901:
	movq $0, %rax
label902:
	movq %rax, %rdi
	call _assertion
label892:
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
	.asciz "ZERO"
str1:
	.asciz "ONE"
str2:
	.asciz "TWO"
