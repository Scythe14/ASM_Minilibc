[BITS 64]

global strcspn
	;; size_t strcspn(const char *s, const char *reject)

strcspn:
	push rbp
	mov rbp, rsp

	push rdx
	push rcx
	push r8

	mov rax, rdi
	
	xor rdx, rdx
	xor rcx, rcx
	xor r8, r8
	jmp strcspn_loop
	
_inc:
	xor rcx, rcx
	inc rax
	inc r8

strcspn_loop:
	cmp [rax], BYTE 0
	je strcspn_end
	jmp strcspn_reject

strcspn_reject:
	mov dh, BYTE [rax]
	mov dl, BYTE [rsi + rcx]

	cmp dh, dl
	je strcspn_end

	cmp dl, BYTE 0
	je _inc

	inc rcx
	jmp strcspn_reject

strcspn_end:
	mov rax, r8
	pop r8
	pop rcx
	pop rdx
	leave
	ret
