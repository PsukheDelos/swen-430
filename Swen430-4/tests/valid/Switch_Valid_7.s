
	.text
wl_f:
	pushq %rbp
	movq %rsp, %rbp
	subq $16, %rsp
	movq 24(%rbp), %rax
	movq $78, %rbx
	cmpq %rax, %rbx
	jnz label933
label931:
	leaq str0(%rip), %rbx
	movq %rbx, -8(%rbp)
	jmp label930
	jmp label932
label933:
	movq $66, %rbx
	cmpq %rax, %rbx
	jnz label935
label932:
	leaq str1(%rip), %rbx
	movq %rbx, -8(%rbp)
	jmp label930
	jmp label934
label935:
	movq $82, %rbx
	cmpq %rax, %rbx
	jnz label937
label934:
	leaq str2(%rip), %rbx
	movq %rbx, -8(%rbp)
	jmp label930
	jmp label936
label937:
	movq $81, %rbx
	cmpq %rax, %rbx
	jnz label939
label936:
	leaq str3(%rip), %rbx
	movq %rbx, -8(%rbp)
	jmp label930
	jmp label938
label939:
	movq $75, %rbx
	cmpq %rax, %rbx
	jnz label941
label938:
	leaq str4(%rip), %rbx
	movq %rbx, -8(%rbp)
	jmp label930
	jmp label940
label941:
label940:
	leaq str5(%rip), %rbx
	movq %rbx, -8(%rbp)
	jmp label930
label943:
label930:
	movq -8(%rbp), %rax
	movq %rax, 16(%rbp)
	jmp label929
label929:
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
	jnz label946
	movq $1, %rax
	jmp label947
label946:
	movq $0, %rax
label947:
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
	jnz label948
	movq $1, %rax
	jmp label949
label948:
	movq $0, %rax
label949:
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
	jnz label950
	movq $1, %rax
	jmp label951
label950:
	movq $0, %rax
label951:
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
	jnz label952
	movq $1, %rax
	jmp label953
label952:
	movq $0, %rax
label953:
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
	jnz label954
	movq $1, %rax
	jmp label955
label954:
	movq $0, %rax
label955:
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
	jnz label956
	movq $1, %rax
	jmp label957
label956:
	movq $0, %rax
label957:
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
	jnz label958
	movq $1, %rax
	jmp label959
label958:
	movq $0, %rax
label959:
	movq %rax, %rdi
	call _assertion
label945:
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
