;;
;; EPITECH PROJECT, 2019
;; minilibc
;; File description:
;; memcpy
;;

BITS 64

SECTION	.text

GLOBAL	memcpy

memcpy:	; void *memcpy(void *, const char *, size_t);
	push		rbp
	mov			rbp, rsp

	xor			rcx, rcx
	xor			r9, r9

loop_memcpy:
	cmp			rcx, rdx
	je			end_memcpy
	mov			r9b, [rsi + rcx]
	mov			[rdi + rcx], r9b
	inc			rcx
	jmp			loop_memcpy

end_memcpy:
	mov			rax, rdi

	mov			rsp, rbp
	pop			rbp
	ret