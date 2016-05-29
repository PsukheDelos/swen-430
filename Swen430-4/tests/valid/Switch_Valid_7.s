
	.text
wl_f:
	pushq %rbp
	movq %rsp, %rbp
	subq $16, %rsp
	movq 24(%rbp), %rax
	movq $78, %rbx
	cmpq %rax, %rbx
	jnz label928
label926:
	leaq str0(%rip), %rbx
	movq %rbx, -8(%rbp)
	jmp label925
	jmp label927
label928:
	movq $66, %rbx
	cmpq %rax, %rbx
	jnz label930
label927:
	leaq str1(%rip), %rbx
	movq %rbx, -8(%rbp)
	jmp label925
	jmp label929
label930:
	movq $82, %rbx
	cmpq %rax, %rbx
	jnz label932
label929:
	leaq str2(%rip), %rbx
	movq %rbx, -8(%rbp)
	jmp label925
	jmp label931
label932:
	movq $81, %rbx
	cmpq %rax, %rbx
	jnz label934
label931:
	leaq str3(%rip), %rbx
	movq %rbx, -8(%rbp)
	jmp label925
	jmp label933
label934:
	movq $75, %rbx
	cmpq %rax, %rbx
	jnz label936
label933:
	leaq str4(%rip), %rbx
	movq %rbx, -8(%rbp)
	jmp label925
	jmp label935
label936:
label935:
	leaq str5(%rip), %rbx
	movq %rbx, -8(%rbp)
	jmp label925
label938:
label925:
	movq -8(%rbp), %rax
	movq %rax, 16(%rbp)
	jmp label924
label924:
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
	jnz label941
	movq $1, %rax
	jmp label942
label941:
	movq $0, %rax
label942:
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
	jnz label943
	movq $1, %rax
	jmp label944
label943:
	movq $0, %rax
label944:
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
	jnz label945
	movq $1, %rax
	jmp label946
label945:
	movq $0, %rax
label946:
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
	jnz label947
	movq $1, %rax
	jmp label948
label947:
	movq $0, %rax
label948:
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
	jnz label949
	movq $1, %rax
	jmp label950
label949:
	movq $0, %rax
label950:
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
	jnz label951
	movq $1, %rax
	jmp label952
label951:
	movq $0, %rax
label952:
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
	jnz label953
	movq $1, %rax
	jmp label954
label953:
	movq $0, %rax
label954:
	movq %rax, %rdi
	call _assertion
label940:
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
