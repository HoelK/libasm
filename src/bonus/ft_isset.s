BITS 64

section .text
global ft_isset

ft_isset:
			XOR rcx, rcx

loop_set:
			MOV al, byte [rsi + rcx]
			CMP al, byte [rdi]
			JE ret_true
			CMP al, 0
			JMP ret_false
			INC rcx
			JMP loop_set

ret_true:
			MOV rax, 1
			RET

ret_false:
			MOV rax, 0
			RET

