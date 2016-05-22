
	.text
wl_f:
	pushq %rbp
	movq %rsp, %rbp
	subq $16, %rsp
	movq 24(%rbp), %rax
	movq $78, %rbx
	cmpq %rax, %rbx
	jnz label795
label793:
	leaq str0(%rip), %rbx
	movq %rbx, -8(%rbp)
	jmp label792
	jmp label794
label795:
	movq $66, %rbx
	cmpq %rax, %rbx
	jnz label797
label794:
	leaq str1(%rip), %rbx
	movq %rbx, -8(%rbp)
	jmp label792
	jmp label796
label797:
	movq $82, %rbx
	cmpq %rax, %rbx
	jnz label799
label796:
	leaq str2(%rip), %rbx
	movq %rbx, -8(%rbp)
	jmp label792
	jmp label798
label799:
	movq $81, %rbx
	cmpq %rax, %rbx
	jnz label801
label798:
	leaq str3(%rip), %rbx
	movq %rbx, -8(%rbp)
	jmp label792
	jmp label800
label801:
	movq $75, %rbx
	cmpq %rax, %rbx
	jnz label803
label800:
	leaq str4(%rip), %rbx
	movq %rbx, -8(%rbp)
	jmp label792
	jmp label802
label803:
label802:
	leaq str5(%rip), %rbx
	movq %rbx, -8(%rbp)
	jmp label792
label805:
label792:
	movq -8(%rbp), %rax
	movq %rax, 16(%rbp)
	jmp label791
label791:
	movq %rbp, %rsp
	popq %rbp
	ret
wl_main:
	pushq %rbp
	movq %rsp, %rbp
	leaq str0(%rip), %rax
	subq $16, %rsp
	movq %rax, 0(%rsp)
	subq $16, %rsp
	movq $78, %rbx
	movq %rbx, 8(%rsp)
	call wl_f
	addq $16, %rsp
	movq 0(%rsp), %rax
	addq $16, %rsp
	movq -32(%rsp), %rbx
	cmpq %rax, %rbx
	jnz label808
	movq $1, %rax
	jmp label809
label808:
	movq $0, %rax
label809:
	movq %rax, %rdi
	call _assertion
	leaq str4(%rip), %rax
	subq $16, %rsp
	movq %rax, 0(%rsp)
	subq $16, %rsp
	movq $75, %rbx
	movq %rbx, 8(%rsp)
	call wl_f
	addq $16, %rsp
	movq 0(%rsp), %rax
	addq $16, %rsp
	movq -32(%rsp), %rbx
	cmpq %rax, %rbx
	jnz label810
	movq $1, %rax
	jmp label811
label810:
	movq $0, %rax
label811:
	movq %rax, %rdi
	call _assertion
	leaq str3(%rip), %rax
	subq $16, %rsp
	movq %rax, 0(%rsp)
	subq $16, %rsp
	movq $81, %rbx
	movq %rbx, 8(%rsp)
	call wl_f
	addq $16, %rsp
	movq 0(%rsp), %rax
	addq $16, %rsp
	movq -32(%rsp), %rbx
	cmpq %rax, %rbx
	jnz label812
	movq $1, %rax
	jmp label813
label812:
	movq $0, %rax
label813:
	movq %rax, %rdi
	call _assertion
	leaq str1(%rip), %rax
	subq $16, %rsp
	movq %rax, 0(%rsp)
	subq $16, %rsp
	movq $66, %rbx
	movq %rbx, 8(%rsp)
	call wl_f
	addq $16, %rsp
	movq 0(%rsp), %rax
	addq $16, %rsp
	movq -32(%rsp), %rbx
	cmpq %rax, %rbx
	jnz label814
	movq $1, %rax
	jmp label815
label814:
	movq $0, %rax
label815:
	movq %rax, %rdi
	call _assertion
	leaq str2(%rip), %rax
	subq $16, %rsp
	movq %rax, 0(%rsp)
	subq $16, %rsp
	movq $82, %rbx
	movq %rbx, 8(%rsp)
	call wl_f
	addq $16, %rsp
	movq 0(%rsp), %rax
	addq $16, %rsp
	movq -32(%rsp), %rbx
	cmpq %rax, %rbx
	jnz label816
	movq $1, %rax
	jmp label817
label816:
	movq $0, %rax
label817:
	movq %rax, %rdi
	call _assertion
	leaq str5(%rip), %rax
	subq $16, %rsp
	movq %rax, 0(%rsp)
	subq $16, %rsp
	movq $101, %rbx
	movq %rbx, 8(%rsp)
	call wl_f
	addq $16, %rsp
	movq 0(%rsp), %rax
	addq $16, %rsp
	movq -32(%rsp), %rbx
	cmpq %rax, %rbx
	jnz label818
	movq $1, %rax
	jmp label819
label818:
	movq $0, %rax
label819:
	movq %rax, %rdi
	call _assertion
	leaq str5(%rip), %rax
	subq $16, %rsp
	movq %rax, 0(%rsp)
	subq $16, %rsp
	movq $49, %rbx
	movq %rbx, 8(%rsp)
	call wl_f
	addq $16, %rsp
	movq 0(%rsp), %rax
	addq $16, %rsp
	movq -32(%rsp), %rbx
	cmpq %rax, %rbx
	jnz label820
	movq $1, %rax
	jmp label821
label820:
	movq $0, %rax
label821:
	movq %rax, %rdi
	call _assertion
label807:
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
	.asciz "KNIGHT"
str1:
	.asciz "BISHOP"
str2:
	.asciz "ROOK"
str3:
	.asciz "QUEEN"
str4:
	.asciz "KING"
str5:
	.asciz "NOTHING"
