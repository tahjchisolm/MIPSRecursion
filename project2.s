# Project 1
#call the subprogram
#account for 0's

.data
	newline: .asciiz "\n"
	invalidMessage: .asciiz "Invalid input\n"
	myMessage: .asciiz "Enter a your string\n"
	buffer: .space 1000
.text

main:
	li $v0, 4
	la $a0, myMessage # print myMessage
	syscall
	
	li $v0, 8 # take in input
	la $a0, buffer # load byte space
	li $a1, 11 # create space for string
	move $t0, $a0 # save string to t0
	la $s2, ($t0)
	syscall

	#li $v0, 4
	#la $a0, newline # start new line
	#syscall

	li $s7, 0 # set sum to 0

looping:

	lb $a0, 0($t0) # load each char
	beq $a0, 10, subprogram # loop ends if char is null
	
	# bgt $s3, 3, invalid

	#li $v0, 1 # print char val
	#syscall

	blt $a0, 58, number
	blt $a0, 87, upper # uppercase
	bgt $a0, 96, lower # lowercase
	
exit:
	li $v0, 1
	move $a0, $s7
	syscall
	li $v0, 10 # terminate program
	syscall

back:

	#li $v0, 4
	#la $a0, newline
	#syscall

	bgt $s3, 3, invalid # 4 char 

	addi $t0, $t0, 1
	j looping

upper:
	blt $a0, 65, invalid
	#addi $a0, $a0, -55
	addi $s3, $s3, 1
	j back

lower:
	bgt $a0, 118, invalid
	#addi $a0, $a0, -87
	addi $s3, $s3, 1
	j back

number:
	blt $a0, 48, invalid
	#addi $a0, $a0, -48
	j back

invalid:
	li $v0, 4
        la $a0, invalidMessage # print Message
        syscall
	li $v0, 10 # terminate program
	syscall



	
			
subprogram:

	addi $t1, $zero, 30 # set 16 constant
	
strlen:
	lb $a0, 0($s2)
        beq $a0, 10, loop
        addi $s2, $s2, 1
        b strlen
	
	
loop:
	addi $s2, $s2, -1
	
	lb $a0, 0($s2) # load each char
	beq $a0, 10, exit # loop ends if char is null
	move $t7, $t2 # save exponent to t7
	
	beq $a0, 48, zero
	blt $a0, 58, numb
	blt $a0, 87, uppercase # uppercase
	bgt $a0, 96, lowercase # lowercase

	j sum

cont:
	addi $s2, $s2, -1
	j loop

uppercase:
	addi $a0, $a0, -55
	j convert

lowercase:
	addi $a0, $a0, -87
	j convert

numb:
	addi $a0, $a0, -30
	j convert

convert:
	beq $t2, 0, first
	beq $t7, 0, sum
	mult $t1, $t7 # base 16 times digits place
	mflo $t3
	add $t4, $t4, $t3
	addi $t7, $t7, -1 # decrease and loop
	j convert
	
first:
	add $s7, $s7, $a0
	addi $t2, $t2, 1 # increase exponent
	j cont
	
sum:
	mult $a0, $t4
	mflo $t4
	add $s7, $s7, $t4
zero:	
	addi $t2, $t2, 1 # increase exponent
	li $t4, 0 # base digits place 
	j cont
	
finished:
	jr $s7
