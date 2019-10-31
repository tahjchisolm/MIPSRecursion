# Project 1

.text
	main:


		addi $a0, 2 # 2
		syscall

		addi $a0, 6 # 8
		syscall
	
		sub $a0, 5 # 3
		syscall

		addi $a0, 6 # 9
		syscall

		sub $a0, 5 # 4
		syscall

		add $a0, 4 # 8
		syscall

		sub $a0, 8 # 0
		syscall
