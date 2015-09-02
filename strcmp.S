[BITS 64]

global strcmp
	;; int strcmp(const char *s1, const char *s2)

strcmp:
	push rbp
	mov rbp, rsp

	xor rax, rax		; tmp AL | AH

	push rdx
	xor rdx, rdx		; index

strcmp_loop:
	mov ah, [rdi + rdx]
	mov al, [rsi + rdx]

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
	je strcmp_end
	inc rdx
	jmp strcmp_loop
	
incrementation:
	pop rdx
	xor rdx, rdx
	mov dl, ah
	sub ah, ah
	sub dl, al
	mov rax, rdx
	leave
	ret

decrementation:
	pop rdx
	xor rdx, rdx
	mov dl, al
	mov al, ah
	sub ah, ah
	mov r8, rax
	mov r10, rdx
	sub rax, rdx
	leave
	ret

strcmp_end:
	xor rax, rax
	pop rdx
	leave
	ret
