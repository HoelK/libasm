BITS 64

section .text
global ft_strcpy

ft_strcpy:
			XOR rcx, rcx
			loop: cmp byte [rsi + rcx], 0
			JE done
			MOVZX r10, byte [rsi + rcx]
			MOV [rdi + rcx], r10
			INC rcx
			JMP loop
			done:
			MOV byte [rdi + rcx], 0
			MOV rax, rdi
			RET
