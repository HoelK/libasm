BITS 64

section .text
global ft_strcmp

ft_strcmp:
			XOR rcx, rcx
			load_data:
			MOVZX r8, byte [rsi + rcx]
			MOVZX rax, byte [rdi + rcx]
			loop:
			CMP rax, 0
			JE done
			CMP r8, 0
			JE done
			CMP rax, r8
			JNE done
			INC rcx
			JMP load_data
			done:
			SUB rax, r8
			RET
