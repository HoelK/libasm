BITS 64

section .text
global ft_strcmp

ft_strcmp:
			xor rcx, rcx
			load_data:
			movzx r8, byte [rsi + rcx]
			movzx rax, byte [rdi + rcx]
			loop:
			cmp rax, 0
			je done
			cmp r8, 0
			je done
			cmp rax, r8
			jne done
			inc rcx
			jmp load_data
			done:
			sub rax, r8
			ret
