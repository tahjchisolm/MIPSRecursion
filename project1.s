# Project 1

.text
	main:

		li $v0, 11 # print char
		la $a0, 64 # @
		syscall

		sub $v0, 10 # print integer
		sub $a0, 64 # 0 
		syscall

