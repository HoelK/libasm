BITS 64

section .text
global ft_isdigit

ft_isdigit:
			MOV al, byte [rdi]
			CMP al, '0'
			JL ret_false
			CMP al, '9'
			JG ret_false

ret_true:
			MOV rax, 1
			RET

ret_false:
			MOV rax, 0
			RET

