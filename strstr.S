[BITS 64]

global strstr
	;; char *strstr(const char *haystack, const char *needle)

strstr:
	push rbp
	mov rbp, rsp

	push rdi
	push rsi
	push rdx
	push rcx

	mov rax, rdi
	jmp strstr_loop

_continue:
	inc rax
	
strstr_loop:
	xor rcx, rcx
	cmp [rax], BYTE 0
	je strstr_null
	jmp strstr_same
	
_inc:
	inc rcx
	
strstr_same:
	mov dh, BYTE [rax + rcx]
	mov dl, BYTE [rsi + rcx]

	cmp dl, BYTE 0
	je strstr_end

	cmp dh, dl
	je _inc
	jne _continue

	jmp strstr_same

strstr_null:
	pop rdx
	pop rsi
	pop rdi
	xor rax, rax
	leave
	ret
	
strstr_end:
	pop rdx
	pop rsi
	pop rdi
	leave
	ret
