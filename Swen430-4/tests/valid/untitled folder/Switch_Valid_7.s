
	.text
wl_f:
	pushq %rbp
	movq %rsp, %rbp
	subq $16, %rsp
	movq 24(%rbp), %rax
	movq $78, %rbx
	cmpq %rax, %rbx
	jnz label805
label803:
	leaq str0(%rip), %rbx
	movq %rbx, -8(%rbp)
	jmp label802
	jmp label804
label805:
	movq $66, %rbx
	cmpq %rax, %rbx
	jnz label807
label804:
	leaq str1(%rip), %rbx
	movq %rbx, -8(%rbp)
	jmp label802
	jmp label806
label807:
	movq $82, %rbx
	cmpq %rax, %rbx
	jnz label809
label806:
	leaq str2(%rip), %rbx
	movq %rbx, -8(%rbp)
	jmp label802
	jmp label808
label809:
	movq $81, %rbx
	cmpq %rax, %rbx
	jnz label811
label808:
	leaq str3(%rip), %rbx
	movq %rbx, -8(%rbp)
	jmp label802
	jmp label810
label811:
	movq $75, %rbx
	cmpq %rax, %rbx
	jnz label813
label810:
	leaq str4(%rip), %rbx
	movq %rbx, -8(%rbp)
	jmp label802
	jmp label812
label813:
label812:
	leaq str5(%rip), %rbx
	movq %rbx, -8(%rbp)
	jmp label802
label815:
label802:
	movq -8(%rbp), %rax
	movq %rax, 16(%rbp)
	jmp label801
label801:
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
	jnz label818
	movq $1, %rax
	jmp label819
label818:
	movq $0, %rax
label819:
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
	jnz label820
	movq $1, %rax
	jmp label821
label820:
	movq $0, %rax
label821:
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
	jnz label822
	movq $1, %rax
	jmp label823
label822:
	movq $0, %rax
label823:
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
	jnz label824
	movq $1, %rax
	jmp label825
label824:
	movq $0, %rax
label825:
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
	jnz label826
	movq $1, %rax
	jmp label827
label826:
	movq $0, %rax
label827:
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
	jnz label828
	movq $1, %rax
	jmp label829
label828:
	movq $0, %rax
label829:
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
	jnz label830
	movq $1, %rax
	jmp label831
label830:
	movq $0, %rax
label831:
	movq %rax, %rdi
	call _assertion
label817:
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
