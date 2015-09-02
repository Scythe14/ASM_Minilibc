[BITS 64]

global strpbrk
	;;;  char *strpbrk(const char *s, const char *accept);

strpbrk:
	push rbp
	mov rbp, rsp

	push rdx	; DH | DL
	push rcx	; offset

	mov rax, rdi
	xor rdx, rdx
	xor rcx, rcx
	jmp strpbrk_loop

ret_loop:
	xor rcx, rcx
	inc rax

strpbrk_loop:
	cmp [rax], BYTE 0
	je strpbrk_end

	jmp strpbrk_loop_accept

strpbrk_loop_accept:
	mov dh, BYTE [rax]
	mov dl, BYTE [rsi + rcx]

	cmp dh, dl
	je strpbrk_end

	cmp dl, BYTE 0
	je ret_loop

	inc rcx
	jmp strpbrk_loop_accept

strpbrk_end:
	pop rcx
	pop rdx
	leave
	ret
