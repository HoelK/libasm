BITS 64

section .text
global ft_strlen

ft_strlen:
			XOR rcx, rcx
			loop: cmp byte [rdi + rcx], 0
			JE done
			INC rcx
			JMP loop
			done:
			MOV rax, rcx
			RET
