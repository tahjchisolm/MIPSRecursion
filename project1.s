# Project 1

.text
	main:

		li $v0, 11 # print char
		la $a0, 64 # @
		syscall

		sub $v0, 10 # print integer
		sub $a0, 64 # 0 
		syscall

		addi $a0, 6 # 8
		syscall
	
		sub $a0, 5 # 3
		syscall
