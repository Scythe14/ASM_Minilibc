[BITS 64]

global strncmp
	;; int strncmp(const char *s1, const char *s2, size_t n)

strncmp:
	push rbp
	mov rbp, rsp

	xor rax, rax		; tmp AL | AH

	push rcx
	xor rcx, rcx		; index

strncmp_loop:
	mov ah, [rdi + rcx]
	mov al, [rsi + rcx]

	cmp ah, al
	je equal

	cmp al, BYTE 0
	je incrementation
	cmp ah, BYTE 0
	je decrementation

	cmp ah, al
	jl decrementation
	jg incrementation

equal:
	cmp ah, BYTE 0
	je strncmp_end

	inc rcx

	cmp rcx, rdx
	je strncmp_end

	jmp strncmp_loop

incrementation:
	xor rcx, rcx
	xor rdx, rdx
	mov dl, ah
	sub ah, ah
	sub dl, al
	mov rax, rdx
	pop rcx
	leave
	ret

decrementation:
	xor rcx, rcx
	xor rdx, rdx
	mov dl, al
	mov al, ah
	sub ah, ah
	mov r8, rax
	mov r10, rdx
	sub rax, rdx
	pop rcx
	leave
	ret

strncmp_end:
	xor rax, rax
	pop rcx
	leave
	ret
