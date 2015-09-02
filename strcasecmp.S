[BITS 64]

global strcasecmp
	;; int strcasecmp(const char *s1, const char *s2)

strcasecmp:
	push rbp
	mov rbp, rsp

	push rdx
	xor rdx, rdx

	jmp strcasecmp_loop

_inc:
	cmp al, BYTE 0
	je same
	inc rdx

strcasecmp_loop:
	call low

	cmp ah, al
	je _inc

	cmp ah, BYTE 0
	je smaller
	cmp al, BYTE 0
	je bigger

	cmp ah, al
	jg bigger
	jl smaller

bigger:
	xor rdx, rdx
	mov dl, ah
	sub ah, ah
	sub dl, al
	mov rax, rdx
	jmp _leave

smaller:
	pop rdx
	xor rdx, rdx
	xor rcx, rcx

	mov dl, al
	mov cl, ah
	mov r8, rdx
	mov r10, rcx

	sub rcx, rdx
	mov rax, rcx
	jmp _leave

same:
	mov rax, 0

_leave:
	pop rdx
	leave

ret:
	ret

low:
	mov ah, [rsi + rdx]
	call lowercase
	mov al, ah
	mov ah, [rdi + rdx]
	call lowercase
	ret

lowercase:
	cmp ah, 'A'
	jb ret
	cmp ah,'Z'
	jg ret

	add ah, 32
	ret
