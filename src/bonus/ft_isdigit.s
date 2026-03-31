BITS 64

section .text
global ft_isdigit

%define true 1
%define false 0

ft_isdigit:
			MOV rax, true
			CMP dil, '0'
			JL ret_false
			CMP dil, '9'
			JG ret_false
			RET

ret_false:
			MOV rax, false
			RET
