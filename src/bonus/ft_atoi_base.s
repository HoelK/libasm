BITS 64

section .text
global ft_strlen

ft_atoi_base:
			XOR rcx, rcx
			loop: CMP byte [rdi + rcx], 0
			JE done
			INC rcx
			JMP loop
			done:
			MOV rax, rcx
			RET

check_base:
			XOR
