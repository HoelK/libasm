BITS 64

section .text
global ft_strcpy

ft_strcpy:
			xor rcx, rcx
			loop: cmp byte [rsi + rcx], 0
			je done
			mov r10, [rsi + rcx]
			mov [rdi + rcx], r10
			inc rcx
			jmp loop
			done:
			mov byte [rdi + rcx], 0
			mov rax, rdi
			ret
