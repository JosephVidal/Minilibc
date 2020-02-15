;;
;; EPITECH PROJECT, 2019
;; minilibc
;; File description:
;; strncmp
;;

BITS 64

SECTION	.text

GLOBAL	strncmp

strncmp: ; int strncmp(char *, char *, int);
	push		rbp
	mov			rbp, rsp

	xor			r8, r8
	xor			r9, r9
	xor			rcx, rcx

loop_strncmp:
	cmp			rcx, rdx
	je			end_strncmp
	mov			r8b, byte [rdi + rcx]
	mov     	r9b, byte [rsi + rcx]
	cmp			r8b, 0
	je			end_strncmp
	cmp			r9b, 0
	je			end_strncmp
	cmp			r9b, r8b
	jne			end_strncmp
	inc			rcx
	jmp			loop_strncmp

great:
	mov			rax, 1

	mov			rsp, rbp
	pop			rbp
	ret

less:
	mov			rax, -1

	mov			rsp, rbp
	pop			rbp
	ret

end_strncmp:
	sub			r8b, r9b
	movsx		rax, r8b

	cmp			rax, 0
	jg			great
	cmp			rax, 0
	jl			less

	mov			rsp, rbp
	pop			rbp
	ret