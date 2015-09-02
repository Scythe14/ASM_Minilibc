[BITS 64]

global strspn
	;; size_t strspn(const char *s, const char *accept)

strspn:
	push rbp
	mov rbp, rsp

	push rdx
	push rcx
	push r8

	mov rax, rdi

	xor rdx, rdx
	xor rcx, rcx
	xor r8, r8

strspn_loop:
	cmp [rax], BYTE 0
	je strspn_accept
	jmp strspn_accept

strspn_accept:
	mov dh, BYTE [rax]
	mov dl, BYTE [rsi + rcx]

	cmp dl, BYTE 0
	je strspn_end

	cmp dh, dl
	je _inc

	inc rcx
	jmp strspn_accept

_inc:
	xor rcx, rcx
	inc rax
	inc r8
	jmp strspn_loop

strspn_end:
	mov rax, r8
	pop r8
	pop rcx
	pop rdx
	leave
	ret
