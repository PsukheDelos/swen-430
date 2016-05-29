
	.text
wl_f:
	pushq %rbp
	movq %rsp, %rbp
	subq $16, %rsp
	movq 24(%rbp), %rax
	movq $78, %rbx
	cmpq %rax, %rbx
	jnz label946
label944:
	leaq str0(%rip), %rbx
	movq %rbx, -8(%rbp)
	jmp label943
	jmp label945
label946:
	movq $66, %rbx
	cmpq %rax, %rbx
	jnz label948
label945:
	leaq str1(%rip), %rbx
	movq %rbx, -8(%rbp)
	jmp label943
	jmp label947
label948:
	movq $82, %rbx
	cmpq %rax, %rbx
	jnz label950
label947:
	leaq str2(%rip), %rbx
	movq %rbx, -8(%rbp)
	jmp label943
	jmp label949
label950:
	movq $81, %rbx
	cmpq %rax, %rbx
	jnz label952
label949:
	leaq str3(%rip), %rbx
	movq %rbx, -8(%rbp)
	jmp label943
	jmp label951
label952:
	movq $75, %rbx
	cmpq %rax, %rbx
	jnz label954
label951:
	leaq str4(%rip), %rbx
	movq %rbx, -8(%rbp)
	jmp label943
	jmp label953
label954:
label953:
	leaq str5(%rip), %rbx
	movq %rbx, -8(%rbp)
	jmp label943
label956:
label943:
	movq -8(%rbp), %rax
	movq %rax, 16(%rbp)
	jmp label942
label942:
	movq %rbp, %rsp
	popq %rbp
	ret
wl_main:
	pushq %rbp
	movq %rsp, %rbp
	movq $1, %rax
	movq $1, %rbx
	cmpq %rax, %rbx
	jnz label959
	movq $1, %rax
	jmp label960
label959:
	movq $0, %rax
label960:
	movq %rax, %rdi
	call _assertion
	movq $1, %rax
	movq $1, %rbx
	cmpq %rax, %rbx
	jnz label961
	movq $1, %rax
	jmp label962
label961:
	movq $0, %rax
label962:
	movq %rax, %rdi
	call _assertion
	movq $1, %rax
	movq $1, %rbx
	cmpq %rax, %rbx
	jnz label963
	movq $1, %rax
	jmp label964
label963:
	movq $0, %rax
label964:
	movq %rax, %rdi
	call _assertion
	movq $1, %rax
	movq $1, %rbx
	cmpq %rax, %rbx
	jnz label965
	movq $1, %rax
	jmp label966
label965:
	movq $0, %rax
label966:
	movq %rax, %rdi
	call _assertion
	movq $1, %rax
	movq $1, %rbx
	cmpq %rax, %rbx
	jnz label967
	movq $1, %rax
	jmp label968
label967:
	movq $0, %rax
label968:
	movq %rax, %rdi
	call _assertion
	movq $1, %rax
	movq $1, %rbx
	cmpq %rax, %rbx
	jnz label969
	movq $1, %rax
	jmp label970
label969:
	movq $0, %rax
label970:
	movq %rax, %rdi
	call _assertion
	movq $1, %rax
	movq $1, %rbx
	cmpq %rax, %rbx
	jnz label971
	movq $1, %rax
	jmp label972
label971:
	movq $0, %rax
label972:
	movq %rax, %rdi
	call _assertion
label958:
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
