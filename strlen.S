[BITS 64]

global strlen
	;; size_t strlen(const char *s)

strlen:
	push rbp
	mov rbp, rsp		; STACK FRAME

	push rdi
	push rsi
	xor rsi, rsi
	
strlen_loop:
	cmp BYTE [rdi], BYTE 0
	je strlen_end
	inc rdi
	inc rsi
	jmp strlen_loop

strlen_end:
	mov rax, rsi
	pop rsi
	pop rdi
	leave
	ret



global puts

section .rodata

back	db	10,0x01

section .text

puts:
	push rbp
	mov rbp, rsp

	push rdx
	push rdi
	push rsi

	call strlen

	mov rdx, rax
	mov rax, 1
	mov rsi, rdi
	mov rdi, 1
	syscall

	mov rax, 1
	mov rdi, 1
	mov rsi, back
	mov rdx, 1
	syscall

	pop rdx
	pop rdi
	pop rsi
	leave
	ret
