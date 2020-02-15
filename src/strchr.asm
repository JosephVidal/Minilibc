;;
;; EPITECH PROJECT, 2019
;; minilibc
;; File description:
;; strchr
;;

BITS 64

SECTION	.text

GLOBAL	strchr

strchr:
	push		rbp
	mov			rbp, rsp

	xor			rcx, rcx
	xor			r8b, r8b

loop_strchr:
	mov			r8b, byte [rdi + rcx]
	cmp			r8b, 0
	je			end_null_strchr
	cmp			sil, r8b
	je			end_strchr
	inc			rcx
	jmp			loop_strchr

end_null_strchr:
	xor			rax, rax
	mov			rsp, rbp
	pop 		rbp
	ret

end_strchr:
	add			rdi, rcx
	mov			rax, rdi

	mov			rsp, rbp
	pop 		rbp
	ret