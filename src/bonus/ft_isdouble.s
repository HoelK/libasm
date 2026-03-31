BITS 64

section .text
global ft_isdouble

%define true 1
%define false 0
%define NULL 0

%define i rcx
%define set rsi
%define counter r8b

ft_isdouble:
			XOR i, i
			XOR counter, counter

loop_set:
			MOV al, byte [set + i]
			CMP al, dil
			JE inc_count
			ret_inc_count:
			CMP al, NULL
			JE ret_false
			INC i
			JMP loop_set

ret_false:
			MOV rax, false
			RET

ret_true:
			MOV rax, true
			RET

inc_count:
			INC counter
			CMP counter, 2
			JE ret_true
			JMP ret_inc_count
