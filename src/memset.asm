;;
;; EPITECH PROJECT, 2019
;; minilibc
;; File description:
;; memset
;;

BITS 64

SECTION	.text

GLOBAL	memset

memset:	; void *memset(void *, char, size_t);
	push		rbp
	mov			rbp, rsp

	xor			rcx, rcx

loop_memset:
	cmp			rcx, rdx
	je			end_memset
	mov			byte [rdi + rcx], sil
	inc			rcx
	jmp			loop_memset

end_memset:
	mov			rax, rdi

	mov			rsp, rbp
	pop			rbp
	ret